<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Validator;
use session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    public function register_index()
    {
        return view('layouts.backend.auth.register');
    }

    public function login_index()
    {
        return view('layouts.backend.auth.login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);


        if(Auth::attempt([
            'email'=>$request->email,
            'password'=>$request->password,
            'verified'=> 1,
            'type'=> 'user'
        ])) {

            return response()->json([
                'msg'=>"success"
            ],200);
        }
        else{

            return response()->json([
                'msg'=>"success"
            ],500);
        }
    }



    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name'  =>  'required|unique:users',
            'email'  =>  'required|unique:users',
            'phn'  =>  'required',
            'password'  =>  'required|min:8'

        ]);

        if ($validator->fails()) {
            return redirect()->back();
        }else{
            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'phn' => $request->phn,
                'password' => Hash::make($request->password),
                'verification_token'=> Str::random(32),
                'verified'=> 1
            ]);


            return response()->json([
                'msg'=>"success"
            ],200);
        }

    }

    public function logout(Request $request)
    {
        if(Auth::check()){
            Auth::logout();
            $request->session()->flush();

            return redirect()->route('home');
        }

    }
}
