<?php

if (!defined('BASEPATH')) exit('No direct script access allowed');

class Kecamatan extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->page->setTitle('Kecamatan');
        $this->load->model('MKriteria');
        $this->load->model('MSubKriteria');
        $this->load->model('MKecamatan');
        $this->load->model('MNilai');
        $this->page->setLoadJs('assets/js/kecamatan');
    }

    public function index()
    {
        $data['kecamatan'] = $this->MKecamatan->getAll();
        loadPage('kecamatan/index', $data);
    }

    public function tambah($id = null)
    {

        if ($id == null) {
            if (count($_POST)) {
                $this->form_validation->set_rules('kecamatan', '', 'trim|required');
                if ($this->form_validation->run() == false) {
                    $errors = $this->form_validation->error_array();
                    $this->session->set_flashdata('errors', $errors);
                    redirect(current_url());
                } else {

                    $kecamatan = $this->input->post('kecamatan');
                    $nilai = $this->input->post('nilai');

                    $this->MKecamatan->kecamatan = $kecamatan;
                    if ($this->MKecamatan->insert() == true) {
                        $success = false;
                        $kdKecamatan = $this->MKecamatan->getLastID()->kdKecamatan;
                        foreach ($nilai as $item => $value) {
                            $this->MNilai->kdKecamatan = $kdKecamatan;
                            $this->MNilai->kdKriteria = $item;
                            $this->MNilai->nilai = $value;
                            if ($this->MNilai->insert()) {
                                $success = true;
                            }
                        }
                        if ($success == true) {
                            $this->session->set_flashdata('message', 'Berhasil menambah data :)');
                            redirect('kecamatan');
                        } else {
                            echo 'gagal';
                        }
                    }
                }
                //-----
            }else{
                $data['dataView'] = $this->getDataInsert();
                loadPage('kecamatan/tambah', $data);
            }
        }else{
            if(count($_POST)){
                $kdKecamatan = $this->uri->segment(3, 0);
                dump($kdKecamatan);
                if($kdKecamatan > 0){
                    $kecamatan = $this->input->post('kecamatan');
                    $nilai = $this->input->post('nilai');
                    $where = array('kdKecamatan' => $kdKecamatan);
                    $this->MKecamatan->kecamatan = $kecamatan;
                    dump($kecamatan);
                    if($this->MKecamatan->update($where) == true){
                        $success = false;
                        foreach ($nilai as $item => $value) {
                            $this->MNilai->kdKecamatan = $kdKecamatan;
                            $this->MNilai->kdKriteria = $item;
                            $this->MNilai->nilai = $value;
                            if ($this->MNilai->update()) {
                                $success = true;
                            }
                        }
                        if ($success == true) {
                            $this->session->set_flashdata('message', 'Berhasil mengubah data :)');
                            redirect('kecamatan');
                        } else {
                            echo 'gagal';
                        }
                    }
                }
            }
            $data['dataView'] = $this->getDataInsert();
            $data['nilaiKecamatan'] = $this->MNilai->getNilaiByUniveristas($id);
            loadPage('kecamatan/tambah', $data);
        }

    }

    private function getDataInsert()
    {
        $dataView = array();
        $kriteria = $this->MKriteria->getAll();
        foreach ($kriteria as $item) {
            $this->MSubKriteria->kdKriteria = $item->kdKriteria;
            $dataView[$item->kdKriteria] = array(
                'nama' => $item->kriteria,
                'data' => $this->MSubKriteria->getById()
            );
        }

        return $dataView;
    }

    public function delete($id)
    {
        if($this->MNilai->delete($id) == true){
            if($this->MKecamatan->delete($id) == true){
                $this->session->set_flashdata('message','Berhasil menghapus data :)');
                echo json_encode(array("status" => 'true'));
            }
        }
    }
}