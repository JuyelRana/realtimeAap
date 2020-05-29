<?php

namespace App\Http\Resources\Categories;

use App\Http\Resources\Questions\QuestionResource;
use App\Model\Question;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'path' => $this->path,
            'name' => $this->name,
            'slug' => $this->slug,
            'questions' => QuestionResource::collection($this->questions),
            'id' => $this->id
        ];

    }
}
