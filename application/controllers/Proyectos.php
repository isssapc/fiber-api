<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Proyectos extends MY_Controller {

    public function __construct() {
        parent::__construct();
        //en el parent parent::__construct se ejecutan los operaciones de middleware
        $database = $this->middlewares['auth']->claims["db"];
        //$this->db->db_select($database);

        $this->load->model("proyecto");
   
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
        $datos = $this->proyecto->get_all();
        $this->response($datos);
    } 

    public function get_proyecto_get($id) {
        $proyecto = $this->proyecto->get_one($id);       
        $this->response(["proyecto" => $proyecto]);
    }  

    public function del_proyecto_post($id) {
        $count = $this->proyecto->del_one($id);
        $this->response(array("count" => $count));
    }  

    public function create_proyecto_post() {
        $proyecto = $this->post("proyecto");
        $datos = $this->proyecto->create_one($proyecto);
        $this->response($datos);
    }

    public function update_proyecto_post($id) {
        $proyecto = $this->post("proyecto");
        $datos = $this->proyecto->update_one($id, $proyecto);
        $this->response($datos);
    }

}
