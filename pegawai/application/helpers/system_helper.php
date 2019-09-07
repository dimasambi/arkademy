<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('query_sparql')){
    function query_sparql($graph_uri, $query, $output_type="json") {
        switch ($output_type) {
            case 'json':
                $format = 'application/sparql-results+json';
                break;
            
            default:
                $format = '';
                break;
        }
        $graph_uri_encode = rawurlencode($graph_uri);
        $query_encode = urlencode($query);
        $type_encode = '&should-sponge=&format=application/'.urlencode($format).'&timeout=0&debug=on';
        $url = 'http://'.VIRTUOSO_HOST.':'.VIRTUOSO_PORT.'/sparql?';
        $url .= 'default-graph-uri='.$graph_uri_encode;
        $url .= '&query='.$query_encode;
        $url .= $type_encode;
        $result = file_get_contents($url);
		return $result;
    }
}

if (!function_exists('is_logged_in')){
    function is_logged_in() {
        $ci = &get_instance();
        $ci->load->library('session');
        $account_id = $ci->session->userdata('account_id');
		return isset($account_id);
    }
}

if (!function_exists('show_error_page')){
    function show_error_page($error_code) {
        redirect(site_url("error/error_".$error_code));
    }
}

if (!function_exists('upload_multiple_file')){
    function upload_multiple_file($config, $files, $input_name){
        $ci = &get_instance();
		$ci->load->helper("file");
        $ci->load->library('upload', $config);
    
        $result = array();
        foreach ($files['name'] as $key => $image) {
            $_FILES[$input_name.'[]']['name']= $files['name'][$key];
            $_FILES[$input_name.'[]']['type']= $files['type'][$key];
            $_FILES[$input_name.'[]']['tmp_name']= $files['tmp_name'][$key];
            $_FILES[$input_name.'[]']['error']= $files['error'][$key];
            $_FILES[$input_name.'[]']['size']= $files['size'][$key];
            if ( !$ci->upload->do_upload($input_name.'[]')){
                $result[$key] = array('error' => 1, 'msg' => $ci->upload->display_errors());
            } else {
                $result[$key] = array('error' => 0, 'result' => $ci->upload->data());
            }
        }
        return $result;
    }
}