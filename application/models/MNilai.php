<?php

class MNilai extends CI_Model{

    public $kdKecamatan;
    public $kdKriteria;
    public $nilai;

    public function __construct(){
        parent::__construct();
    }

    private function getTable()
    {
        return 'nilai';
    }

    private function getData()
    {
        $data = array(
            'kdKecamatan' => $this->kdKecamatan,
            'kdKriteria' => $this->kdKriteria,
            'nilai' => $this->nilai
        );

        return $data;
    }

    public function insert()
    {
        $status = $this->db->insert($this->getTable(), $this->getData());
        return $status;
    }

    public function getNilaiByUniveristas($id)
    {
        $query = $this->db->query(
            'select u.kdKecamatan, u.kecamatan, k.kdKriteria, n.nilai from kecamatan u, nilai n, kriteria k, subkriteria sk where u.kdKecamatan = n.kdKecamatan AND k.kdKriteria = n.kdKriteria and k.kdKriteria = sk.kdKriteria and u.kdKecamatan = '.$id.' GROUP by n.nilai '
        );
        if($query->num_rows() > 0){
            foreach ($query->result() as $row) {
                $nilai[] = $row;
            }

            return $nilai;
        }
    }

    public function getNilaiUniveristas()
    {
        $query = $this->db->query(
            'select u.kdKecamatan, u.kecamatan, k.kdKriteria, k.kriteria ,n.nilai from kecamatan u, nilai n, kriteria k where u.kdKecamatan = n.kdKecamatan AND k.kdKriteria = n.kdKriteria '
        );
        if($query->num_rows() > 0){
            foreach ($query->result() as $row) {
                $nilai[] = $row;
            }

            return $nilai;
        }
    }

    public function update()
    {
        $data = array('nilai' => $this->nilai);
        $this->db->where('kdKecamatan', $this->kdKecamatan);
        $this->db->where('kdKriteria', $this->kdKriteria);
        $this->db->update($this->getTable(), $data);
        return $this->db->affected_rows();
    }

    public function delete($id)
    {
        $this->db->where('kdKecamatan', $id);
        return $this->db->delete($this->getTable());
    }
}