package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.repository.ChiTietSanPhamRepository;
import com.example.demo.repository.MauSacRepository;
import com.example.demo.repository.SanPhamRepository;
import com.example.demo.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/chi-tiet-san-pham")
public class ChiTietSanPhamController {
    @Autowired
    private ChiTietSanPhamRepository chiTietSanPhamRepository;
    @Autowired
    private SizeRepository sizeRepository;
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private MauSacRepository mauSacRepository;
    @GetMapping("/hien-thi")
    public String hienThi(){

        return "chi-tiet-san-pham";
    }
    @ModelAttribute("listCtsp")
    List<Ctsp> list(){
        return chiTietSanPhamRepository.findAll();
    }
    @ModelAttribute("ctsp")
    Ctsp ctsp(){
        return new Ctsp();
    }
    @ModelAttribute("listSize")
    List<Size> listSize(){
        return this.sizeRepository.findAll();
    }
    @ModelAttribute("listMauSac")
    List<MauSac> listMauSac(){
        return this.mauSacRepository.findAll();
    }
    @ModelAttribute("listSanPham")
    List<SanPham> listSanPham(){
        return this.sanPhamRepository.findAll();
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){
        model.addAttribute("ctsp", this.chiTietSanPhamRepository.findById(id).get());
        return "chi-tiet-san-pham";
    }
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
      this.chiTietSanPhamRepository.deleteById(id);
      return "redirect:/chi-tiet-san-pham/hien-thi";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("ctsp") Ctsp ctsp, Model m){
        ctsp.setNgayTao(LocalDateTime.now());
        this.chiTietSanPhamRepository.save(ctsp);
        return "redirect:/chi-tiet-san-pham/hien-thi";
    }
}
