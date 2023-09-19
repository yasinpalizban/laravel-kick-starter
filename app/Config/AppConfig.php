<?php namespace App\Config;



use App\Libraries\BaseConfig;

class AppConfig extends BaseConfig
{
    /*
  *---------------------------------------------------------------
   *  x directory
   *---------------------------------------------------------------

   */

    public $resumeDirectory = 'public/upload/resume';
    /*
              *---------------------------------------------------------------
              *  defaul tUser Profile
              *---------------------------------------------------------------

              */
    public $defaultUserProfile = 'public/upload/profile/default-avatar.jpg';
    /*
        *---------------------------------------------------------------
        *  advertisement directory
        *---------------------------------------------------------------

        */
    public $advertiseDirectory = [
        'image' => 'public/upload/advertisement/image',
        'video' => 'public/upload/advertisement/video'
    ];

    /*
          *---------------------------------------------------------------
          *  chat private directory
          *---------------------------------------------------------------

          */
    public $chatPrivateDirectory = 'public/upload/chat_private';
    /*
              *---------------------------------------------------------------
              *  chat room directory
              *---------------------------------------------------------------

              */
    public $chatRoomDirectory = 'public/upload/chat_room';
    /*
                *---------------------------------------------------------------
                *  contact directory
                *---------------------------------------------------------------

                */
    public $contactDirectory = 'public/upload/contact';

    /*
                  *---------------------------------------------------------------
                  *  news directory
                  *---------------------------------------------------------------

                  */
    public $newsDirectory = [
        'image' => 'public/upload/news/image',
        'video' => 'public/upload/news/video',
        'thumbnail' => 'public/upload/news/thumbnail/',
    ];
    /*
   *---------------------------------------------------------------
    *  profile directory
    *---------------------------------------------------------------

    */
    public $profileDirectory = 'public/upload/profile';
    /*
       *---------------------------------------------------------------
        *  view  directory
        *---------------------------------------------------------------

        */
    public $viewDirectory = [
        'image' => 'public/upload/view/image',
        'video' => 'public/upload/view/video'
    ];
}
