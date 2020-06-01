<?php

namespace App\Http\Controllers\Api\Reply;

use App\Http\Controllers\Controller;
use App\Http\Requests\Reply\ReplyRequest;
use App\Http\Resources\Replies\ReplyResource;
use App\Model\Question;
use App\Model\Reply;
use App\Notifications\Reply\NewReplyNotification;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class ReplyController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Question $question)
    {
        $replies = $question->replies;
        return ReplyResource::collection($replies);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Question $question, ReplyRequest $request)
    {
        $reply = null;

        try {
            $reply = $question->replies()->create($request->all());

            $user = $question->user;

            if ($reply->user_id !== $question->user_id) {
                $user->notify(new NewReplyNotification($reply));
            }

            $message = 'Added Successfully';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }
        return response(['reply' => new ReplyResource($reply), 'message' => $message], $reply ? Response::HTTP_CREATED : Response::HTTP_INTERNAL_SERVER_ERROR);

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Model\Reply $reply
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question, Reply $reply)
    {
        return new ReplyResource($reply);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Model\Reply $reply
     * @return \Illuminate\Http\Response
     */
    public function update(Question $question, Request $request, Reply $reply)
    {
        $isUpdated = false;
        try {
            $isUpdated = $reply->update($request->all());
            $message = 'Updated Successfully';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isUpdated ? Response::HTTP_ACCEPTED : Response::HTTP_INTERNAL_SERVER_ERROR);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Model\Reply $reply
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question, Reply $reply)
    {
        $isDeleted = false;

        try {
            $isDeleted = $reply->delete();
            $message = 'Deleted Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isDeleted ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}
