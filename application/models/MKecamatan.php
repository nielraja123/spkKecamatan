<?php

class MKecamatan extends CI_Model{

    public $kdKecamatan;
    public $kecamatan;

    public function __construct(){
        parent::__construct();
    }

    private function getTable(){
        return 'kecamatan';
    }

    private function getData(){
        $data = array(
            'kecamatan' => $this->kecamatan
        );

        return $data;
    }

    public function getAll()
    {
        $kecamatan = array();
        $query = $this->db->get($this->getTable());
        if($query->num_rows() > 0){
            foreach ($query->result() as $row) {
                $kecamatan[] = $row;
            }
        }
        return $kecamatan;
    }


    public function insert()
    {
        $this->db->insert($this->getTable(), $this->getData());
        return $this->db->insert_id();
    }

    public function update($where)
    {
        $status = $this->db->update($this->getTable(), $this->getData(), $where);
        return $status;

    }

    public function delete($id)
    {
        $this->db->where('kdKecamatan', $id);
        return $this->db->delete($this->getTable());
    }

    public function getLastID(){
        $this->db->select('kdKecamatan');
        $this->db->order_by('kdKecamatan', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get($this->getTable());
        return $query->row();
    }


}