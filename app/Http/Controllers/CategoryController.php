<?php

namespace App\Http\Controllers;

use App\Http\Resources\Categories\CategoryResource;
use App\Model\Category;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::latest()->get();
        return CategoryResource::collection($categories);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $category = null;
        try {
            $category = Category::create($request->all());
            $message = 'Created Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }
        return response($message, $category ? Response::HTTP_CREATED : Response::HTTP_INTERNAL_SERVER_ERROR);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Model\Category $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        return new CategoryResource($category);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Model\Category $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $isUpdated = false;
        try {
            $isUpdated = $category->update($request->all());
            $message = 'Updated Successfully';
        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }

        return response($message, $isUpdated ? Response::HTTP_ACCEPTED : Response::HTTP_INTERNAL_SERVER_ERROR);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Model\Category $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $isDeleted = false;

        try {
            $isDeleted = $category->delete();
            $message = 'Deleted Successfully';

        } catch (QueryException $exception) {
            $message = $exception->getMessage();
        }
        return response($message, $isDeleted ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR);
    }
}
