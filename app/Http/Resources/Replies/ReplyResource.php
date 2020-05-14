<?php

namespace App\Http\Resources\Replies;

use Illuminate\Http\Resources\Json\JsonResource;

class ReplyResource extends JsonResource
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
            'id' => $this->id,
            'reply' => $this->body,
            'question' => $this->question->title,
            'user' => $this->user->name,
            'reply_time' => $this->created_at->diffForHumans()

        ];
    }
}