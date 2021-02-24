<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use App\Models\Category;
use App\Models\ChildCategory;
use App\Models\SubChildCategory;
use App\Models\Attribute;
use App\Models\Brand;
use App\Models\Product;
use App\Models\ProductAvatar;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = auth()->user();
        $categories = Category::latest()->get();
        $childs = ChildCategory::latest()->get();
        $sub_childs = SubChildCategory::latest()->get();
        $brands = Brand::latest()->get();
        $products = Product::latest()->with('get_product_avatars')->get();
        return view('layouts.backend.product.product_list',[
            'data'=>$data,
            'categories'=>$categories,
            'childs'=>$childs,
            'sub_childs'=>$sub_childs,
            'brands'=>$brands,
            'products'=>$products,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function table_search(Request $request)
    {
        if ($request->search == 'daily') {
            $sales = OrderDetails::latest()->where('created_at','>=',Carbon::today())->whereNotNull('product_id')->with('get_orders','get_product')->get();
        }elseif($request->search == 'weekly'){
            $sales = OrderDetails::latest()->whereBetween('created_at', [Carbon::now()->subWeek()->format("Y-m-d H:i:s"), Carbon::now()])->whereNotNull('product_id')->with('get_orders','get_product')->get();

        }elseif($request->search == 'monthly'){
            $sales = OrderDetails::latest()->whereBetween('created_at', [Carbon::now()->subMonth()->format("Y-m-d H:i:s"), Carbon::now()])->whereNotNull('product_id')->with('get_orders','get_product')->get();

        }elseif($request->search == 'yearly'){
            $sales = OrderDetails::latest()->whereBetween('created_at', [Carbon::now()->subYear()->format("Y-m-d H:i:s"), Carbon::now()])->whereNotNull('product_id')->with('get_orders','get_product')->get();

        }

        $data = auth()->user();
        $order_status = OrderDetails::whereNull('product_id')->distinct('order_id')->first();
        $count = Orders::where('delivery_status','pending')->count();
        $count_refund = Orders::where('delivery_status','refund')->count();
        return view('layouts.backend.sales.sales_history',[
            'data'=>$data,
            'sales'=>$sales,
            'count'=>$count,
            'count_refund'=>$count_refund,
            'order_status'=>$order_status
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'brand_id' => 'required',
            'category_id' => 'required',
            'child_category_id' => 'required',
            'sub_child_category_id' => 'required',
            'product_name' => 'required|unique:"products"',
            'product_code' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'msg'=>'failed'
            ],500);
        }else{
            Product::create([
                'brand_id'=>$request->brand_id,
                'category_id'=>$request->category_id,
                'child_category_id'=>$request->child_category_id,
                'sub_child_category_id'=>$request->sub_child_category_id,
                'product_name'=>$request->product_name,
                'slug'=> Str::slug($request->product_name),
                'product_code'=>$request->product_code,
                'color'=>$request->color,
                'e_money'=>$request->e_money,
                'indoor_charge'=>$request->indoor_charge,
                'outdoor_charge'=>$request->outdoor_charge,
                'description'=>$request->description,
            ]);

            $products = Product::latest()->with('get_product_avatars')->get();
            return view('layouts.backend.product.product_tbl',[
                'products'=>$products
            ]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function product_status(Request $request)
    {
        $data = Product::where('id',$request->id)->first();
        if ($data->status == 0) {
           $data->update([
               'status'=>1
           ]);

            return redirect()->back();
        }elseif($data->status == 1){
            $data->update([
                'status'=>0
            ]);

            return redirect()->back();
        }

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($slug)
    {
        $data = auth()->user();
        $product = Product::where('slug',$slug)->with([
            'get_brand',
            'get_category',
            'get_child_category',
            'get_child_child_category',
        ])->first();
        $brands = Brand::select('id','brand_name')->get();
        $sub_child_categories = SubChildCategory::select('id','sub_child_name')->get();
        return view('layouts.backend.product.product_edit',[
            'data'=>$data,
            'product'=>$product,
            'brands'=>$brands,
            'sub_child_categories'=>$sub_child_categories,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $slug)
    {
        $data = Product::where('slug',$slug)->first();

        $data->update([
            'brand_id'=>$request->brand_id,
            'category_id'=>$request->category_id,
            'child_category_id'=>$request->child_category_id,
            'sub_child_category_id'=>$request->sub_child_category_id,
            'product_name'=>$request->product_name,
            'slug'=> Str::slug($request->product_name),
            'product_code'=>$request->product_code,
            'color'=>$request->color,
            'e_money'=>$request->e_money,
            'indoor_charge'=>$request->indoor_charge,
            'outdoor_charge'=>$request->outdoor_charge,
            'description'=>$request->description
        ]);

        return redirect()->route('products');

    }

    public function destroy($id)
    {
        Product::find($id)->delete();
        return redirect()->back();
    }
}
