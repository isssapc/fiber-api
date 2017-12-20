<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Puertas extends MY_Controller {

    public function __construct() {
        parent::__construct();
        //en el parent parent::__construct se ejecutan los operaciones de middleware
        $database = $this->middlewares['auth']->claims["db"];
        //$this->db->db_select($database);

        $this->load->model("puerta");
   
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
        $datos = $this->puerta->get_all();
        $this->response($datos);
    } 

    public function get_puerta_get($id) {
        $puerta = $this->puerta->get_one($id);        
        $this->response(["puerta" => $puerta]);
    }  

    public function del_puerta_post($id) {
        $count = $this->puerta->del_one($id);
        $this->response(array("count" => $count));
    }  

    public function create_puerta_post() {
        $puerta = $this->post("puerta");
        $datos = $this->puerta->create_one($puerta);
        $this->response($datos);
    }

    public function update_puerta_post($id) {
        $puerta = $this->post("puerta");
        $datos = $this->puerta->update_one($id, $puerta);
        $this->response($datos);
    }

}
