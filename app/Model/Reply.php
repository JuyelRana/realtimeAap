<?php

namespace App\Model;

use App\User;
use Illuminate\Database\Eloquent\Model;

use App\Model\Question;
use App\Model\Like;

class Reply extends Model
{
    protected $guarded = [];

    public function question()
    {
        return $this->belongsTo(Question::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }

    public function getPathAttribute()
    {
        return asset("api/questions/" . $this->question->slug . "/replies/$this->id");
    }
}
