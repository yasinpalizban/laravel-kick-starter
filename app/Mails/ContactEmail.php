<?php
namespace App\Mails;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactEmail extends Mailable
{
    use Queueable, SerializesModels;



    public function __construct(private $reply, private $mySubject)
    {

    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('common::contact',[   'reply' => $this->reply])
            ->subject($this->mySubject);
    }
}
