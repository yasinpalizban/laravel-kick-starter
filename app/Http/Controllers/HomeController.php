<?php

namespace App\Http\Controllers;

;

use App\Interfaces\HomeControllerInterface;
use App\Libraries\UrlAggregation;
use App\Services\ContactService;
use App\Services\HomeService;
use App\Services\JobCategoryService;
use App\Services\JobPostService;
use App\Services\JobPriceService;
use App\Services\JobStateService;
use App\Services\JobSubCategoryService;
use App\Services\NewsCategoryService;
use App\Services\NewsCommentService;
use App\Services\NewsPostService;
use App\Services\VisitorService;
use Illuminate\Http\Request;
use Pusher\Pusher;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;

class HomeController extends BaseController implements HomeControllerInterface
{

  public function index(Request $request){
      return Response()->json(['home'])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));
  }



    public function views(Request $request, HomeService $homeService)
    {




        $homeService->setLanguage($request->getLocale());
        $data = $homeService->views();

        return Response()->json(['viewPost' => $data])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    public function settings(Request $request, HomeService $homeService)
    {

        $data = $homeService->settings();


        return Response()->json(['settingPost' => $data])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));


    }

    public function visitor(Request $request, VisitorService $visitorService)
    {

        $userInfo['os'] = $request->userAgent() ?? 'n/a';;
        $userInfo['ip'] = $request->getClientIp() ?? 'n/a';
        $userInfo['country'] = 'n/a';
        $userInfo['city'] = 'n/a';
        $userInfo['lat'] = 'n/a';
        $userInfo['lang'] = 'n/a';
        $visitorEntity = new \App\Entities\VisitorEntity($userInfo);

        $visitorEntity->createdAt();
        $visitorService->create($visitorEntity);


        return Response()->json([])->setStatusCode(ResponseAlias::HTTP_CREATED,__('api.commons.save'));

    }

    /**
     * create function
     * @method : POST
     */
    public function contact(Request $request, ContactService $contactService)
    {


        $rules = [
            'phone' => 'required|max:11',
            'title' => 'required|max:255',
            'email' => 'required|email:rfc,dns|max:255',
            'message' => 'required|max:255',
            'name' => 'required|max:255',
        ];

       $fields= $request->validate($rules);



        $contactEntity = new \App\Entities\ContactEntity($fields);

        $contactEntity->createdAt()->disableStatus();

        $contactService->create($contactEntity);

        $sharedConfig = new \App\Config\ModuleSharedConfig();
        $pusher = new Pusher(
            $sharedConfig->pusher['authKey'],
            $sharedConfig->pusher['secret'],
            $sharedConfig->pusher['appId'],
            ['cluster' => $sharedConfig->pusher['cluster'],
                'useTLS' => $sharedConfig->pusher['useTLS']]
        );
        $data['type'] = \App\Enums\NotificationType::NewContact;
        $data['message'] = ' you got new  contact';
        $data['counter'] = 1;
        $data['date'] = date('Y-m-d H:i:s', time());;
        $pusher->trigger('notification-channel', 'my-event', $data);

        return Response()->json([])->setStatusCode(ResponseAlias::HTTP_CREATED,__('api.commons.save'));

    }

    /**
     * index function
     * @method : GET
     */
    public function news(Request $request, NewsPostService $newsPostService)
    {

        $newsPostEntity = new \App\Entities\NewsPostEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($newsPostEntity->getDataMap());
        $newsPostService->setLanguage($request->getLocale());
        $findAllData = $newsPostService->index($urlAggregation);

        return Response()->json(['newsPost' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }

    /**
     * index function
     * @method : GET
     */
    public function newsCategory(Request $request, NewsCategoryService $newsCategoryService)
    {

        $newsCategoryEntity = new \App\Entities\NewsCategoryEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($newsCategoryEntity->getDataMap());
        $newsCategoryService->setLanguage($request->getLocale());
        $findAllData = $newsCategoryService->index($urlAggregation);

        return Response()->json(['newsCategory' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * show function
     * @method : GET with params ID
     */
    public function newsShow(Request $request, NewsPostService $newsPostService,$id = null)
    {



        $newsPostService->incrementVisit($id);
        $findOneData = $newsPostService->show($id);


        return Response()->json(['newsPost' => $findOneData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * index function
     * @method : GET
     */
    public function newsComment(Request $request, NewsCommentService $newsCommentService)
    {

        $newsCommentEntity = new \App\Entities\NewsCommentEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($newsCommentEntity->getDataMap());

        $findAllData = $newsCommentService->index($urlAggregation);

        return Response()->json(['newsComment' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * index function
     * @method : views
     */
    public function advertisements(Request $request, HomeService $homeService)
    {


        $data = $homeService->advertisements();


        return Response()->json(['advertisementPost' => $data])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }





    /**
     * index function
     * @method : GET
     */
    public function job(Request $request, JobPostService $jobPostService)
    {

        $jobPostEntity = new \App\Entities\JobPostEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($jobPostEntity->getDataMap());
        $jobPostService->setLanguage($request->getLocale());
        $findAllData = $jobPostService->index($urlAggregation);

        return Response()->json(['jobPost' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }

    /**
     * index function
     * @method : GET
     */
    public function jobCategory(Request $request, JobCategoryService $jobCategoryService)
    {

        $jobCategoryEntity = new \App\Entities\JobCategoryEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($jobCategoryEntity->getDataMap());
        $jobCategoryService->setLanguage($request->getLocale());
        $findAllData = $jobCategoryService->index($urlAggregation);

        return Response()->json(['jobCategory' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }
    /**
     * index function
     * @method : GET
     */
    public function jobSubCategory(Request $request, JobSubCategoryService $jobSubCategoryService)
    {

        $jobSubCategoryEntity = new \App\Entities\JobSubCategoryEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $jobSubCategoryService->setLanguage($request->getLocale());
        $urlAggregation->dataMap($jobSubCategoryEntity->getDataMap());
        $findAllData = $jobSubCategoryService->index($urlAggregation);

        return Response()->json(['jobSubCategory' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * index function
     * @method : GET
     */
    public function jobState(Request $request, JobStateService $jobStateService)
    {

        $jobStateEntity = new \App\Entities\JobStateEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($jobStateEntity->getDataMap());
        $jobStateService->setLanguage($request->getLocale());
        $findAllData = $jobStateService->index($urlAggregation);

        return Response()->json(['jobState' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * show function
     * @method : GET with params ID
     */
    public function jobShow(Request $request, JobPostService $jobPostService, $id = null)
    {



        $jobPostService->incrementVisit($id);
        $findOneData = $jobPostService->show($id);


        return Response()->json(['jobPost' => $findOneData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }


    /**
     * index function
     * @method : GET
     */
    public function jobPrice(Request $request, JobPriceService $jobPriceService)
    {

        $jobCategoryEntity = new \App\Entities\JobPriceEntity(null);
        $urlAggregation = new UrlAggregation($request);
        $urlAggregation->dataMap($jobCategoryEntity->getDataMap());
        $jobPriceService->setLanguage($request->getLocale());
        $findAllData = $jobPriceService->index($urlAggregation);

        return Response()->json(['jobPrice' => $findAllData
        ])->setStatusCode(ResponseAlias::HTTP_OK,__('api.commons.receive'));

    }
}




