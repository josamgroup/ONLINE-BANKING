@extends('core::layouts.auth')
@section("title")
   OTP
@endsection
@section('content')
    <div class="login-box">
        <div class="login-logo">
            <a href="{{url('/')}}" class="logo-link text-center">
                @if(!empty($logo=\Modules\Setting\Entities\Setting::where('setting_key','core.company_logo')->first()->setting_value))
                    <img class="logo-light logo-img logo-img-lg" src="{{asset('storage/uploads/'.$logo)}}"
                         srcset="{{asset('storage/uploads/'.$logo)}} 2x"
                         alt="logo">
                @else
                    <h4>{{\Modules\Setting\Entities\Setting::where('setting_key','core.company_name')->first()->setting_value}}</h4>
                @endif
            </a>
        </div>
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Verify Otp</p>
               
                <form method="post" action="{{ route('login') }}">
                    {{csrf_field()}}
                    <div class="form-group">
                        <div class="form-label-group">
                            <label class="form-label" for="email">Enter OTP</label>
                        </div>
                        <input type="number" class="form-control form-control-lg @error('otp') is-invalid @enderror"
                               name="otp"
                               placeholder="Enter OTP" value="{{ old('otp') }}"
                               required
                               autocomplete="otp" id="otp" onkeyup="showResult(this.value,'{{$user->id }}')" autofocus>

                                  @error('otp')
                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                        @enderror
                         <input type="hidden" name="id" value="{{$user->id }}">
                         <input type="hidden" name="email" value="{{$email }}">
                         <input type="hidden" name="password" value="{{$password }}">
                     
                    </div>

                     <div class="row ">
                        @if(Session::has('success'))

                                <div class="alert alert-success col-12 text-center">

                                    {{Session::get('success')}}

                                </div>

                            @endif


                            @if(Session::has('error'))

                                <div class="alert alert-danger col-12 text-center">

                                    {{Session::get('error')}}

                                </div>

                            @endif
                        </div>

                        <div id="livesearch" style="color: green;text-align: center;display: none">Otp  Ok</div>
                        <div id="livesearch2" style="color: red;text-align: center;display: none">Otp Not Valid</div>

                
                    <div class="form-group">
                        <button class="btn btn-lg btn-primary btn-block " id="verify" disabled>Proceed To Login</button>
                    </div>
                </form>
             
                <p class="mb-1">
                    <a href="{{ route('login') }}">{{trans_choice("user::general.back_to_login",1)}}</a>
                </div>
            </div>
        </div>
    </div>

<script type="text/javascript">
    function showResult(str,id) {
 document.getElementById("verify").disabled = true;

  if (str.length < 5) {
    //  var x = document.getElementById("livesearch");
    // var x2 =document.getElementById("livesearch2");
    // x.style.display = "none";
    // x2.style.display = "none";
    //document.getElementById("livesearch").innerHTML="";
    
    return;
  }

  if (str.length == 6) {

  var xmlhttp=new XMLHttpRequest();
  xmlhttp.onreadystatechange=function() {
    if (this.readyState==4 && this.status==200) {
        let data =JSON.parse(this.responseText);
        console.log(data);
         var x = document.getElementById("livesearch");
         var x3 = document.getElementById("verify");
        
         var x2 =document.getElementById("livesearch2");
        if(data.status === true){
            x.style.display = "block";
            //x3.style.display = "block";
            document.getElementById("verify").disabled = false;
            x2.style.display = "none";
       //document.getElementById("livesearch")
        }else{
            x.style.display = "none";
            document.getElementById("verify").disabled = true;
            //x3.style.display = "none";
            x2.style.display = "block";
        //document.getElementById("livesearch2").innerHTML= data.status;
        }

      
      // document.getElementById("livesearch").style.border="1px solid #A5ACB2";
    }
  }
  xmlhttp.open("GET","verify?otp="+str+"&id="+id,true);
  xmlhttp.send();
}

}
</script>
@endsection
