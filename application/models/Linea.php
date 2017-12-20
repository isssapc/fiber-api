<?php

class Linea extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = 'America/Mexico_City';
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT *
                FROM linea_puerta";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT l.*
                FROM linea_puerta l
                WHERE l.id_linea_puerta= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {
     
        $this->db->where('id_linea_puerta', $id);
        $this->db->delete('linea_puerta');
        $count = $this->db->affected_rows();
        return $count;
    } 

    public function create_one($linea_puerta) {

        $now = date("Y-m-d H:i:s");
        $linea_puerta["fecha"] = $now;

        $this->db->insert('linea_puerta', $linea_puerta);
        $id_linea_puerta = $this->db->insert_id();

        $linea_puerta = $this->get_one($id_linea_puerta);
        return $linea_puerta;
    }

    public function update_one($id, $props) {

        $where = "id_linea_puerta = $id";
        $sql = $this->db->update_string('linea_puerta', $props, $where);
        $this->db->query($sql);

        $linea_puerta = $this->get_one($id);
        return $linea_puerta;
    }

}
