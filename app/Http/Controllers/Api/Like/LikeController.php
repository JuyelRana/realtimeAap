<?php

namespace App\Http\Controllers\Api\Like;

use App\Events\Like\LikeEvent;
use App\Http\Controllers\Controller;
use App\Model\Reply;
use Illuminate\Database\QueryException;
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

//            Broadcast Events to others
            broadcast(new LikeEvent($reply->id, 1))->toOthers();

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

            //            Broadcast Events to others
            broadcast(new LikeEvent($reply->id, 0))->toOthers();

            $message = 'Unliked Reply!';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isUnlike ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR);

    }
}
