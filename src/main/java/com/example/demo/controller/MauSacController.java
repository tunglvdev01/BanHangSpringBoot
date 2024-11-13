package com.example.demo.controller;

import com.example.demo.entity.MauSac;
import com.example.demo.entity.Size;
import com.example.demo.repository.MauSacRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/mau-sac")
public class MauSacController {
    @Autowired
    private MauSacRepository mauSacRepository;

    @ModelAttribute("listMau")
    List<MauSac> getAll(){
        return this.mauSacRepository.findAll();
    }
    @ModelAttribute("mauSac")
    MauSac getOne(){
        return new MauSac();
    }
    @GetMapping("/hien-thi")
    public String hienThi(){
        return "mau-sac";
    }
    @GetMapping("/delete/{id}")
    public  String xoa(@PathVariable Integer id){
        this.mauSacRepository.deleteById(id);
        return "redirect:/mau-sac/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String viewUpdate(@PathVariable Integer id,
                             Model model ) {
        model.addAttribute("mauSac", this.mauSacRepository.findById(id).get());
        return "mau-sac-update";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                      @ModelAttribute("mauSac") MauSac mauSac, Model m){
        mauSac.setNgaySua(LocalDateTime.now());
        mauSac.setNgayTao(this.mauSacRepository.findById(id).get().getNgayTao());
        m.addAttribute("mauSac", this.mauSacRepository.findById(id));
        this.mauSacRepository.save(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("mauSac") MauSac mauSac,Model m){
        mauSac.setNgayTao(LocalDateTime.now());
        this.mauSacRepository.save(mauSac);
        return "redirect:/mau-sac/hien-thi";
    }
    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){

        model.addAttribute("mauSac", this.mauSacRepository.findById(id).get());
        return "mau-sac";
    }
}
