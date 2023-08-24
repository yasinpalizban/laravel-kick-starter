<?php

namespace App\Services;

use App\Http\Resources\AdvertisementCollection;
use App\Http\Resources\SettingResource;
use App\Http\Resources\ViewMediaCollection;
use App\Interfaces\HomeServiceInterface;
use App\Libraries\MainService;
use App\Models\AdvertisementModel;
use App\Models\NewsPostModel;
use App\Models\SettingModel;
use App\Models\ViewOptionModel;


class HomeService extends MainService implements HomeServiceInterface
{

    private NewsPostModel $newsPostModel;
    private ViewOptionModel $viewOptionModel;
    private SettingModel $settingModel;
    private AdvertisementModel $advertisementModel;
    private string $language;

    public function __construct()
    {
        parent::__construct();

        $this->newsPostModel = new NewsPostModel();
        $this->viewOptionModel = new ViewOptionModel();
        $this->settingModel = new SettingModel();
        $this->language = "";
        $this->advertisementModel = new AdvertisementModel();

    }

    public function setLanguage(string $language)
    {


        $this->language = $language;
    }


    public function views()
    {


        $data = [
            'banner' => new ViewMediaCollection( $this->viewOptionModel->select('view_media.*','view_option.name')
                ->leftJoin('view_media', 'view_media.view_option_id','=','view_option.id')
                ->orderBy('view_option.id')
                ->where([
                    'view_option.name' => 'banner',
                    'view_media.language' => $this->language
                ])->get()),
            'about' =>  new ViewMediaCollection($this->viewOptionModel->select('view_media.*')
                ->leftJoin('view_media', 'view_media.view_option_id','=','view_option.id')
                ->orderBy('view_option.id')
                ->where([
                    'view_option.name' => 'about',
                    'view_media.language' => $this->language
                ])->get()),

        ];

        return $data;

    }

    /**
     * show function
     * @method : GET with params ID
     * @return array
     */
    public function settings(): array
    {
        $data = [
            'instagram' => new SettingResource( $this->settingModel->where('key', 'instagram')->get()[0]),
            'facebook' =>new SettingResource(  $this->settingModel->where('key', 'facebook')->get()[0]),
            'twitter' =>new SettingResource(  $this->settingModel->where('key', 'twitter')->get()[0]),
            'googlePlus' =>new SettingResource(  $this->settingModel->where('key', 'googlePlus')->get()[0]),
            'phone' =>new SettingResource(  $this->settingModel->where('key', 'phone')->get()[0]),
            'address' =>new SettingResource(  $this->settingModel->where('key', 'address')->get()[0]),
            'email' => new SettingResource( $this->settingModel->where('key', 'email')->get()[0]),
            'linkLocation' => new SettingResource( $this->settingModel->where('key', 'linkLocation')->get()[0]),

        ];


        return $data;
    }


    /**
     * show function
     * @method : GET with params ID
     * @return array
     */
    public function advertisements(): array
    {

        $sideOne = $this->advertisementModel->select('advertisement.*')
            ->leftJoin('advertisement_media', 'advertisement_media.advertisement_id', '=', 'advertisement.id')
            ->where(['advertisement.name' => 'advertisementOne'])
            ->orderBy('advertisement.id')
            ->get();

        $sideTwo = $this->advertisementModel->select('advertisement.*')
            ->leftJoin('advertisement_media', 'advertisement_media.advertisement_id', '=', 'advertisement.id')
            ->where(['advertisement.name' => 'advertisementTwo'])
            ->orderBy('advertisement.id')
            ->get();

        $sideThree = $this->advertisementModel->select('advertisement.*')
            ->leftJoin('advertisement_media', 'advertisement_media.advertisement_id', '=', 'advertisement.id')
            ->where(['advertisement.name' => 'advertisementThree'])
            ->orderBy('advertisement.id')
            ->get();

        $sideOne = $this->advertisementModel->appendChildrenRows($sideOne);
        $sideTwo = $this->advertisementModel->appendChildrenRows($sideTwo);
        $sideThree = $this->advertisementModel->appendChildrenRows($sideThree);

        $sideOne = new AdvertisementCollection($sideOne);
        $sideTwo = new AdvertisementCollection($sideTwo);
        $sideThree = new AdvertisementCollection($sideThree);

        $data = [
            'sideOne' => $sideOne[0],
            'sideTwo' => $sideTwo[0],
            'sideThree' => $sideThree[0],

        ];


        return $data;
    }


}
