<?php

namespace App\Libraries;


use Symfony\Component\HttpKernel\Exception\HttpException;

class MainService
{
    protected int $nestId;

    public function __construct()
    {
        $this->nestId = 0;
    }

    protected function httpException(   $code,$message, $body = null): void
    {


        try {

            throw new HttpException($code, $message);

        } catch (\Exception $e) {

            header("HTTP/1.1 {$code} {$message}");
            $json = json_encode( !is_null($body)? ['error' => $body]:[]);
            echo $json;
        }

        exit();
    }

    public function setNestId($nestId): MainService
    {
        $this->nestId = $nestId;
        return $this;
    }

}
