<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class SessionController extends Controller
{
    function index(){
        return view('session/index');
    }
    function register(){
        return view('sesi/register');
    }
    function create(Request $request){
        Session::flash('email', $request->email);
        Session::flash('name', $request->name);
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8'
        ],[
            'name.required' => 'Name cannot be empty',
            'email.required' => 'Email cannot be empty',
            'email.email' => 'Please enter valid email',
            'email.unique' => 'This email already registered',
            'password.required' => 'Password cannot be empty',
            'password.min' => 'Password must have atleast 8 characters'
        ]);

        $registerData = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password)
        ];
        User::create($registerData);

        $loginInformation = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if(Auth::attempt($loginInformation)){
            return Auth::user()->name;
        }
        else{
            return 'failed';
        }
    }
    function login(Request $request){
        Session::flash('email', $request->email);
        $request->validate([
            'email' => 'required',
            'password' => 'required'
        ],[
            'email.required' => 'Email field cannot be empty',
            'password.required' => 'Password field cannot be empty'
        ]);

        $loginInformation = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if(Auth::attempt($loginInformation)){
            return 'success';
        }
        else{
            return 'failed';
        }
    }
    function logout(){
        Auth::logout();
        return 'successfully logout';
    }
}
