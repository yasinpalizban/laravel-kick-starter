<?php

namespace App\Exceptions;

use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
//    public function register(): void
//    {
//        $this->reportable(function (Throwable $e) {
//            //
//        });
//    }

    public function register():void
    {
//        $this->reportable(function (Throwable $ez) {
//            //
//        });
        // reportable
// return response()->json( $e->getMessage())->setStatusCode( $e->getCode() ?: 400);
//


        $this->renderable(function (Throwable $e, $request) {

            if ($request->is('api/*')) {


                return response()->json([
                    'error'=>$e->getMessage(),
                    'code'=>$e->getCode(),
                    'file'=>$e->getFile(),
                    'line'=>$e->getLine(),
                    'trace'=>$e->getTrace(),
                ], ($e->getCode()==0 || $e->getCode()=="0" )? 403 :500);

//
//                if($e->getCode()!=0 || $e->getCode()!="0"  ){
//                  //ResponseAlias::HTTP_NOT_ACCEPTABLE
//                    return response()->json([
//                        'error'=>$e->getMessage(),
//                    ], $e->getCode());
//                }else{
//                    return response()->json([
//                        'error'=>$e->getMessage(),
//                        'file'=>$e->getFile(),
//                        'line'=>$e->getLine(),
//                        'trace'=>$e->getTrace(),
//                    ], 500);
//                }

            }

        });

    }
}
