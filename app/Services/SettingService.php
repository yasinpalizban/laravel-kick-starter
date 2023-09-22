<?php


namespace App\Services;


use App\Entities\SettingEntity;
use App\Filters\SettingFilter;
use App\Http\Resources\SettingCollection;
use App\Http\Resources\SettingResource;
use App\Libraries\MainService;
use App\Models\SettingModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class SettingService extends MainService
{
    private SettingModel $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  SettingModel();
    }


    public function index(SettingFilter $settingFilter)
    {
        $select = empty ($settingFilter->getFiled()) ? ['*'] : $settingFilter->getFiled();

        $data['data'] = $this->model->select($select)
            ->where($settingFilter->getWhereStatement())->
            limit($settingFilter->getLimit())
            ->offset($settingFilter->getPage())
            ->orderBy($settingFilter->getSort(), $settingFilter->getOrder())
            ->get();


        $data ['pager'] = paginationFields($settingFilter->getLimit(), $settingFilter->getPage(), $this->model->count());

        return new SettingCollection($data);

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

        //  $result = $this->model->where('id', $id)->get();
        $result = new SettingResource($this->model->findOrFail($id));
        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.exist'));

        return [
            'data' => $result,
        ];

    }


    public function create(SettingEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        if (!$this->model->create($entity->getArray())) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('api.commons.reject'));

        }


    }


    public function update($id, SettingEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $this->model->where('id', $id)->update($entity->getArray());

    }

    /**
     * edit function
     * @method : DELETE with params ID
     * @param $id
     */
    public function delete($id)
    {

        $deleteById = $this->model->find($id);

        if (is_null($deleteById)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.reject'));

        $this->model->destroy($id);


    }

    public function getInsertId()
    {
        return $this->model->latest('id')->first()->id;
    }
}
