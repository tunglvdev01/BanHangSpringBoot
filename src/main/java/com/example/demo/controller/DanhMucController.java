package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.MauSac;
import com.example.demo.repository.DanhMucRepository;
import com.example.demo.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/danh-muc")
public class DanhMucController {
    @Autowired
    private DanhMucRepository danhMucRepository;

    @ModelAttribute("listDanhMuc")
    List<DanhMuc> getAll(){
        return this.danhMucRepository.findAll();
    }

    @GetMapping("/hien-thi")
    public String hienThi(){
        return "danh-muc";
    }
    @GetMapping("/delete/{id}")
    public  String xoa(@PathVariable Integer id){
        this.danhMucRepository.deleteById(id);
        return "redirect:/danh-muc/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String viewUpdate(@PathVariable Integer id,
                             Model model ) {
        model.addAttribute("danhMuc", this.danhMucRepository.findById(id).get());
        return "danh-muc-update";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                         @ModelAttribute("danhMuc") DanhMuc danhMuc, Model m){
        danhMuc.setNgaySua(LocalDateTime.now());
        danhMuc.setNgayTao(this.danhMucRepository.findById(id).get().getNgayTao());
        m.addAttribute("danhMuc", this.danhMucRepository.findById(id).get());
        this.danhMucRepository.save(danhMuc);
        return "redirect:/danh-muc/hien-thi";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("danhMuc") DanhMuc danhMuc,Model m){
        danhMuc.setNgayTao(LocalDateTime.now());
        this.danhMucRepository.save(danhMuc);
        return "redirect:/danh-muc/hien-thi";
    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){
        model.addAttribute("danhMuc", this.danhMucRepository.findById(id).get());
        return "danh-muc";
    }
}
