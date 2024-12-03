package com.example.demo.controller;

import com.example.demo.entity.DanhMuc;
import com.example.demo.entity.MauSac;
import com.example.demo.entity.SanPham;
import com.example.demo.repository.DanhMucRepository;
import com.example.demo.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/san-pham")
public class SanPhamController {
    @Autowired
    private SanPhamRepository sanPhamRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;

    @ModelAttribute("listSanPham")
    List<SanPham> listSP(){

        return this.sanPhamRepository.findAll();
    }

    @ModelAttribute("listDanhMuc")
    List<DanhMuc> listDM(){
        return this.danhMucRepository.findAll();
    }
    @ModelAttribute("sanPham")
    SanPham sanPham(){

        return new SanPham();
    }
    @ModelAttribute("listDanhMuc")
    List<DanhMuc> listDanhMuc(){

        return this.danhMucRepository.findAll();
    }
    @GetMapping("/view-tong")
    public String viewTong(){
        return "view-tong";
    }
    @GetMapping("/hien-thi")
    public String hienThi(){
        return "san-pham";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("sanPham") SanPham sanPham,
               Model model){
            sanPham.setNgayTao(LocalDateTime.now());

            this.sanPhamRepository.save(sanPham);
        return "redirect:/san-pham/hien-thi";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                         @ModelAttribute("sanPham") SanPham sanPham, Model m){
        sanPham.setNgaySua(LocalDateTime.now());
        sanPham.setNgayTao(this.sanPhamRepository.findById(id).get().getNgayTao());
        m.addAttribute("sanPham", this.sanPhamRepository.findById(id));
        this.sanPhamRepository.save(sanPham);
        return "redirect:/san-pham/hien-thi";
    }

    @GetMapping("/view-update/{id}")
    public String view(@PathVariable Integer id, Model model){
        model.addAttribute("sanPham", sanPhamRepository.findById(id).get());
        return "san-pham-update";
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){
        model.addAttribute("sanPham", this.sanPhamRepository.findById(id).get());
        return "san-pham";
    }

    @GetMapping("/delete/{id}")
    public  String xoa(@PathVariable Integer id){
        this.sanPhamRepository.deleteById(id);
        return "redirect:/san-pham/hien-thi";
    }


}
