<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use App\Models\SubChildCategory;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class BrandController extends Controller
{

    public function index()
    {
        $data = auth()->user();
        $brands = Brand::latest()->get();
        return view('layouts.backend.brand.brand_list',[
            'data'=>$data,
            'brands'=>$brands
        ]);
    }

    public function getCatSubCat(Request $request)
    {
        $datas = SubChildCategory::where('id',$request->id)->with('get_child_category.get_category','get_child_category')->first();
        return response()->json([
            'datas'=>$datas
        ]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'brand_name' => 'required|unique:"brands"'

        ]);

        if ($validator->fails()) {
            return redirect()->back();
        }else{
            Brand::create([

                'brand_name'=>$request->brand_name,
                'slug'=> Str::slug($request->brand_name),
                'br_description'=>$request->br_description
            ]);
        }

        return redirect()->back();
    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'brand_name' => 'required',
            'description' => 'required'

        ]);

        if ($validator->fails()) {
            return response()->json([
                'msg'=>'error'
            ],500);
        }else{
            Brand::where('id',$request->id)->update([
                'brand_name'=>$request->brand_name,
                'slug'=> Str::slug($request->brand_name),
                'br_description'=>$request->description
            ]);

            return response()->json([
                'msg'=>'success'
            ],200);
        }
    }

}
