<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Muebles extends MY_Controller {

    public function __construct() {
        parent::__construct();
        //en el parent parent::__construct se ejecutan los operaciones de middleware
        $database = $this->middlewares['auth']->claims["db"];
        //$this->db->db_select($database);

        $this->load->model("mueble");
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
        $datos = $this->mueble->get_all();
        $this->response($datos);
    }

    public function get_muebles_con_puertas_get() {
        $muebles = $this->mueble->get_all();


        foreach ($muebles as &$mueble) {

            $mueble['puertas'] = $this->puerta->get_puertas_mueble($mueble['id_mueble']);
           
        }
        unset($mueble);


        $this->response($muebles);
    }

    public function get_mueble_get($id) {
        $mueble = $this->mueble->get_one($id);
        $this->response(["mueble" => $mueble]);
    }

    public function del_mueble_post($id) {
        $count = $this->mueble->del_one($id);
        $this->response(array("count" => $count));
    }

    public function create_mueble_post() {
        $mueble = $this->post("mueble");
        $datos = $this->mueble->create_one($mueble);
        $this->response($datos);
    }

    public function update_mueble_post($id) {
        $mueble = $this->post("mueble");
        $datos = $this->mueble->update_one($id, $mueble);
        $this->response($datos);
    }

}
