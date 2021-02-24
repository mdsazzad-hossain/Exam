<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Attribute;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;

class AttributeController extends Controller
{

    public function index()
    {
        $data = auth()->user();
        $attributes = Attribute::latest()->with('get_product')->get();
        $products = Product::select('id','product_name')->get();
        return view('layouts.backend.attribute.attribute_list',[
            'data'=>$data,
            'products'=>$products,
            'attributes'=>$attributes
        ]);
    }

    public function store(Request $request)
    {
        $product = Attribute::where('product_id',$request->product_id)->where('size',$request->size[0])->first();
        if ($product) {
            return redirect()->back();
        }else{
            $datas = $request->all();
            foreach ($datas['size'] as $key => $value) {
                Attribute::create([
                    'product_id'=>$datas['product_id'],
                    'size'=>$datas['size'][$key],
                    'sale_price'=>$datas['sale_price'][$key],
                    'pur_price'=>$datas['pur_price'][$key],
                    'promo_price'=>$datas['promo_price'][$key],
                    'discount'=>$datas['discount'][$key],
                    'qty'=>$datas['qty'][$key],
                    'stock'=>$datas['qty'][$key],
                ]);
            }
            return redirect()->back();
        }

    }

    public function update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'size' => 'required',
            'sale_price' => 'required',
            'pur_price' => 'required',
            'qty' => 'required'

        ]);

        if ($validator->fails()) {
            return response()->json([
                'msg'=>'error'
            ],500);
        }else{
            $data = Attribute::where('id',$request->id)->first();
            $data->update([
                'size'=>$request->size,
                'sale_price'=> $request->sale_price,
                'pur_price'=> $request->pur_price,
                'promo_price'=> $request->promo_price,
                'discount'=> $request->discount,
                'qty'=> $request->qty,
                'stock'=>$data->stock + $request->qty,
            ]);
            return response()->json([
                'msg'=>'success'
            ],200);
        }
    }

}
