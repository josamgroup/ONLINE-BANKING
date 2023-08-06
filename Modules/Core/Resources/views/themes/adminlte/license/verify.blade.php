@extends('core::layouts.master')
@section('title')
    Verify Licence
@endsection
@section('styles')
@stop
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>
                        Verify Licence

                    </h1>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a
                                    href="{{url('dashboard')}}">{{ trans_choice('dashboard::general.dashboard',1) }}</a>
                        </li>
                        <li class="breadcrumb-item active">Verify Licence</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content" id="app">
        <form method="post" action="{{ url('license/verify') }}">
            {{csrf_field()}}
        <div class="card">

            <div class="card-body">
                <div class="alert alert-danger">{{$message}}</div>
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
                            class="btn btn-info pull-right"> Verify</button>

                </div>
            </div>
        </div>
        </form>
    </section>
@endsection
@section('scripts')
    <script>
        var app = new Vue({
            el: "#app",
            data: {
                selectAll: false,
                selectedRecords: []
            },
            methods: {
                selectAllRecords() {
                    this.selectedRecords = [];
                    if (this.selectAll) {
                        this.records.data.forEach(item => {
                            this.selectedRecords.push(item.id);
                        });
                    }
                },
            },
        })
    </script>
@endsection
