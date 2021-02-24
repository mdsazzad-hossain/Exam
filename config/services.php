<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'google' => [
        'client_id' => '1081339209331-uenhp3jolnii4ipmbpvnhgmgvmpeokqq.apps.googleusercontent.com',
        'client_secret' => '5s9aQtauCFN5um1Mb7g0gx99',
        'redirect' => 'https://onlinelifecsa.com/callback/google',
    ],

    'facebook' => [
        'client_id' => '438689710663434',
        'client_secret' => '0a8edb7d32efa0def775579e71fd799b',
        'redirect' => 'https://onlinelifecsa.com/login/facebook/callback',
    ],

];
