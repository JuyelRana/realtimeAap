<?php


Route::get('/', function () {
    return view('home');
});

Route::get('/{any}', function () {
    return view('home');
});

Route::get('/{any}/{any1}', function () {
    return view('home');
});
Route::get('/{any}/{any1}/{any2}', function () {
    return view('home');
});
