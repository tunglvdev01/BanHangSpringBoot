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
@Table(name = "ctsp")
public class Ctsp {
    // CREATE TABLE ctsp (
    //        id INT IDENTITY(1,1) PRIMARY KEY,
    //        id_sp INT NULL,
    //        id_mau_sac INT NULL,
    //        id_size INT NULL,
    //        gia_ban DECIMAL(18, 2),
    //        so_luong_ton INT,
    //        trang_thai VARCHAR(50), -- Adjust based on your representation of status
    //        ngay_tao DATETIME,
    //        ngay_sua DATETIME,
    //        CONSTRAINT fk_sp FOREIGN KEY (id_sp) REFERENCES san_pham(id) ON UPDATE CASCADE ON DELETE CASCADE,
    //        CONSTRAINT fk_mau_sac FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id) ON UPDATE CASCADE ON DELETE CASCADE,
    //        CONSTRAINT fk_size FOREIGN KEY (id_size) REFERENCES size(id) ON UPDATE CASCADE ON DELETE CASCADE,
    //        );
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
//    @Column(name = "id_sp")
//    private Integer idSp;
//    @Column(name = "mau_sac")
//    private Integer idMauSac;
//    @Column(name = "id_size")
//    private Integer idSize;
    @Column(name="gia_ban")
    private Long giaBan;
    @Column(name = "so_luong_ton")
    private Integer soLuongTon;
    @Column(name="trang_thai")
    private String trangThai;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;

    // Khoa Ngoai
    @ManyToOne
    @JoinColumn(name = "id_sp", referencedColumnName = "id")
    private SanPham sanPham;

    // Khoa Ngoai
    @ManyToOne
    @JoinColumn(name = "id_mau_sac", referencedColumnName = "id")
    private MauSac mauSac;

    // Khoa Ngoai
    @ManyToOne
    @JoinColumn(name = "id_size", referencedColumnName = "id")
    private Size size;


}
