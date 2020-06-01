<?php

Route::group(['namespace' => 'Api\Auth', 'as' => 'api.', 'prefix' => 'auth'], function () {
    Route::post('login', 'AuthController@login')->name('login');
    Route::post('signup', 'AuthController@signup')->name('signup');
    Route::post('logout', 'AuthController@logout')->name('logout');
    Route::post('refresh', 'AuthController@refresh')->name('refresh');
    Route::post('me', 'AuthController@me')->name('users');
    Route::post('payload', 'AuthController@payload')->name('payload');

});

Route::group(['namespace' => 'Api', 'middleware' => 'jwt'], function () {

    Route::apiResource('/questions', 'Questions\QuestionController');

    Route::apiResource('/categories', 'Category\CategoryController');

    Route::apiResource('/questions/{question}/replies', 'Reply\ReplyController');

    Route::post('/like/{reply}', 'Like\LikeController@likeIt')->name('like.add');
    Route::delete('/like/{reply}', 'Like\LikeController@unLikeIt')->name('like.delete');

    Route::post('/notifications', 'Notifications\NotificationController@index');
    Route::post('/markAsRead', 'Notifications\NotificationController@markAsRead');
});


