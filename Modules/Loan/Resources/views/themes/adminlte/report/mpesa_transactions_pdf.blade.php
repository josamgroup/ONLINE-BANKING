<style>
    body{
        font-size: 9px;
    }
    .table {
        width: 100%;
        border: 1px solid #ccc;
        border-collapse: collapse;
    }

    .table th, td {
        padding: 5px;
        text-align: left;
        border: 1px solid #ccc;
    }

    .light-heading th {
        background-color: #eeeeee
    }

    .green-heading th {
        background-color: #4CAF50;
        color: white;
    }

    .text-center {
        text-align: center;
    }

    .table-striped tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .text-danger {
        color: #a94442;
    }
    .text-success {
        color: #3c763d;
    }

</style>
<h3 class="text-center">{{\Modules\Setting\Entities\Setting::where('setting_key','core.company_name')->first()->setting_value}}</h3>
<h3 class="text-center"> Mpesa Transactions C2B Payments</h3>
<table class="table table-bordered table-striped table-hover">
    <thead>
   <tr class="green-heading">
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
                                <td>{{ number_format( $key->TransAmount,2) }} </td>
                                <td>{{ $key->BusinessShortCode }}</td>
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
                           <!--  <td></td> -->

                        </tr>
                        </tfoot>
</table>