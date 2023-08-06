@extends('installer::layouts.master')

@section('title', trans('installer::general.install_email'))
@section('content')
    <form method="post" action="{{ url('install/email') }}">
        {{csrf_field()}}
        <div class="form-group">
            <label for="app_name" class="control-label">{{trans_choice('installer::general.app_name',1)}}</label>
            <input type="text" name="app_name" value="{{ env('APP_NAME') }}" id="app_name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="mail_driver" class="control-label">{{trans_choice('installer::general.mail_driver',1)}}</label>
            <input type="text" name="mail_driver" value="{{ env('MAIL_DRIVER') }}" id="mail_driver" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_host"
                   class="control-label">{{trans_choice('installer::general.mail_host',1)}}</label>
            <input type="text" name="mail_host" value="{{ env('MAIL_HOST') }}" id="mail_host" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_port"
                   class="control-label">{{trans_choice('installer::general.mail_port',1)}}</label>
            <input type="text" name="mail_port" value="{{ env('MAIL_PORT') }}" id="mail_port" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_username" class="control-label">{{trans_choice('installer::general.mail_username',1)}}</label>
            <input type="text" name="mail_username" value="{{ env('MAIL_USERNAME') }}" id="mail_username" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_password" class="control-label">{{trans_choice('installer::general.mail_password',1)}}</label>
            <input type="text" name="mail_password" value="{{ env('MAIL_PASSWORD') }}" id="mail_password" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_encryption" class="control-label">{{trans_choice('installer::general.mail_encryption',1)}}</label>
            <input type="text" name="mail_encryption" value="{{ env('MAIL_ENCRYPTION') }}" id="mail_encryption" class="form-control">
        </div>
        <div class="form-group">
            <label for="mail_from_address" class="control-label">{{trans_choice('installer::general.mail_from_address',1)}}</label>
            <input type="text" name="mail_from_address" value="{{ env('MAIL_FROM_ADDRESS') }}" id="mail_from_address" class="form-control">
        </div>

        <div class="form-group">

            <button type="submit"
                    class="btn btn-info pull-right"> {{ trans('installer::general.install_next') }}</button>

        </div>
    </form>
@endsection