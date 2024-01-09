<?php


namespace App\Services;



use App\Entities\PermissionEntity;
use App\Filters\PermissionFilter;
use App\Http\Resources\PermissionCollection;
use App\Http\Resources\PermissionResource;
use App\Libraries\MainService;
use App\Models\PermissionModel;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\HttpKernel\Exception\HttpException;

class PermissionService extends  MainService
{
    private  PermissionModel $model;

    public function __construct()
    {        parent::__construct();
        $this->model = new  PermissionModel();
    }


    public function index( PermissionFilter $permissionFilter)
    {

        $data['data'] = $this->model->where($permissionFilter->getWhereStatement())->
        limit($permissionFilter->getLimit())
            ->offset($permissionFilter->getPage())
            ->orderBy($permissionFilter->getSort(), $permissionFilter->getOrder())
            ->get();
        $data ['pager'] = paginationFields($permissionFilter->getLimit(), $permissionFilter->getPage(), $this->model->count());

        return new PermissionCollection( $data);

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

        $result =  new  PermissionResource( $this->model->findOrFail($id));

        if (is_null($result)) throw new HttpException( ResponseAlias::HTTP_NOT_FOUND,__('api.commons.exist'));

        return [
            'data' => $result,
        ];

    }


    public function create(PermissionEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));


        if (!$this->model->create($entity->getArray())) {

            throw new HttpException( ResponseAlias::HTTP_BAD_REQUEST,__('Shared.api.reject'));

        }



    }


    public function update($id , PermissionEntity $entity)
    {
        if (is_null($entity)) throw new HttpException(ResponseAlias::HTTP_CONFLICT, __('api.commons.reject'));

        $this->model->where('id',$id)->update( $entity->getArray());

    }

    /**
     * edit function
     * @method : DELETE with params ID
     * @param $id
     */
    public function delete($id )
    {

        $deleteById = $this->model->find($id);

        if (is_null($deleteById)) throw new HttpException(ResponseAlias::HTTP_NOT_FOUND,__('api.commons.reject'));

        $this->model->destroy($id);


    }
    public function getInsertId()
    {
        return $this->model->latest('id')->first()->id;
    }
}
