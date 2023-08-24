<?php

namespace App\Models;


use App\Interfaces\AggregationInterface;
use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Aggregation extends Model implements AggregationInterface
{


    public function __construct(array $attributes = [])
    {
        parent::__construct($attributes);

    }


    public function aggregatePagination(array $pipeLine)
    {


        if (empty($pipeLine)) {
            throw  new Exception(' aggregate pile line can not be empty');
        }


        $builder = DB::table($this->table);
        if (isset($pipeLine['select'])) {
            $select = str_replace("\n", '', $pipeLine['select']);
            $select = explode(',', $select);
            for ($i = 0; $i <= count($select) - 1; $i++) {
                $select[$i] = trim($select[$i], " ");
            }

            $builder->select($select);
        }


        if (isset($pipeLine['join'])) {
            foreach ($pipeLine['join'] as $item) {
                if ($item['mode'] == 'left') {
                    $builder->leftJoin($item['table'], $item['arg1'], $item['condition'], $item['arg2']);
                } else if ($item['mode'] == 'right') {
                    $builder->rightJoin($item['table'], $item['arg1'], $item['condition'], $item['arg2']);
                } else {
                    $builder->join($item['table'], $item['arg1'], $item['condition'], $item['arg2']);
                }

            }

        }

        if (isset($pipeLine['whereIn'])) {
            $builder->whereIn($pipeLine['whereIn']['key'], $pipeLine['whereIn']['value']);
        }
        if (isset($pipeLine['whereNotIn'])) {
            $builder->whereNotIn($pipeLine['whereNotIn']['key'], $pipeLine['whereNotIn']['value']);
        }
        if (isset($pipeLine['orWhereIn'])) {
            $builder->orWhereIn($pipeLine['orWhereIn']['key'], $pipeLine['orWhereIn']['value']);
        }
        if (isset($pipeLine['orWhereNotIn'])) {
            $builder->orWhereNotIn($pipeLine['orWhereNotIn']['key'], $pipeLine['orWhereNotIn']['value']);
        }


        if (isset($pipeLine['where'])) {

            $builder->where($pipeLine['where']);
        }
        if (isset($pipeLine['orWhere'])) {

            $builder->orWhere($pipeLine['orWhere']);
        }

        if (isset($pipeLine['like'])) {
            $pipeLine['like'] = $this->likePerpetration($pipeLine['like']);
            $builder->where($pipeLine['like']);
        }
        if (isset($pipeLine['orLike'])) {
            $pipeLine['orLike'] = $this->likePerpetration($pipeLine['orLike']);
            $builder->orWhere($pipeLine['orLike']);
        }


        if (isset($pipeLine['groupBy'])) {
            $builder->groupBy($pipeLine['groupBy']);
        }
        if (isset($pipeLine['having'])) {
            $builder->having($pipeLine['having']);
        }
        if (isset($pipeLine['orHaving'])) {
            $builder->orHaving($pipeLine['orHaving']);
        }
        if (isset($pipeLine['havingRaw'])) {
            $builder->havingRaw($pipeLine['orHaving']);
        }
        if (isset($pipeLine['orHavingRaw'])) {
            $builder->orHavingRaw($pipeLine['orHaving']);
        }


        if (isset($pipeLine['sort']) && isset($pipeLine['order'])) {
            $builder->orderBy($pipeLine['sort'], $pipeLine['order']);
        }

        if (isset($pipeLine['limit'])) {
            $builder->limit($pipeLine['limit']);
        }


        if (isset($pipeLine['page'])) {
            $offSet = ($pipeLine['page'] - 1) * $pipeLine['limit'];
            $builder->offset($offSet);
        }
        try {

            $data['data'] = $builder->get();
            $builder->offset(0);
            $data ['pager'] = paginationFields($pipeLine['limit'], $pipeLine['page'], $builder->count());
        } catch (\Exception $e) {
            throw new Exception($e->getMessage(), '500');
        }
        return $data;

    }

    private function likePerpetration(mixed $like)
    {
        $value = 0;
        for ($i = 0; $i < count($like); $i++) {

            if ($i == 0) {
                $value = $like[$i][1];
            }
            $like[$i][1] = 'like';
            $like[$i][2] = '%' . $value . '%';
        }

        return $like;
    }


}
