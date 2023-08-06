@extends('core::layouts.master')
@section('title')
    Bulk Upload
@endsection
@section('styles')
@stop
@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Bulk Upload</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a
                                    href="{{url('dashboard')}}">{{ trans_choice('dashboard::general.dashboard',1) }}</a>
                        </li>
                        <li class="breadcrumb-item active">Bulk</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="card">
            <div class="card-header">
         @can('client.clients.create')
         <div class="row">
          <div class="col-md-4">
           <div class="card">
               <div class="card-header bgsize-primary-4 white card-header">
                   <h4 class="card-title">Import Data</h4>
               </div>
               <div class="card-body">
                   @if ($message = Session::get('success'))
                       <div class="alert alert-success alert-block">
                           <button type="button" class="close" data-dismiss="alert">×</button>
                           <strong>{{ $message }}</strong>
                       </div>
                       <br>
                   @endif
                   <form action="{{url('client/import')}}" method="post" enctype="multipart/form-data">
                       @csrf
                       <fieldset>
                           <label>Select File to Upload  <small class="warning text-muted">{{__('Please upload only Excel (.xlsx or .xls) files')}}</small></label>
                           <div class="input-group">
                               <input type="file" required class="form-control" name="uploaded_file" id="uploaded_file">
                               @if ($errors->has('uploaded_file'))
                                   <p class="text-right mb-0">
                                       <small class="danger text-muted" id="file-error">{{ $errors->first('uploaded_file') }}</small>
                                   </p>
                               @endif
                               <div class="input-group-append" id="button-addon2">
                                   <button class="btn btn-primary square" type="submit"><i class="ft-upload mr-1"></i> Upload</button>
                               </div>
                           </div>
                       </fieldset>
                   </form>
               </div>
           </div>
       </div>
        <div class="col-md-4">
          <div class="card">
               <div class="card-header bgsize-primary-4 white card-header">
                   <h4 class="card-title">Download Sample file</h4>
               </div>
               <div class="card-body">
                    <a href="{{ url('client/download') }}" class="btn btn-info btn-sm">
                        <i class="fas fa-download"></i> Download file
                    </a>
                    <br>
                    <br>
                  </div>
                 
                </div>
              </div>
               <div class="col-md-4">
            <div class="card">
               <div class="card-header bgsize-primary-4 white card-header">
                   <h4 class="card-title">Export Clients Records</h4>
               </div>
                  <div class="card-body">
                    <a href="{{ url('client/export') }}" class="btn btn-info btn-sm">
                        <i class="fas fa-download"></i> Export Data
                    </a>
                    <br>
                    <br>
                  </div>
                </div>
              </div>
            </div>
                @endcan

              </div>


   </div>
            <!-- <div class="card-body table-responsive p-0">
                <table class="table  table-striped table-hover table-condensed" id="data-table">
                    <thead>
                    <tr>
                        <th>
                            <a href="{{table_order_link('name')}}">
                                {{ trans_choice('core::general.name',1) }}
                            </a>
                        </th>
                        <th>
                            <a href="{{table_order_link('id')}}">
                                {{ trans_choice('core::general.system',1) }} {{ trans_choice('core::general.id',1) }}
                            </a>
                        </th>
                        <th>
                            <a href="{{table_order_link('external_id')}}">
                                {{ trans_choice('core::general.external_id',1) }}
                            </a>
                        </th>
                        <th>
                            <a href="{{table_order_link('gender')}}">
                                {{ trans('core::general.gender') }}
                            </a>
                        </th>
                        <th>{{ trans('core::general.mobile') }}</th>
                        <th>
                            <a href="{{table_order_link('status')}}">
                                {{ trans_choice('core::general.status',1) }}
                            </a>
                        </th>
                        <th>
                            <a href="{{table_order_link('branch')}}">
                                {{ trans_choice('core::general.branch',1) }}
                            </a>
                        </th>
                        <th>
                            <a href="{{table_order_link('staff')}}">
                                {{ trans_choice('core::general.staff',1) }}
                            </a>
                        </th>
                        <th>{{ trans_choice('core::general.action',1) }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>
                                <a href="{{url('client/' . $key->id . '/show')}}">
                                    <span>{{$key->name}}</span>
                                </a>
                            </td>
                            <td>
                                <span>{{$key->id}}</span>
                            </td>
                            <td>
                                <span>{{$key->external_id}}</span>
                            </td>
                            <td>
                                @if($key->gender == "male")
                                    <span>{{trans_choice('core::general.male',1)}}</span>
                                @endif
                                @if($key->gender == "female")
                                    <span>{{trans_choice('core::general.female',1)}}</span>
                                @endif
                                @if($key->gender == "other")
                                    <span>{{trans_choice('core::general.other',1)}}</span>
                                @endif
                                @if($key->gender == "unspecified")
                                    <span>{{trans_choice('core::general.unspecified',1)}}</span>
                                @endif
                            </td>
                            <td>
                                <span>{{$key->mobile}}</span>
                            </td>
                            <td>
                                @if($key->status == "pending")
                                    <span>{{trans_choice('core::general.pending',1)}}</span>
                                @endif
                                @if($key->status == "active")
                                    <span>{{trans_choice('core::general.active',1)}}</span>
                                @endif
                                @if($key->status == "inactive")
                                    <span>{{trans_choice('core::general.inactive',1)}}</span>
                                @endif
                                @if($key->status == "deceased")
                                    <span>{{trans_choice('client::general.deceased',1)}}</span>
                                @endif
                                @if($key->status == "unspecified")
                                    <span>{{trans_choice('core::general.unspecified',1)}}</span>
                                @endif
                            </td>
                            <td>
                                <a href="{{url('branch/' . $key->branch_id . '/show')}}">
                                    <span>{{$key->branch}}</span>
                                </a>
                            </td>
                            <td>
                                <a href="{{url('user/' . $key->loan_officer_id . '/show')}}">
                                    <span>{{$key->staff}}</span>
                                </a>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button href="#" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown">
                                        <i class="fas fa-ellipsis-h"></i>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a href="{{url('client/' . $key->id . '/show')}}" class="dropdown-item">
                                            <i class="far fa-eye"></i>
                                            <span>{{trans_choice('core::general.detail',2)}}</span>
                                        </a>
                                        @can('core.payment_types.edit')
                                            <a href="{{url('client/' . $key->id . '/edit')}}" class="dropdown-item">
                                                <i class="far fa-edit"></i>
                                                <span>{{trans_choice('core::general.edit',1)}}</span>
                                            </a>
                                        @endcan
                                        <div class="divider"></div>
                                        @can('core.payment_types.destroy')
                                            <a href="{{url('client/' . $key->id . '/destroy')}}"
                                               class="dropdown-item confirm">
                                                <i class="fas fa-trash"></i>
                                                <span>{{trans_choice('core::general.delete',1)}}</span>
                                            </a>

                                        @endcan
                                    </div>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div> -->
            
        </div>
    </section>
@endsection

