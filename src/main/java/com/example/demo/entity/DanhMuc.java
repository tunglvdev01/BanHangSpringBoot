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
@Table(name = "danh_muc")
public class DanhMuc {
//    CREATE TABLE danh_muc (
//            id INT IDENTITY(1,1) PRIMARY KEY,
//    ma_danh_muc VARCHAR(255),
//    ten_danh_muc VARCHAR(255),
//    trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
//    ngay_tao DATETIME,
//    ngay_sua DATETIME
//        );

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="ma_danh_muc")
    private String maDanhMuc;
    @Column(name="ten_danh_muc")
    private String tenDanhMuc;
    @Column(name="trang_thai")
    private String trangThai;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
}
