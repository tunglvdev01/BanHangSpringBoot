package com.example.demo.controller;

import com.example.demo.entity.HoaDon;
import com.example.demo.entity.KhachHang;
import com.example.demo.entity.SanPham;
import com.example.demo.repository.HoaDonRepository;
import com.example.demo.repository.KhachHangRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController {
    @Autowired
    private HoaDonRepository hoaDonRepository;

    @Autowired
    private KhachHangRepository khachHangRepository;

    @ModelAttribute("listHoaDon")
    List<HoaDon> listHoaDon(){
        return this.hoaDonRepository.findAll();
    }

    @ModelAttribute("hoaDon")
    HoaDon hoaDon(){
        return new HoaDon();
    }
    @ModelAttribute("listKhachHang")
    List<KhachHang> listKhachHang(){
        return this.khachHangRepository.findAll();
    }
//    @ModelAttribute("khachHang")
//    KhachHang khachHang(){
//        return new KhachHang();
//    }

    @GetMapping("/hien-thi")
    public String hienThi() {
        return "hoa-don";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("hoaDon") HoaDon hoaDon, Model model){
        hoaDon.setNgayTao(LocalDateTime.now());
        this.hoaDonRepository.save(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }
    @GetMapping("/delete/{id}")
    public  String delete(@PathVariable Integer id){
        this.hoaDonRepository.deleteById(id);
        return "redirect:/hoa-don/hien-thi";
    }
    @GetMapping("/details/{id}")
    public  String details(@PathVariable Integer id, Model model){
        model.addAttribute("hoaDon", this.hoaDonRepository.findById(id).get());
        return "hoa-don";
    }
    @GetMapping("/view-update/{id}")
    public String viewUpdate(@PathVariable Integer id, Model model){
        model.addAttribute("hoaDon", this.hoaDonRepository.findById(id).get());

       // model.addAttribute("khachHang", this.khachHangRepository.findAll());
        return "hoa-don-update";
    }
    @PostMapping("/update")
    String update(@ModelAttribute HoaDon hoaDon){
        this.hoaDonRepository.save(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }

    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                         @ModelAttribute("hoaDon") HoaDon hoaDon, Model m){
        hoaDon.setNgaySua(LocalDateTime.now());
        hoaDon.setNgayTao(this.hoaDonRepository.findById(id).get().getNgayTao());
        m.addAttribute("sanPham", this.hoaDonRepository.findById(id));
        this.hoaDonRepository.save(hoaDon);
        return "redirect:/hoa-don/hien-thi";
    }
}
