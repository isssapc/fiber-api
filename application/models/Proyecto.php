<?php

class Proyecto extends CI_Model {

    public function __construct() {
        parent::__construct();
        $timezone = 'America/Mexico_City';
        date_default_timezone_set($timezone);
    }

    public function get_all() {

        $sql = "SELECT *
                    FROM proyecto";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id) {

        $sql = "SELECT l.*
                FROM proyecto l
                WHERE l.id_proyecto= $id LIMIT 1";
        $query = $this->db->query($sql);
        return $query->row_array();
    }

    public function del_one($id) {
     
        $this->db->where('id_proyecto', $id);
        $this->db->delete('proyecto');
        $count = $this->db->affected_rows();
        return $count;
    } 

    public function create_one($proyecto) {

        $now = date("Y-m-d H:i:s");
        $proyecto["fecha"] = $now;

        $this->db->insert('proyecto', $proyecto);
        $id_proyecto = $this->db->insert_id();

        $proyecto = $this->get_one($id_proyecto);
        return $proyecto;
    }

    public function update_one($id, $props) {

        $where = "id_proyecto = $id";
        $sql = $this->db->update_string('proyecto', $props, $where);
        $this->db->query($sql);

        $proyecto = $this->get_one($id);
        return $proyecto;
    }

}
