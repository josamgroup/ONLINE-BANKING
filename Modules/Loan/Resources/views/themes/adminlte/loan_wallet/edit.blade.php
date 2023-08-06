@extends('core::layouts.master')
@section('title')
   Wallets
@endsection
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>
                        {{ trans_choice('core::general.edit',1) }} Wallets
                        <a href="#" onclick="window.history.back()"
                           class="btn btn-outline-light bg-white d-none d-sm-inline-flex">
                            <em class="icon ni ni-arrow-left"></em><span>{{ trans_choice('core::general.back',1) }}</span>
                        </a>
                    </h1>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a
                                    href="{{url('dashboard')}}">{{ trans_choice('dashboard::general.dashboard',1) }}</a>
                        </li>
                        <li class="breadcrumb-item"><a
                                    href="{{url('loan/wallets')}}">Wallets</a>
                        </li>
                        <li class="breadcrumb-item active">Wallet Update</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content" id="app">
        <form method="post" action="{{ url('loan/wallets/'.$loan_wallet->WalletID.'/update') }}">
            {{csrf_field()}}
            <div class="card card-bordered card-preview">
                <div class="card-body">
                    <div class="row gy-4">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="name"
                                       class="control-label">AccountID</label>
                                <input type="text" name="AccountID" v-model="AccountID"
                                       id="AccountID"
                                       readonly="true"
                                       class="form-control @error('AccountID') is-invalid @enderror" required>
                                @error('AccountID')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                         <div class="col-md-12">
                            <div class="form-group">
                                <label for="current"
                                       class="control-label">Current Balance</label>
                                <input type="number" name="current" v-model="current"
                                       id="current"
                                       class="form-control numeric @error('current') is-invalid @enderror" readonly="true"   required>
                                @error('current')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                         <div class="col-md-12">
                            <div class="form-group">
                                <label for="name"
                                       class="control-label">Amount(+ OR -)</label>
                                <input type="text" name="balance" v-model="balance"
                                       id="balance"
                                       class="form-control @error('balance') is-invalid @enderror" required>
                                @error('balance')
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
                            class="btn btn-primary  float-right">{{trans_choice('core::general.save',1)}}</button>
                </div>
            </div><!-- .card-preview -->
        </form>
    </section>
@endsection
@section('scripts')
    <script>
        var app = new Vue({
            el: "#app",
            data: {
              
                AccountID: "{{old('AccountID',$loan_wallet->AccountID)}}",
                balance: "{{old('balance',$loan_wallet->balance)}}",
                current: "{{old('current',0)}}",
              

            }
        })
    </script>
@endsection