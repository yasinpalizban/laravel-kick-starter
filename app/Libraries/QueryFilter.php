<?php namespace App\Libraries;


use App\Interfaces\QueryFilterInterface;
use Illuminate\Http\Request;


class  QueryFilter implements QueryFilterInterface
{

    private int $limit;
    private int $page;
    private int $foreignKey;
    private string $filed;
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
        $this->filed = '';
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
    function getFiled(): array
    {
        $select = [];
        if ($this->filed != '') {
            $select = str_replace("\n", '', $this->filed);
            $select = explode(',', $select);
            for ($i = 0; $i <= count($select) - 1; $i++) {
                $select[$i] = trim($select[$i], " ");
            }
        }
        return $select;
    }

    public
    function getWhereStatement(): array
    {
        return $this->whereStatement;
    }
}
