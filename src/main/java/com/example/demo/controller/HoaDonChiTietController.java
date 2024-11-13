package com.example.demo.controller;

import com.example.demo.entity.Ctsp;
import com.example.demo.entity.Hdct;
import com.example.demo.entity.HoaDon;
import com.example.demo.repository.ChiTietSanPhamRepository;
import com.example.demo.repository.HoaDonChiTietRepository;
import com.example.demo.repository.HoaDonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/doa-don-chi-tiet")
public class HoaDonChiTietController {
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;

    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;

    @ModelAttribute("listHdct")
    List<Hdct> listHdct(){
        return this.hoaDonChiTietRepository.findAll();
    }

    @ModelAttribute("listHoaDon")
    List<HoaDon> list(){
        return this.hoaDonRepository.findAll();
    }

    @ModelAttribute("listCtsp")
    List<Ctsp> listCtsp(){
        return  this.chiTietSanPhamRepository.findAll();
    }
    @GetMapping("/hien-thi")
    public String hienThi(){

        return "hoa-don-chi-tiet";
    }

    @ModelAttribute("hdct")
    public Hdct hDCT(){

        return new Hdct();
    }


    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model m ){
        m.addAttribute("hdct", this.hoaDonChiTietRepository.findById(id).get());
        return "hoa-don-chi-tiet";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute Hdct hdct, Model m){
        hdct.setTongTien(hdct.getGiaBan() * hdct.getSoLuongMua());
        hdct.setNgayTao(LocalDateTime.now());
        this.hoaDonChiTietRepository.save(hdct);
        return "redirect:/doa-don-chi-tiet/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        this.hoaDonChiTietRepository.deleteById(id);
        return "redirect:/doa-don-chi-tiet/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String view(@PathVariable Integer id, Model model){
        model.addAttribute("hdct", hoaDonChiTietRepository.findById(id).get());
        return "hoa-don-chi-tiet-update";
    }
}
