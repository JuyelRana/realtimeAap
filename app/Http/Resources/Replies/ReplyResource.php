<?php

namespace App\Http\Resources\Replies;

use App\Http\Resources\Questions\QuestionResource;
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
            'question' => $this->question,
            'user' => $this->user->name,
            'user_id' => $this->user_id,
            'like_count' => $this->likes->count(),
            'liked' => !!$this->likes->where('user_id', auth()->id())->count(),
            'reply_time' => $this->created_at->diffForHumans()

        ];
    }
}
