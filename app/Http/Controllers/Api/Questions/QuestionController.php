<?php

namespace App\Http\Controllers\Api\Questions;

use App\Http\Controllers\Controller;
use App\Http\Resources\Questions\QuestionResource;
use App\Model\Question;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;


use Symfony\Component\HttpFoundation\Response;

class QuestionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $questions = Question::latest()->get();
        return QuestionResource::collection($questions);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $question = null;
        try {
            $question = Question::create($request->all());
            $message = 'Created Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }
        return response($message, $question ? Response::HTTP_CREATED : Response::HTTP_INTERNAL_SERVER_ERROR);

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Model\Question $question
     * @return \Illuminate\Http\Response
     */
    public function show(Question $question)
    {
        return new QuestionResource($question);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Model\Question $question
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Question $question)
    {
        $isUpdated = false;

        try {
            $isUpdated = $question->update($request->all());
            $message = 'Updated Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }
        return response($message, $isUpdated ? Response::HTTP_CREATED : Response::HTTP_INTERNAL_SERVER_ERROR);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Model\Question $question
     * @return \Illuminate\Http\Response
     */
    public function destroy(Question $question)
    {
        $isDeleted = false;

        try {
            $isDeleted = $question->delete();
            $message = 'Deleted Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isDeleted ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}
