<?php

namespace App\Http\Controllers\Api\Like;

use App\Http\Controllers\Controller;
use App\Model\Like;
use App\Model\Reply;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class LikeController extends Controller
{
    public function likeIt(Reply $reply)
    {
        $isLiked = null;
        try {
            $isLiked = $reply->likes()->create([
                'user_id' => auth()->id()
            ]);
            $message = 'New like added';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isLiked ? Response::HTTP_CREATED : Response::HTTP_INTERNAL_SERVER_ERROR);

    }

    public function unLikeIt(Reply $reply)
    {
        $isUnlike = false;
        try {
            $isUnlike = $reply->likes()->where([
                'user_id' => auth()->id()
            ])->first()->delete();
            $message = 'Unliked Reply!';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isUnlike ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR);

    }
}
