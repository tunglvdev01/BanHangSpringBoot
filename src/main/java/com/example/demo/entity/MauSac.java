package com.example.demo.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "mau_sac")
public class MauSac {
//    id INT IDENTITY(1,1) PRIMARY KEY,
//    ma_mau VARCHAR(255),
//    ten_mau VARCHAR(255),
//    trang_thai VARCHAR(50), -- or INT, based on your status representation
//    ngay_sua DATETIME,
//    ngay_tao DATETIME
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "ma_mau")
    private String maMau;
    @Column(name = "ten_mau")
    private String tenMau;
    @Column(name="trang_thai")
    private String trangThai;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
}
