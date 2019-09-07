<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends MX_Controller  {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */

	public function __construct() {
		parent::__construct();

		// Load form validation library
		$this->load->library('form_validation');

		// Load session library
		$this->load->library('session');

		// Load hris system helper
		$this->load->helper('system_helper');

		// Load model
		$this->load->model('welcome_model');
	}

	public function index(){
		$data = array();
		$data["work"] = $this->welcome_model->get_work();
		$data["kategori"] = $this->welcome_model->get_kategori();
		$this->load->view('welcome', $data);
	}

	public function get_pegawai(){
		$result = $this->welcome_model->get_pegawai();
		echo json_encode($result);
	}

	public function submit_add_pegawai(){
		$return = array();
		$result = $this->welcome_model->add_pegawai($_POST);
		if($result == 1){
			$return = "ok";
		} else {
			$return = "nok";
		}
		echo $return;
	}
}
