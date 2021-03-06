<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function index()
    {
        $data = auth()->user();
        $categories = Category::all();
        return view('layouts.backend.category.categories',[
            'data'=>$data,
            'categories'=>$categories
        ]);
    }


    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'cat_name' => 'required|unique:"categories"',
            'cover' => 'required'

        ]);


        if ($validator->fails()) {
            return response()->json([
                'errors'=> $validator->messages()->all()
            ],500);
        }else{
            $image = $request->file('cover');
            $new_name = rand() . '.' . $image->getClientOriginalExtension();
            $upload_path = public_path()."/images/";

            if($new_name){
                $data = Category::create([
                    'cat_name'=>$request->cat_name,
                    'slug'=>Str::slug($request->cat_name),
                    'cover'=>$new_name
                ]);
                if($data){
                    $image->move($upload_path, $new_name);
                    return response()->json([
                        'message'=>'success'
                    ],200);
                }
            }
        }
    }

    public function update(Request $request)
    {
        $cat = Category::where('id',$request->id)->first();

        if($request->file('cover') != null && $request->cat_name != null){

            $image = $request->file('cover');
            $new_name = rand() . '.' . $image->getClientOriginalExtension();
            $upload_path = public_path()."/images/";
            \File::delete(public_path('images/' . $cat->cover));

            if($new_name){
                $data = $cat->update([
                    'cat_name'=>$request->cat_name,
                    'slug'=>Str::slug($request->cat_name),
                    'cover'=>$new_name
                ]);
                if($data){
                    $image->move($upload_path, $new_name);
                    return response()->json([
                        'message'=>'success'
                    ],200);
                }
            }
        }elseif($request->file('cover') != null && $request->cat_name == $cat->cat_name){

            $image = $request->file('cover');
            $new_name = rand() . '.' . $image->getClientOriginalExtension();
            $upload_path = public_path()."/images/";
            \File::delete(public_path('images/' . $cat->cover));

            if($new_name){
                $data = $cat->update([
                    'cover'=>$new_name
                ]);
                if($data){
                    $image->move($upload_path, $new_name);
                    return response()->json([
                        'message'=>'success'
                    ],200);
                }
            }
        }elseif($request->file('cover') == null && $request->cat_name != null){


            $data = $cat->update([
                'cat_name'=>$request->cat_name,
                'slug'=>Str::slug($request->cat_name)
            ]);

            return response()->json([
                'message'=>'success'
            ],200);


        }
    }

    public function active(Request $request)
    {
        $category = Category::find($request->id);
        $category->explor = 1;
        $category->save();
        toast('Category Active successfully','success')
        ->padding('10px')->width('270px')->timerProgressBar()->hideCloseButton();
        return response()->json([
            'message'=>'success'
        ]);
    }
    public function inactive(Request $request)
    {
        $category = Category::find($request->id);
        $category->explor = 0;
        $category->save();
        toast('Category inactive successfully','success')
        ->padding('10px')->width('270px')->timerProgressBar()->hideCloseButton();
        return response()->json([
            'message'=>'success'
        ]);
    }
    public function destroy(Request $request)
    {
        $category = Category::find($request->id);
        $category->status = 0;
        $category->save();
        toast('Category delete successfully','success')
        ->padding('10px')->width('270px')->timerProgressBar()->hideCloseButton();
        return response()->json([
            'message'=>'success'
        ]);
    }
}
