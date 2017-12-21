<?php

class Puerta extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = 'America/Mexico_City';
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT *
                FROM puerta_mueble";

        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_puertas_mueble($id_mueble) {

        $sql = "SELECT *
                FROM puerta_mueble
                WHERE id_mueble= $id_mueble";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT l.*
                FROM puerta l
                WHERE l.id_puerta= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {

        $this->db->where('id_puerta', $id);
        $this->db->delete('puerta');
        $count = $this->db->affected_rows();
        return $count;
    }

    public function create_one($puerta) {

        $now = date("Y-m-d H:i:s");
        $puerta["fecha"] = $now;

        $this->db->insert('puerta', $puerta);
        $id_puerta = $this->db->insert_id();

        $puerta = $this->get_one($id_puerta);
        return $puerta;
    }

    public function update_one($id, $props) {

        $where = "id_puerta = $id";
        $sql = $this->db->update_string('puerta', $props, $where);
        $this->db->query($sql);

        $puerta = $this->get_one($id);
        return $puerta;
    }

}
