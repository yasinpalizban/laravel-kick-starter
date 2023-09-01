<?php


namespace App\Services;


use App\Entities\PermissionGroupEntity;
use App\Filters\PermissionGroupFilter;
use App\Http\Resources\PermissionGroupCollection;
use App\Libraries\MainService;
use App\Models\PermissionGroupModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class PermissionGroupService extends MainService
{
    private PermissionGroupModel $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  PermissionGroupModel();

    }


    public function index(PermissionGroupFilter $permissionGroupFilter)
    {

        if ($this->nestId != 0) {
            $whereclause = [['auth_groups_permissions.permission_id', '=', $this->nestId]];
        } else {
            $whereClause = $permissionGroupFilter->getWhereStatement();
        }

        $select = empty ($permissionGroupFilter->getFiled()) ? ['auth_groups_permissions.*',
            'auth_groups.name as group',
            'auth_permissions.name as permission'] : $permissionGroupFilter->getFiled();

        $data['data'] = $this->model->select($select)->where($whereClause)
            ->leftJoin('auth_groups', 'auth_groups.id', '=', 'auth_groups_permissions.group_id')
            ->leftJoin('auth_permissions', 'auth_permissions.id', '=', 'auth_groups_permissions.permission_id')
            ->offset($permissionGroupFilter->getPage())
            ->limit($permissionGroupFilter->getLimit())
            ->orderBy('auth_groups_permissions.' . $permissionGroupFilter->getSort(), $permissionGroupFilter->getOrder())
            ->get();


        $data ['pager'] = paginationFields($permissionGroupFilter->getLimit(), $permissionGroupFilter->getPage(), $this->model->count());

        return new PermissionGroupCollection($data);
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

        $result = $this->model->
        select(['auth_groups_permissions.*',
            'auth_groups.name as group',
            'auth_permissions.name as permission',])->
        leftJoin('auth_groups', 'auth_groups.id', '=', 'auth_groups_permissions.group_id')->
        leftJoin('auth_permissions', 'auth_permissions.id', '=', 'auth_groups_permissions.permission_id')->


        where('auth_groups_permissions.id', $id)->get();

        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.exist'));

        return [
            'data' => new PermissionGroupCollection($result)
        ];

    }


    public function create(PermissionGroupEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        if (!$this->model->create($entity->getArray())) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('Shared.api.reject'));

        }


    }


    public function update($id, PermissionGroupEntity $entity)
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
