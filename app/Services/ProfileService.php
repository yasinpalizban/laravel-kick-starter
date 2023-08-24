<?php


namespace App\Services;


use App\Config\ModuleAppConfig;
use App\Config\ModuleCommonConfig;
use App\Entities\UserEntity;
use App\Http\Resources\ProfileResource;
use App\Libraries\MainService;
use App\Models\UserModel;
use Illuminate\Support\Facades\Storage;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class ProfileService extends MainService
{
    private UserModel $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  UserModel();
    }


    /**
     * show function
     * @method : GET with params ID
     * @param $id
     * @return array
     */
    public function show($id)
    {
        if (is_null($id)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $result = $this->model->findOrFail($id);

        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.exist'));

        return ['data' => new ProfileResource($result)];

    }


    public function update($id, UserEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.validation'));
        $userData = $this->model->where('id', $id)->get();

        $customConfig = new ModuleAppConfig();
        if (isset($entity->image) && $userData[0]->image != $customConfig->defaultUserProfile) {
            Storage::delete($userData[0]->image);
        }

        $this->model->where('id', $id)->update($entity->getArray());


    }


}
