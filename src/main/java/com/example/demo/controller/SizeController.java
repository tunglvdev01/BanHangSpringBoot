package com.example.demo.controller;

import com.example.demo.entity.SanPham;
import com.example.demo.entity.Size;
import com.example.demo.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/size")
public class SizeController {
    @Autowired
    private SizeRepository sizeRepository;

    @ModelAttribute("ListSize")
    List<Size> listSize(){
        return this.sizeRepository.findAll();
    }
//    @ModelAttribute("size")
//    Size size(){
//        return new Size();
//    }
    @GetMapping("/hien-thi")
    public String hienThi(){
        return "size";
    }

    @GetMapping("/details/{id}")
    public String details(@PathVariable Integer id, Model model){
        model.addAttribute("size", sizeRepository.findById(id).get());
        return "size";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id){
        this.sizeRepository.deleteById(id);
       return  "redirect:/size/hien-thi";
    }
    @PostMapping("/add")
    public String add(@ModelAttribute("size") Size size){
        //size.setNgaySua(LocalDateTime.now());
        size.setNgayTao(LocalDateTime.now());
        this.sizeRepository.save(size);
        return "redirect:/size/hien-thi";
    }
    @GetMapping("/view-update/{id}")
    public String view(@PathVariable Integer id, Model model){
        model.addAttribute("size", sizeRepository.findById(id).get());
        return "size-update";
    }
    @PostMapping("update/{id}")
    public String update(@PathVariable Integer id,
                      @ModelAttribute("size") Size size,Model m){
        size.setNgaySua(LocalDateTime.now());
        size.setNgayTao(this.sizeRepository.findById(id).get().getNgayTao());
        m.addAttribute("size", this.sizeRepository.findById(id));
        this.sizeRepository.save(size);
        return "redirect:/size/hien-thi";
    }

}
