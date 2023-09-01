<?php

namespace App\Services;

use App\Http\Resources\SettingResource;
use App\Interfaces\HomeServiceInterface;
use App\Libraries\MainService;
use App\Models\SettingModel;



class HomeService extends MainService implements HomeServiceInterface
{


    private SettingModel $settingModel;

    private string $language;

    public function __construct()
    {
        parent::__construct();


        $this->settingModel = new SettingModel();
        $this->language = "";


    }

    public function setLanguage(string $language)
    {


        $this->language = $language;
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



}
