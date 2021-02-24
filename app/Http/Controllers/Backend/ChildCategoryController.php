<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\ChildCategory;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ChildCategoryController extends Controller
{
    public function index()
    {
        $data = auth()->user();
        $cats = Category::all();
        $childs = ChildCategory::latest()->with('get_category')->get();
        return view('layouts.backend.category.child_categories',[
            'data'=>$data,
            'cats'=>$cats,
            'childs'=>$childs
        ]);
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'child_name' => 'required|unique:"child_categories"',
            'category_id' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'msg'=>'error'
            ],500);
        }else{
            ChildCategory::create([
                'category_id'=>$request->category_id,
                'child_name'=>$request->child_name,
                'slug'=>Str::slug($request->child_name)
            ]);
            return response()->json([
                'msg'=>'success'
            ],200);
        }


    }

    public function update(Request $request)
    {

        ChildCategory::find($request->id)->update([
            'category_id'=> $request->edit_category_id,
            'child_name'=> $request->edit_child_name,
            'slug'=> Str::slug($request->edit_child_name)
        ]);

        toast('Sub-Category updated successfully','success')->padding('10px')->width('270px')->timerProgressBar()->hideCloseButton();
        return redirect()->back();
    }

    public function destroy($id)
    {
        Alert::warning('Opps',"you cant'n delete child-category!");
        return redirect()->back();
    }
}
