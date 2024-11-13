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
@Table(name = "khach_hang")
public class KhachHang {

//    CREATE TABLE khach_hang (
//            id INT IDENTITY(1,1) PRIMARY KEY,
//    ho_ten NVARCHAR(255),
//    dia_chi NVARCHAR(255),
//    sdt VARCHAR(20),
//    trang_thai VARCHAR(50), -- Adjust based on how you plan to represent the status
//    ngay_tao DATETIME,
//    ngay_sua DATETIME
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name="ho_ten")
    private String hoTen;
    @Column(name = "dia_chi")
    private String diaChi;
    @Column(name="sdt")
    private String sdt;
    @Column(name="trang_thai")
    private String trangThai;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
}
