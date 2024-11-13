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
@Table(name = "hdct")
public class Hdct {
    // CREATE TABLE hdct (
    //        id INT IDENTITY(1,1) PRIMARY KEY,
    //        id_hoa_don INT NULL,
    //        id_ctsp INT NULL,
    //        so_luong_mua INT,
    //        gia_ban DECIMAL(18, 2),
    //        tong_tien DECIMAL(18, 2),
    //        trang_thai VARCHAR(50), -- Adjust based on how you represent the status
    //        ngay_tao DATETIME,
    //        ngay_sua DATETIME,
    //        CONSTRAINT fk_hoa_don FOREIGN KEY (id_hoa_don) REFERENCES hoa_don(id) ON UPDATE CASCADE ON DELETE CASCADE,
    //        CONSTRAINT fk_ctsp FOREIGN KEY (id_ctsp) REFERENCES ctsp(id) ON UPDATE CASCADE ON DELETE CASCADE,
    //        );
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
//    @Column(name = "id_hoa_don")
//    private Integer idHoaDon;
//    @Column(name = "id_ctsp")
//    private Integer idCtsp;
    @Column(name = "so_luong_mua")
    private Integer soLuongMua;
    @Column(name = "gia_ban")
    private Long giaBan;
    @Column(name = "tong_tien")
    private Long tongTien;
    @Column(name="trang_thai")
    private String trangThai;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
    // khoa ngoai
    @ManyToOne
    @JoinColumn(name = "id_hoa_don", referencedColumnName = "id")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_ctsp", referencedColumnName = "id")
    private Ctsp ctsp;
}