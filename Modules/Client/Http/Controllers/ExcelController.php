<?php

namespace Modules\Client\Http\Controllers;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Laracasts\Flash\Flash;
use Modules\Branch\Entities\Branch;
use Modules\Client\Entities\Client;
use Modules\Client\Entities\ClientType;
use Modules\Client\Entities\ClientUser;
use Modules\Client\Entities\Profession;
use Modules\Client\Entities\Title;
use Modules\Core\Entities\Country;
use Modules\CustomField\Entities\CustomField;
use Modules\User\Entities\User;
use Spatie\Permission\Models\Role;
use Yajra\DataTables\Facades\DataTables;
use Modules\Loan\Entities\LoanWallets;
use Modules\Loan\Entities\LoanLimits;
use AfricasTalking\SDK\AfricasTalking;

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Reader\Exception;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use PhpOffice\PhpSpreadsheet\IOFactory;

class ExcelController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', '2fa']);
        $this->middleware(['permission:client.clients.index'])->only(['index', 'show', 'get_clients']);
        $this->middleware(['permission:client.clients.create'])->only(['create', 'store']);
        $this->middleware(['permission:client.clients.edit'])->only(['edit', 'update']);
        $this->middleware(['permission:client.clients.destroy'])->only(['destroy']);
        $this->middleware(['permission:client.clients.user.create'])->only(['store_user', 'create_user']);
        $this->middleware(['permission:client.clients.user.destroy'])->only(['destroy_user']);
        $this->middleware(['permission:client.clients.activate'])->only(['change_status']);

    }


       /**
    * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
    */
   function index()
   {
       $data =[];// DB::table('clients')->orderBy('id', 'DESC')->paginate(5);
       //echo '<pre>';print_r($data);exit;

        return theme_view('client::bulk.index', compact('data'));
   }
   /**
    * @param Request $request
    * @return \Illuminate\Http\RedirectResponse
    * @throws \Illuminate\Validation\ValidationException
    * @throws \PhpOffice\PhpSpreadsheet\Exception
    */
   function importData(Request $request){
       $request->validate( [
           'uploaded_file' => 'required|file|mimes:xls,xlsx'
       ]);
       $the_file = $request->file('uploaded_file');
       try{
           $spreadsheet = IOFactory::load($the_file->getRealPath());
           $sheet        = $spreadsheet->getActiveSheet();
           $row_limit    = $sheet->getHighestDataRow();
           $column_limit = $sheet->getHighestDataColumn();
           $row_range    = range( 2, $row_limit );

          //print_r($sheet);exit;

           $column_range = range( 'O', $column_limit );
           $startcount = 2;
           $data = array();
           foreach ( $row_range as $row ) {
             $idnumber = Client::where('idnumber', '=', $sheet->getCell( 'M' . $row )->getValue())->first();
           if ($idnumber) {
            //echo $idnumber;

           }else{
               $data[] = [
                   'branch_id' =>$sheet->getCell( 'A' . $row )->getValue(),
                   'loan_officer_id' => $sheet->getCell( 'B' . $row )->getValue(),
                   'first_name' => $sheet->getCell( 'C' . $row )->getValue(),
                   'middle_name' => $sheet->getCell( 'D' . $row )->getValue(),
                   'last_name' => $sheet->getCell( 'E' . $row )->getValue(),
                   'gender' =>$sheet->getCell( 'F' . $row )->getValue(),
                   'status' =>$sheet->getCell( 'G' . $row )->getValue(),
                   'marital_status' => $sheet->getCell( 'H' . $row )->getValue(),
                   'country_id' => $sheet->getCell( 'I' . $row )->getValue(),
                   'title_id' => $sheet->getCell( 'J' . $row )->getValue(),
                   'mobile' => $sheet->getCell( 'K' . $row )->getValue(),
                   'phone' => $sheet->getCell( 'L' . $row )->getValue(),
                   'idnumber' =>$sheet->getCell( 'M' . $row )->getValue(),
                   'dob' => $sheet->getCell( 'N' . $row )->getValue(),
                   'address' =>$sheet->getCell( 'O' . $row )->getValue(),
                   'client_type_id' =>1,
                   'external_id' =>$sheet->getCell( 'M' . $row )->getValue(),
                   'account_number' =>$sheet->getCell( 'K' . $row )->getValue(),
                   'created_date' =>date("Y-m-d"),
                   'created_at' =>date("Y-m-d H:i:s"),
                   'updated_at' =>date("Y-m-d H:i:s"),
                   'orgid' =>Auth::user()->orgid,
                   'created_by_id' =>Auth::id(),
               ];

               //$startcount++;
           }
           $startcount++;
           }
           DB::table('clients')->insert($data);
       } catch (Exception $e) {
           $error_code = $e->errorInfo[1];
           return back()->withErrors('There was a problem uploading the data!');
       }
       return back()->withSuccess('Great! Data has been successfully uploaded.');
   }
   /**
    * @param $customer_data
    */
   public function ExportExcel($customer_data){
       ini_set('max_execution_time', 0);
       ini_set('memory_limit', '4000M');
       try {
           $spreadSheet = new Spreadsheet();
           $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
           $spreadSheet->getActiveSheet()->fromArray($customer_data);
           $Excel_writer = new Xls($spreadSheet);
           header('Content-Type: application/vnd.ms-excel');
           header('Content-Disposition: attachment;filename="Clients_ExportedData-'.Auth::user()->orgid.'.xls"');
           header('Cache-Control: max-age=0');
           ob_end_clean();
           $Excel_writer->save('php://output');
           exit();
       } catch (Exception $e) {
           return;
       }
   }


    /**
    * @param $customer_data
    */
   public function ExportExcelSample($customer_data){
       ini_set('max_execution_time', 0);
       ini_set('memory_limit', '4000M');
       try {
           $spreadSheet = new Spreadsheet();
           $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
           $spreadSheet->getActiveSheet()->fromArray($customer_data);
           $Excel_writer = new Xls($spreadSheet);
           header('Content-Type: application/vnd.ms-excel');
           header('Content-Disposition: attachment;filename="Clients_Sample-'.Auth::user()->orgid.'.xls"');
           header('Cache-Control: max-age=0');
           ob_end_clean();
           $Excel_writer->save('php://output');
           exit();
       } catch (Exception $e) {
           return;
       }
   }
   /**
    *This function loads the customer data from the database then converts it
    * into an Array that will be exported to Excel
    */
   function exportData(){
       //Client::where('orgid', '=', Auth::user()->orgid)->first();
       $data =Client::where('orgid', '=', Auth::user()->orgid)->get(); //DB::table('clients')->where('orgid', '=', Auth::user()->orgid)->orderBy('id', 'DESC')->get();
       $data_array [] = array("Branch","Loan Officer","First Name",
        "Middle Name","Last Name","Gender",'Status','Marital Status','Country','title','Mobile','Phone',
        'Id number','Dob','Address','ORGID','account_number');
       foreach($data as $data_item)
       {


           $data_array[] = array(

                   'branch_id' =>$data_item->branch_id,
                   'loan_officer_id' => $data_item->loan_officer_id,
                   'first_name' => $data_item->first_name,
                   'middle_name' =>$data_item->middle_name,
                   'last_name' => $data_item->last_name,
                   'gender' =>$data_item->gender,
                   'status' =>$data_item->status,
                   'marital_status' => $data_item->marital_status,
                   'country_id' => $data_item->country_id,
                   'title_id' => $data_item->title_id,
                   'mobile' => $data_item->mobile,
                   'phone' => $data_item->phone,
                   'idnumber' =>$data_item->idnumber,
                   'dob' => $data_item->dob,
                   'address' =>$data_item->address,
                   'orgid' =>$data_item->orgid,
                   'account_number' =>$data_item->account_number,


               // 'CustomerName' =>$data_item->CustomerName,
               // 'Gender' => $data_item->Gender,
               // 'Address' => $data_item->Address,
               // 'City' => $data_item->City,
               // 'PostalCode' => $data_item->PostalCode,
               // 'Country' =>$data_item->Country
           );
       }
       $this->ExportExcel($data_array);
   }



    function downloadData(){
       //Client::where('orgid', '=', Auth::user()->orgid)->first();
       //$data =Client::where('orgid', '=', Auth::user()->orgid)->first(); //DB::table('clients')->where('orgid', '=', Auth::user()->orgid)->orderBy('id', 'DESC')->get();
        $data_array [] = array("Branch","Loan Officer","First Name",
        "Middle Name","Last Name","Gender",'Status','Marital Status','Country','title','Mobile','Phone',
        'Id number','Dob','Address');
       // foreach($data as $data_item)
       // {



       //     $data_array[] = array(

       //             'branch_id' =>$data_item->branch_id,
       //             'loan_officer_id' => $data_item->loan_officer_id,
       //             'first_name' => $data_item->first_name,
       //             'middle_name' =>$data_item->middle_name,
       //             'last_name' => $data_item->last_name,
       //             'gender' =>$data_item->gender,
       //             'status' =>$data_item->status,
       //             'marital_status' => $data_item->marital_status,
       //             'country_id' => $data_item->country_id,
       //             'title_id' => $data_item->title_id,
       //             'mobile' => $data_item->mobile,
       //             'phone' => $data_item->phone,
       //             'idnumber' =>$data_item->idnumber,
       //             'dob' => $data_item->dob,
       //             'address' =>$data_item->address,


       //         // 'CustomerName' =>$data_item->CustomerName,
       //         // 'Gender' => $data_item->Gender,
       //         // 'Address' => $data_item->Address,
       //         // 'City' => $data_item->City,
       //         // 'PostalCode' => $data_item->PostalCode,
       //         // 'Country' =>$data_item->Country
       //     );
       // }
       $this->ExportExcelSample($data_array);
   }


   // public function getDownload(){

   //      $file = public_path()."/downloads/info.pdf";
   //      $headers = array('Content-Type: application/pdf',);
   //      return Response::download($file, 'info.pdf',$headers);
   //  }



    

}
