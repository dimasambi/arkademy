<?php
  class Welcome_model extends CI_Model {
    function __construct() {
        parent::__construct();
        $this->load->database();
    }

    public function get_pegawai(){
      $this->db->select('nama.name, work.name as work_name, kategori.salary');
      $this->db->from('nama');
      $this->db->join('work', 'nama.id_work = work.id', 'inner');
      $this->db->join('kategori', 'nama.id_salary = kategori.id', 'inner');
      $this->db->order_by('nama.name', 'asc');
      $query = $this->db->get();
  		return $query->result();
    }

    public function get_work(){
      $this->db->select('id, name');
      $this->db->from('work');
      $this->db->order_by('name', 'asc');
      $query = $this->db->get();
  		return $query->result();
    }

    public function get_kategori(){
      $this->db->select('id, salary');
      $this->db->from('kategori');
      $this->db->order_by('id', 'asc');
      $query = $this->db->get();
  		return $query->result();
    }

    public function add_pegawai($post_data){
      $this->db->insert('nama', $post_data);
      if($this->db->affected_rows() > 0){
        $result = 1;
      } else {
        $result = 0;
      }
      return $result;
    }
  }
?>
