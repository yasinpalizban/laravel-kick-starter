<?php


namespace App\Http\Middleware;

use Closure;

class ContentNegotiationMiddleware
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

        $lang=$request->server('HTTP_ACCEPT_LANGUAGE');
        if(isset($lang) && ($lang != '')){
            $request->setLocale(  $lang);
        }


//
//
//        $lang = $request->getPreferredLanguage([LanguageType::En, LanguageType::Fa]);
//        $encode = $request->getEncodings();
//        $char = $request->getCharsets();
//
//
//        if (!$lang) {
//            return response()->json([
//                'error' => __('Commmon.filter.contentLang'),
//                'type' => FilterErrorType::Content])
//                ->setStatusCode(ResponseAlias::HTTP_BAD_REQUEST, __('middleWear.contentLang'));
//
//        }
//
//        if (!$encode) {
//            return response()->json([
//                'error' => __('Commmon.filter.contentEncode'),
//                'type' => FilterErrorType::Content])
//                ->setStatusCode(ResponseAlias::HTTP_BAD_REQUEST, __('middleWear.contentEncode'));
//
//        }
//
//        if (!$char) {
//            return response()->json([
//                'error' => __('Commmon.filter.contentChar'),
//                'type' => FilterErrorType::Content])
//                ->setStatusCode(ResponseAlias::HTTP_BAD_REQUEST, __('middleWear.contentChar'));
//
//        }


        return $next($request);
    }
}
