<?php
function serializeMessages($data): string
{

    $line = " ";
    foreach ($data as $item) {
        $line .= $item;
        $line .= "\n ";

    }

    return $line;
}

function compareDates($first, $second): bool
{


    if (isset($first) and count($first[0]) > 0) {
        $first = strtotime($first[0]['start_date']);
        $second = strtotime($second[0]['end_date']);
        if ($first < $second) {
            return true;
        } else {
            return false;
        }
    }
    return false;
}

function stopIt($test)
{

    header("HTTP/1.1  409 miniResponse");
    $json = json_encode([
        'null' => is_null($test),
        'obj' => is_object($test),
        'array' => is_array($test),
        'empty' => empty($test),
        'test' => $test,

    ]);
    echo $json;
    exit();
}


function showIt($test = 'nothing')
{

    header("HTTP/1.1  409 miniResponse");
    $json = json_encode($test);
    echo $json;
    exit();
}





function showError($test = 'nothing')
{

    header("HTTP/1.1  409 miniResponse");
    $json = json_encode($test);
    print_r(['error' => $json]);
    exit();
}



function paginationFields($limit, $nowPage, $total)
{
    $nowPage = floor($nowPage/ $limit);
    $pages =ceil( $total / $limit);

    return [
        'hasMore' => ($pages > $nowPage),
        'total' => $total,
        'perPage' => $limit,
        'pageCount' => $pages,
        'currentPage' => $nowPage,
        'next' => ($pages > $nowPage) ? $nowPage + 1 : $nowPage,
        'previous' => ($pages < $nowPage) ? $nowPage - 1 : $nowPage - 1,

    ];


}
function toObject($array): array
{
    $box = array();
    $count = 0;
    foreach ($array as $item) {
        $box[$count] = $item;
        $count++;
    }

    return $box;

}
