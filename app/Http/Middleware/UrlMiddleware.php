<?php


namespace App\Http\Middleware;

use Closure;

class UrlMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {

        $uri = $request->getRequestUri();

        $pathArray = array();
        if (strlen($uri) > 1) {
            $pathArray = explode('/', $uri);
        }


//        if (count($pathArray) <= 1) {
//            return response()->json([
//                'error' => __('middleWear.url'),
//                'type' => FilterErrorType::Url])
//                ->setStatusCode(ResponseAlias::HTTP_BAD_REQUEST, __('middleWear.url'));
//        }
//
//        if (!in_array('api', $pathArray) && !in_array('storage', $pathArray)&& !in_array('public', $pathArray)) {
//
//            return response()->json([
//                'error' => __('middleWear.url'),
//                'type' => FilterErrorType::Url])
//                ->setStatusCode(ResponseAlias::HTTP_BAD_REQUEST, __('middleWear.url'));
//
//        }



        return $next($request);
    }
}
