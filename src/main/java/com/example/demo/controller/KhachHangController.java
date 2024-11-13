package com.example.demo.controller;

import com.example.demo.entity.KhachHang;
import com.example.demo.entity.MauSac;
import com.example.demo.repository.KhachHangRepository;
import com.example.demo.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/khach-hang")
public class KhachHangController {
    @Autowired
    private KhachHangRepository khachHangRepository;

    @ModelAttribute("listKhachHang")
    List<KhachHang> getAll(){
        return this.khachHangRepository.findAll();
    }
//    @ModelAttribute("khachHang")
//    MauSac getOne(){
//        return new MauSac();
//    }
    @GetMapping("/hien-thi")
    public String hienThi(){
        return "khach-hang";
    }
    @GetMapping("/delete/{id}")
    public  String xoa(@PathVariable Integer id){
        this.khachHangRepository.deleteById(id);
        return "redirect:/khach-hang/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String viewUpdate(@PathVariable Integer id,
                             Model model ) {
        model.addAttribute("khachHang", this.khachHangRepository.findById(id).get());
        return "khach-hang-update";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                         @ModelAttribute("khachHang") KhachHang khachHang, Model m){
        khachHang.setNgaySua(LocalDateTime.now());
        khachHang.setNgayTao(this.khachHangRepository.findById(id).get().getNgayTao());
        m.addAttribute("khachHang", this.khachHangRepository.findById(id));
        this.khachHangRepository.save(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("khachHang") KhachHang khachHang,Model m){
        khachHang.setNgayTao(LocalDateTime.now());
        this.khachHangRepository.save(khachHang);
        return "redirect:/khach-hang/hien-thi";
    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){
        model.addAttribute("khachHang", this.khachHangRepository.findById(id).get());
        return "khach-hang";
    }
}
