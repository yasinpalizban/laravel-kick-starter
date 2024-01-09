<?php


namespace App\Services;

use App\Entities\GroupEntity;
use App\Filters\GroupFilter;
use App\Http\Resources\GroupCollection;
use App\Http\Resources\GroupResource;
use App\Libraries\MainService;
use App\Models\GroupModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class GroupService extends MainService
{
    private GroupModel $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  GroupModel();
    }

    public function index(GroupFilter $groupFilter)
    {


        $data['data'] = $this->model
            ->where($groupFilter->getWhereStatement())->
        limit($groupFilter->getLimit())
            ->offset($groupFilter->getPage())
            ->orderBy($groupFilter->getSort(), $groupFilter->getOrder())
            ->get();


        $data ['pager'] = paginationFields($groupFilter->getLimit(), $groupFilter->getPage(), $this->model->count());

        return new GroupCollection( $data);
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

        $result = new GroupResource($this->model->findOrFail($id));

        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.exist'));

        return [
            'data' => $result,
        ];

    }


    public function create(GroupEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        if (!$this->model->create($entity->getArray())) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('Shared.api.reject'));

        }


    }


    public function update($id, GroupEntity $entity)
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
