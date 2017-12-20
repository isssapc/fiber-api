<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Lineas extends MY_Controller {

    public function __construct() {
        parent::__construct();
        //en el parent parent::__construct se ejecutan los operaciones de middleware
        $database = $this->middlewares['auth']->claims["db"];
        //$this->db->db_select($database);

        $this->load->model("linea");
   
    }

    protected function middleware() {
        /**
         * Return the list of middlewares you want to be applied,
         * Here is list of some valid options
         *
         * admin_auth                    // As used below, simplest, will be applied to all
         * someother|except:index,list   // This will be only applied to posts()
         * yet_another_one|only:index    // This will be only applied to index()
         * */
        return array('auth');
    }

    public function index_get() {
        $datos = $this->linea->get_all();
        $this->response($datos);
    } 

    public function get_linea_get($id) {
        $linea = $this->linea->get_one($id);        
        $this->response(["linea" => $linea]);
    }  

    public function del_linea_post($id) {
        $count = $this->linea->del_one($id);
        $this->response(array("count" => $count));
    }  

    public function create_linea_post() {
        $linea = $this->post("linea");
        $datos = $this->linea->create_one($linea);
        $this->response($datos);
    }

    public function update_linea_post($id) {
        $linea = $this->post("linea");
        $datos = $this->linea->update_one($id, $linea);
        $this->response($datos);
    }

}
