<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Pegawai</title>

  <!-- Bootstrap core CSS -->
  <link href="<?php echo base_url('/assets/plugins/bootstrap4/css/bootstrap.min.css')?>" rel="stylesheet" type="text/css"/>

  <!-- Fontawesome 5.0 -->
  <link href="<?php echo base_url('/assets/plugins/fontawesome5/css/fontawesome.min.css')?>" rel="stylesheet">
  <link href="<?php echo base_url('/assets/plugins/fontawesome5/css/fa-brands.min.css')?>" rel="stylesheet">
  <link href="<?php echo base_url('/assets/plugins/fontawesome5/css/fa-solid.min.css')?>" rel="stylesheet">

  <!-- Jquery UI CSS -->
  <link href="<?php echo base_url('/assets/plugins/jquery/jquery-ui.min.css')?>" rel="stylesheet">

</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="box-shadow: 0 5px 0 0 #e6ede8;">
    <a class="navbar-brand" href="href="<?php echo base_url()?>"">
      <img src="<?php echo base_url('/assets/img/arkademy.png')?>" style="height: 50px">
    </a>
    <a class="navbar-brand" href="<?php echo base_url()?>">ARKADEMY BOOTCAMP</a>
  </nav>
  <div style="margin: 10px; text-align: right">
    <button type="button" class="btn btn-warning" style="color: white" onclick="addPegawai()">ADD</button>
  </div>
  <table class="table table-hover">
    <thead class="thead-dark">
      <tr>
        <th scope="col" style="text-align: center">Name</th>
        <th scope="col" style="text-align: center">Work</th>
        <th scope="col" style="text-align: center">Salary</th>
        <th scope="col" style="text-align: center">Action</th>
      </tr>
    </thead>
    <tbody id="tbody_pegawai">
    </tbody>
  </table>

  <!-- The Modal -->
  <div class="modal" id="add_modal">
    <div class="modal-dialog">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">ADD DATA</h4>
          <button type="button" class="close" style="color: red" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
        <div class="modal-body">
          <form id="form_pegawai">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Name.." name="name">
            </div>
            <div class="form-group">
              <select class="form-control" name="id_work">
                <option value="" selected disabled>Work..</option>
                <?php for($i = 0; $i < count($work); $i++){ ?>
                  <option value="<?php echo $work[$i]->id?>"><?php echo $work[$i]->name?></option>
                <?php } ?>
              </select>
            </div>
            <div class="form-group">
              <select class="form-control" name="id_salary">
                <option value="" selected disabled>Salary..</option>
                <?php for($i = 0; $i < count($kategori); $i++){ ?>
                  <option value="<?php echo $kategori[$i]->id?>"><?php echo "Rp." . number_format($kategori[$i]->salary,0,',','.');?></option>
                <?php } ?>
              </select>
            </div>
            <div style="text-align: right">
              <button type="button" class="btn btn-warning" onclick="submitAddPegawai()" style="color: white">ADD</button>
            </div>
          </form> 
        </div>

        <div class="modal" id="modal_msg">
          <div class="modal-dialog">
            <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <button type="button" class="close" style="color: red" data-dismiss="modal">&times;</button>
              </div>
              <!-- Modal body -->
              <div class="modal-body" style="text-align: center">
                <p><i id="icon_msg" class="fa fa-check"></i></p>
                <p id="content_msg">Berhasil menambahkan data baru</p>
              </div>
            </div>
          </div>
        </div>



  <!-- Bootstrap core JavaScript -->
  <script src="<?php echo base_url('/assets/plugins/jquery/jquery.min.js')?>"></script>
  <script src="<?php echo base_url('/assets/plugins/bootstrap4/js/bootstrap.bundle.min.js')?>"></script>

  <!-- Jquery UI Javascript -->
  <script src="<?php echo base_url('/assets/plugins/jquery/jquery-ui.min.js')?>"></script>

</body>

</html>
<script>
  //Startup
  getPegawai();

  //Global Variable
  var myChart = [];

  //Get Pegawai
  function getPegawai(){
    $.ajax({
      url: "<?php echo site_url('welcome/get_pegawai')?>",
      type: "post",
      dataType: "json",
      success: function(data){
        $("#tbody_pegawai").html('');
        for(let i = 0; i < data.length; i++){
          let html = '<tr>';
            html += '<td style="text-align: center">'+data[i].name+'</td>';
            html += '<td style="text-align: center">'+data[i].work_name+'</td>';
            html += '<td style="text-align: center">Rp.'+konversiKeRupiah(data[i].salary)+'</td>';
            html += '<td style="text-align: center">';
              html += '<button class="btn btn-primary" onclick="edit(\''+id+'\', \''+name+'\', \''+work_name+'\', \''+salary+'\')">';
            html += '</td>';
          html += '</tr>';
          $("#tbody_pegawai").append(html);
        }
      }
    });
  }

  //Add Pegawai
  function addPegawai(){
    $("#add_modal").modal('show');
  }

  //Submit Add Pegawai
  function submitAddPegawai(){
    $.ajax({
      url: "<?php echo site_url('welcome/submit_add_pegawai')?>",
      type: "post",
      data: $("#form_pegawai").serialize(),
      dataType: "text",
      success: function(data){
        showMessage("add", data);
        getPegawai();
      }
    });
  }

  //Alert Message
  function showMessage(action, status){
    let icon = '';
    let text = '';
    switch(action) {
      case "add":
        text = "Berhasil menambahkan data baru";
        break;
      case "delete":
        text = "Berhasil menghapus data";
        break;
      case "edit":
        text = "Berhasil merubah data";
        break;
    }
    if(status == "ok"){
      icon = 'check';
    } else {
      icon = 'times';
    }
    showMessageModal(text, icon); 
  }

  function showMessageModal(content, icon){
    $("#icon_msg").attr('class', 'fa fa-'+icon);
    $("#icon_msg").text(content);
    $("#modal_msg").modal('show');
  }

  // Konversi Rupiah
  function konversiKeRupiah(angka){
		var rupiah = '';		
		var angkarev = angka.toString().split('').reverse().join('');
		for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.';
		return rupiah.split('',rupiah.length-1).reverse().join('');
	}

  
</script>