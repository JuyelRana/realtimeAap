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
            'user_id' => $this->user_id,
            'likes' => $this->likes,
            'reply_time' => $this->created_at->diffForHumans()

        ];
    }
}
