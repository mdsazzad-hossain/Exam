<?php

use Illuminate\Support\Facades\Route;

Route::group(["namespace"=>"Backend"],function() {
    Route::group(['middleware' =>'guest'], function () {
        Route::get('/', 'LoginController@login_index')->name('login');
        Route::get('/register', 'LoginController@register_index')->name('register');
        Route::post('/register-store', 'LoginController@store')->name('store');
        Route::post('/login', 'LoginController@login')->name('user.login');
    });

    Route::group(['middleware' => ['auth','user.role']], function () {

        Route::get('/logout', 'LoginController@logout')->name('logout');
        Route::get('dashboard', 'DashboardController@index')->name('dashboard');

        //category
        Route::get('categories', 'CategoryController@index')->name('categories');
        Route::post('create-category', 'CategoryController@store')->name('category.add');
        Route::post('update-category', 'CategoryController@update')->name('category.update');
        Route::post('delete-category', 'CategoryController@destroy')->name('category.delete');
        Route::post('active-category', 'CategoryController@active')->name('category.active');
        Route::post('inactive-category', 'CategoryController@inactive')->name('category.inactive');
        //sub cat
        Route::get('sub-categories', 'ChildCategoryController@index')->name('child.category');
        Route::post('sub-category-create', 'ChildCategoryController@store')->name('child.add');
        Route::post('sub-category-update', 'ChildCategoryController@update')->name('update.child');
        Route::post('sub-category-delete/{id}', 'ChildCategoryController@destroy')->name('delete.child');
        //sub sub-cat
        Route::get('sub-sub-categories', 'SubChildCategoryController@index')->name('sub.child.category');
        Route::post('sub-sub-category-create', 'SubChildCategoryController@store')->name('sub.child.add');
        Route::post('sub-sub-category-update', 'SubChildCategoryController@update')->name('update.sub.child');
        Route::post('sub-sub-category-delete/{id}', 'SubChildCategoryController@destroy')->name('delete.sub.child');

        //product attribute route
        Route::get('product-attributes', 'AttributeController@index')->name('attributes');
        Route::post('product-attribute-update', 'AttributeController@update')->name('update.attribute');
        Route::post('product-attribute-create', 'AttributeController@store')->name('store.attribute');

        //Brand
        Route::get('products', 'ProductController@index')->name('products');
        Route::post('brand-create', 'BrandController@store')->name('brand.add');
        Route::get('brand-list', 'BrandController@index')->name('brand.brand_list');
        Route::post('get-cat-subCat', 'BrandController@getCatSubCat')->name('get.cat.subCat');
        Route::post('brand-update', 'BrandController@update')->name('brand.update');

        //product
        Route::get('products', 'ProductController@index')->name('products');
        Route::post('product-create', 'ProductController@store')->name('product.add');
        Route::get('product-edit/{slug}', 'ProductController@edit')->name('product.edit');
        Route::post('product-update/{slug}', 'ProductController@update')->name('product.update');
        Route::post('product-delete/{id}', 'ProductController@destroy')->name('product.delete');
        Route::post('product-flash-update', 'ProductController@flash_update')->name('product.flash.update');
        Route::post('product-status', 'ProductController@product_status')->name('product.status');

        //product avatars
        Route::get('products/avatars', 'ProductAvatarController@index')->name('avatars');
        Route::get('products/avatars/{slug}', 'ProductAvatarController@show')->name('product.avatars');
        Route::post('product-avatar-create', 'ProductAvatarController@store')->name('avatar.upload');
        Route::post('product-avatar-update', 'ProductAvatarController@update')->name('avatar.update');

    });

});

