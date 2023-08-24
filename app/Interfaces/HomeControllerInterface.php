<?php

namespace App\Interfaces;



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

interface HomeControllerInterface
{

    public function settings(Request $request, HomeService $homeService);

    public function visitor(Request $request, VisitorService $visitorService);

    public function views(Request $request, HomeService $homeService);

    public function contact(Request $request, ContactService $contactService);

    public function news(Request $request, NewsPostService $newsPostService);

    public function newsCategory(Request $request, NewsCategoryService $newsCategoryService);

    public function newsShow(Request $request, NewsPostService $newsPostService,$id=null);

    public function newsComment(Request $request, NewsCommentService $newsCommentService);

    public function advertisements(Request $request, HomeService $homeService);



    public function job(Request $request, JobPostService $JobPostService);

    public function jobCategory(Request $request, JobCategoryService $JobPostService);

    public function jobSubCategory(Request $request, JobSubCategoryService $JobSubCategoryService);

    public function jobState(Request $request, JobStateService $jobStateService);

    public function jobShow(Request $request, JobPostService $newsPostService,$id=null);

    public function jobPrice(Request $request, JobPriceService $jobPriceService);




}
