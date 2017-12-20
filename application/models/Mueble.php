<?php

class Mueble extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = 'America/Mexico_City';
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT *
                FROM mueble";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT l.*
                FROM mueble l
                WHERE l.id_mueble= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {
     
        $this->db->where('id_mueble', $id);
        $this->db->delete('mueble');
        $count = $this->db->affected_rows();
        return $count;
    } 

    public function create_one($mueble) {

        $now = date("Y-m-d H:i:s");
        $mueble["fecha"] = $now;

        $this->db->insert('mueble', $mueble);
        $id_mueble = $this->db->insert_id();

        $mueble = $this->get_one($id_mueble);
        return $mueble;
    }

    public function update_one($id, $props) {

        $where = "id_mueble = $id";
        $sql = $this->db->update_string('mueble', $props, $where);
        $this->db->query($sql);

        $mueble = $this->get_one($id);
        return $mueble;
    }

}
