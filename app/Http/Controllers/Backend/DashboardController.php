<?php

namespace App\Http\Controllers\Backend;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
class DashboardController extends Controller
{

    public function index()
    {
        $data = auth()->user();
        return view('layouts.backend.dashboard',[
            'data'=>$data
        ]);
    }

}
