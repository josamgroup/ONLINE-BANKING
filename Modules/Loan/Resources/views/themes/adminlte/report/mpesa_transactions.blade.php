@extends('core::layouts.master')
@section('title')
    Mpesa Transactions
@endsection
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Mpesa Transactions</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a
                                    href="{{url('dashboard')}}">{{ trans_choice('dashboard::general.dashboard',1) }}</a>
                        </li>
                        <li class="breadcrumb-item"><a
                                    href="{{url('report')}}">{{ trans_choice('report::general.report',2) }}</a>
                        </li>
                        <li class="breadcrumb-item"><a
                                    href="{{url('report/loan')}}">{{trans_choice('loan::general.loan',1)}} {{trans_choice('report::general.report',2)}}</a>
                        </li>
                        <li class="breadcrumb-item active">Mpesa Transactions</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <section class="content" id="app">
        <div class="card">
            <div class="card-header with-border">
                <h3 class="card-title">
                    Mpesa Transactions
                    @if(!empty($start_date))
                        for period: <b>{{$start_date}} to {{$end_date}}</b>
                    @endif
                </h3>
                <div class="card-tools hidden-print">
                    <div class="dropdown">
                        <a href="#" class="btn btn-info btn-trigger btn-icon dropdown-toggle"
                           data-toggle="dropdown">
                            {{trans_choice('core::general.action',2)}}
                        </a>
                        <div class="dropdown-menu dropdown-menu-xs dropdown-menu-right">
                            <a href="{{url('report/loan/mpesa_transactions?download=1&type=csv&start_date='.$start_date.'&end_date='.$end_date)}}" class="dropdown-item">{{trans_choice('core::general.download',1)}} {{trans_choice('core::general.csv_format',1)}}</a>
                            <a href="{{url('report/loan/mpesa_transactions?download=1&type=excel&start_date='.$start_date.'&end_date='.$end_date)}}" class="dropdown-item">{{trans_choice('core::general.download',1)}} {{trans_choice('core::general.excel_format',1)}}</a>
                            <a href="{{url('report/loan/mpesa_transactions?download=1&type=excel_2007&start_date='.$start_date.'&end_date='.$end_date)}}" class="dropdown-item">{{trans_choice('core::general.download',1)}} {{trans_choice('core::general.excel_2007_format',1)}}</a>
                            <a href="{{url('report/loan/mpesa_transactions?download=1&type=pdf&start_date='.$start_date.'&end_date='.$end_date)}}" class="dropdown-item">{{trans_choice('core::general.download',1)}} {{trans_choice('core::general.pdf_format',1)}}</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <form method="get" action="{{Request::url()}}" class="">
                    <div class="row">
                   
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"
                                       for="start_date">{{trans_choice('core::general.start_date',1)}}</label>
                                <flat-pickr value="{{$start_date}}"
                                            class="form-control  @error('start_date') is-invalid @enderror"
                                            name="start_date" id="start_date" required>
                                </flat-pickr>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="control-label"
                                       for="end_date">{{trans_choice('core::general.end_date',1)}}</label>
                                <flat-pickr value="{{$end_date}}"
                                            class="form-control  @error('end_date') is-invalid @enderror"
                                            name="end_date" id="end_date" required>
                                </flat-pickr>
                            </div>
                        </div>
                     
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                        <span class="input-group-btn">
                          <button type="submit" class="btn bg-olive btn-flat">{{trans_choice('core::general.filter',1)}}
                          </button>
                        </span>
                            <span class="input-group-btn">
                          <a href="{{Request::url()}}"
                             class="btn bg-purple  btn-flat pull-right">{{trans_choice('general.reset',1)}}!</a>
                        </span>
                        </div>
                    </div>
                </form>

            </div>
            <!-- /.box-body -->

        </div>
        <!-- /.box -->
        @if(!empty($start_date))
            <div class="card">
                <div class="card-body table-responsive p-0">
                    <table class="table table-bordered table-condensed table-hover">
                        <thead>
                        <tr>
                            <th colspan="1">
                                Names
                            </th>
                            <th colspan="1">
                                Trans Type
                            </th>
                            <th colspan="1">
                               TransID
                            </th>
                            <th colspan="1">
                               Trans Amount
                            </th>
                            <th colspan="1">
                               PayBill
                            </th>
                            <th colspan="1">MSISDN</th>
                            <th colspan="1">Ref</th>
                        </tr>
                    
                        </thead>
                        <tbody>
                        <?php
                       
                        $total_amount = 0;
                        ?>
                        @foreach($data as $key)
                            <?php
                            
                            $total_amount = $total_amount + $key->TransAmount;
                            ?>
                            <tr>
                                <td>{{ $key->FirstName }} {{ $key->MiddleName }} {{ $key->LastName }}</td>
                                <td>{{ $key->TransactionType }}</td>
                                <td>{{ $key->TransID }}</td>
                                <td>{{ number_format( $key->TransAmount,2) }}
                                </td>
                                <td>{{ $key->BusinessShortCode }}
                                </td>
                               
                                <td>{{ $key->MSISDN }}</td>
                                <td>{{ $key->BillRefNumber }}</td>

                        
                            </tr>
                        @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="3"><b>{{trans_choice('core::general.total',1)}}</b></td>
                            <td>{{number_format($total_amount,2)}}</td>
                            
                             <td>#</td>
                            <td>#</td>
                            <td>#</td>
                            <!-- <td></td> -->

                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        @endif
    </section>
@endsection
@section('scripts')
    <script>
        var app = new Vue({
            el: "#app",
            data: {},
            methods: {},
        })
    </script>
@endsection
