@extends('core::layouts.auth')
@section('title')
    {{__('user::general.Change Password')}}
@endsection
@section('styles')
@stop
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                
            </div>
        </div>
    </section>
    <section class="content" id="app">
        <div class="row">
           
            <div class="col-md-12">

                <form method="post" action="{{ url('auth/update_password') }}">
                    {{csrf_field()}}
                    <div class="card card-bordered card-preview">
                        <div class="card-header">
                            <h4 class="card-title">{{__('user::general.Change Password')}}</h4>

                        </div>

                       
                        <div class="card-body">

                              <div >
                        @if(Session::has('success'))

                                <div class="alert alert-success  text-center">

                                    {{Session::get('success')}}

                                </div>

                            @endif


                            @if(Session::has('error'))

                                <div class="alert alert-danger  text-center">

                                    {{Session::get('error')}}

                                </div>

                            @endif
                        </div>

                            <div class="row gy-4">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="current_password"
                                               class="control-label">{{__('user::general.Current Password')}}</label>
                                        <input type="password" name="current_password" id="current_password" value=""
                                               class="form-control @error('current_password') is-invalid @enderror"
                                               required autocomplete="off">
                                        @error('current_password')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row gy-4">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="password"
                                               class="control-label">{{__('user::general.Password')}}</label>
                                        <input type="password" name="password" id="password"
                                               class="form-control @error('password') is-invalid @enderror"
                                               required autocomplete="off">
                                        @error('password')
                                        <span class="invalid-feedback" role="alert">
                                                 <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="password_confirmation"
                                               class="control-label">{{__('user::general.Confirm Password')}}</label>
                                        <input type="password" name="password_confirmation"
                                               id="password_confirmation"
                                               class="form-control @error('password_confirmation') is-invalid @enderror"
                                               required autocomplete="off">
                                        @error('password_confirmation')
                                        <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                             </span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer border-top ">
                            <button type="submit"
                                    class="btn btn-primary  float-right">Change Password</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
@endsection
@section('scripts')

@endsection
