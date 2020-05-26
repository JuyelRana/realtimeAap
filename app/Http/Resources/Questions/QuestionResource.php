<?php

namespace App\Http\Resources\Questions;

use App\Http\Resources\Replies\ReplyResource;
use Illuminate\Http\Resources\Json\JsonResource;

class QuestionResource extends JsonResource
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
            'slug' => $this->slug,
            'title' => $this->title,
            'body' => $this->body,
            'created_at' => $this->created_at->diffForHumans(),
            'user' => $this->user->name,
            'user_id' => $this->user_id,
            'replies' => ReplyResource::collection($this->replies)
        ];
    }
}
