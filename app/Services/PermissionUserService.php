<?php


namespace App\Services;


use App\Entities\PermissionUserEntity;
use App\Filters\PermissionUserFilter;
use App\Http\Resources\PermissionUserCollection;
use App\Http\Resources\PermissionUserResource;
use App\Libraries\MainService;
use App\Models\PermissionUserModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class PermissionUserService extends MainService
{
    private PermissionUserModel $model;

    public function __construct()
    {
        parent::__construct();
        $this->model = new  PermissionUserModel();
    }


    public function index(PermissionUserFilter $permissionUserFilter)
    {

        if ($this->nestId != 0) {
            $whereClause[] = ['auth_users_permissions.permission_id', '=', $this->nestId];
        } else {
            $whereClause = $permissionUserFilter->getWhereStatement();
        }

        $select = empty ($permissionUserFilter->getFiled()) ? [
            'auth_users_permissions.*',
            'users.username',
            'users.first_name as firstName',
            'users.last_name as lastName',
            'auth_permissions.name as permission'
        ] : $permissionUserFilter->getFiled();

        $data['data'] = $this->model->select($select)->where($whereClause)
            ->leftJoin('users', 'users.id', '=', 'auth_users_permissions.user_id')
            ->leftJoin('auth_permissions', 'auth_permissions.id', '=', 'auth_users_permissions.permission_id')
            ->offset($permissionUserFilter->getPage())
            ->limit($permissionUserFilter->getLimit())
            ->orderBy('auth_users_permissions.' . $permissionUserFilter->getSort(), $permissionUserFilter->getOrder())
            ->get();


        $data ['pager'] = paginationFields($permissionUserFilter->getLimit(), $permissionUserFilter->getPage(), $this->model->count());

        return new  PermissionUserCollection($data);
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
        select(['auth_users_permissions.*',
            'users.username',
            'users.first_name as firstName',
            'users.last_name as lastName',
            'auth_permissions.name as permission'])->
        leftJoin('auth_permissions', 'auth_permissions.id', '=', 'auth_users_permissions.permission_id')->
        leftJoin('users', 'users.id', '=', 'auth_users_permissions.user_id')
            ->where('auth_users_permissions.id', $id)->get();

        if (is_null($result)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND, __('api.commons.exist'));
       // $this->model->findOrFail($id)
        $result = new PermissionUserResource($result[0]);
        return [
            'data' => $result
        ];

    }


    public function create(PermissionUserEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        if (!$this->model->create($entity->getArray())) {

            throw new HttpException(ResponseAlias::HTTP_BAD_REQUEST, __('Shared.api.reject'));

        }


    }


    public function update($id, PermissionUserEntity $entity)
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
