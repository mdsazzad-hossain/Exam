<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\ChildCategory;
use App\Models\SubChildCategory;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class SubChildCategoryController extends Controller
{

    public function index()
    {
        $data = auth()->user();
        $childs = ChildCategory::latest()->with('get_category')->get();
        $sub_childs = SubChildCategory::latest()->with('get_child_category.get_category')->get();
        return view('layouts.backend.category.sub_child',[
            'data'=>$data,
            'childs'=>$childs,
            'sub_childs'=>$sub_childs
        ]);
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'child_category_id'=>'required',
            'sub_child_name'=>'required|unique:"sub_child_categories"'

        ]);

        if ($validator->fails()) {
            return redirect()->back();

        }else{
            $catId = ChildCategory::where('id',$request->child_category_id)->get();
            foreach ($catId as $key => $value) {
                $id = $value->category_id;
            }

            SubChildCategory::create([
                'category_id'=>$id,
                'child_category_id'=>$request->child_category_id,
                'sub_child_name'=>$request->sub_child_name,
                'slug'=>Str::slug($request->sub_child_name)
            ]);

            return redirect()->back();
        }


    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request)
    {
        $catId = ChildCategory::where('id',$request->edit_child_category_id)->get();
        foreach ($catId as $key => $value) {
            $id = $value->category_id;
        }

        SubChildCategory::find($request->id)->update([
            'category_id'=>$id,
            'child_category_id'=>$request->edit_child_category_id,
            'sub_child_name'=>$request->edit_sub_child_name,
            'slug'=>Str::slug($request->sub_child_name)
        ]);

        return redirect()->back();
    }

    public function destroy($id)
    {
        return redirect()->back();
    }
}
