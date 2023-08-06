@extends('installer::layouts.master')

@section('title', trans('installer::general.install_license'))
@section('content')
    <form method="post" action="{{ url('install/license') }}">
        {{csrf_field()}}
        <div class="form-group">
            <label for="purchase_code_type"
                   class="control-label">{{trans_choice('installer::general.purchase_code_type',1)}}</label>
            <select name="purchase_code_type" id="purchase_code_type" class="form-control" required>
                <option value="envato" @if(old('purchase_code_type')=='envato') selected @endif>Envato</option>
                <option value="internal" @if(old('purchase_code_type')=='internal') selected @endif>Webstudio</option>
            </select>
        </div>
        <div class="form-group">
            <label for="purchase_code"
                   class="control-label">{{trans_choice('installer::general.purchase_code',1)}}</label>
            <input type="text" name="purchase_code" value="{{old('purchase_code')}}" id="purchase_code" class="form-control"
                   required>
        </div>
        <div class="form-group">

            <button type="submit"
                    class="btn btn-info pull-right"> {{ trans('installer::general.install_next') }}</button>

        </div>
    </form>
@endsection