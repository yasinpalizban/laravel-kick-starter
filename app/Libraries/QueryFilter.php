<?php namespace App\Libraries;


use App\Interfaces\QueryFilterInterface;
use Illuminate\Http\Request;


class  QueryFilter implements QueryFilterInterface
{

    private int $limit;
    private int $page;
    private int $foreignKey;
    private string $order;
    private string $sort;

    private $whereStatement = [];
    protected $safeParms = [];
    protected $cloumnMap = [];
    protected $operatorMap = [];

    public function __construct()
    {
        $this->foreignKey = 0;
        $this->sort = 'id';
        $this->order = 'desc';
        $this->page = 1;
        $this->limit = 10;
        $this->operatorMap = [
            'gt' => '>',
            'gte' => '>=',
            'lt' => '<',
            'lte' => '<=',
            'eq' => '=',
            'ne' => '!=',
            'lik' => '%',

        ];
    }

    public function navigation(Request $request): QueryFilter
    {

        $this->sort = $request->get('sort') ?? 'id';
        $this->order = $request->get('order') ?? 'desc';
        $this->page = $request->get('page') ?? 1;
        $this->limit = $request->get('limit') ?? 10;
        $this->filed = $request->get('filed') ?? '';
        $this->filed = $request->get('filed') ?? '';
        $this->foreignKey = $request->get('foreignKey') ?? 0;


        return $this;
    }


    public function transform(Request $request): QueryFilter
    {

        foreach ($this->safeParms as $parm => $operators) {
            $query = $request->query($parm);

            if (!isset($query)) {
                continue;
            }

            $column = $this->cloumnMap[$parm] ?? $parm;


            foreach ($operators as $operator) {

                if (isset($query[$operator])) {


                    $this->whereStatement[] = $this->operatorMap[$operator] == '%' ? [$column, 'like', '%' . $query[$operator] . '%'] : [$column, $this->operatorMap[$operator], $query[$operator]];
                }
            }
        }
        return $this;
    }


    public
    function getSort(): string
    {
        $text = preg_replace(['/([a-z\d])([A-Z])/', '/([^_])([A-Z][a-z])/'], '$1_$2', $this->sort);
        return strtolower($text);
    }

    public
    function getOrder(): string
    {
        return $this->order;
    }

    public
    function getPage(): int
    {

        return ($this->page - 1) * $this->limit;
    }

    public
    function getLimit(): int
    {
        return $this->limit;
    }

     public
     function getForeignKey(): int
     {
         return $this->foreignKey;
     }

    public
    function getWhereStatement(string $table = ''): array
    {

        if (!is_null($table)) {
            for ($i = 0; $i < count($this->whereStatement); $i++) {
                $this->whereStatement[$i][0] = $table . '.' . $this->whereStatement[$i][0];
            }
        }
        return $this->whereStatement;
    }
}
