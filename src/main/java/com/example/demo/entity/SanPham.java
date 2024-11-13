package com.example.demo.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
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
@Table(name = "san_pham")
public class SanPham {
//    id INT IDENTITY(1,1) PRIMARY KEY,
//    ma_san_pham VARCHAR(255) ,
//    ten_san_pham VARCHAR(255) ,
//    trang_thai VARCHAR(50), -- or INT, depending on how you represent status
//    ngay_tao DATETIME ,
//    ngay_sua DATETIME
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
   // @NotNull
    private Integer id;

   // @NotBlank
    @Column(name="ma_san_pham")
    private String maSanPham;
    @NotBlank
    @Column(name = "ten_san_pham")
    private String tenSanPham;
//    @Column(name = "id_danh_muc")
//    private Integer idDanhMuc;
   // @NotBlank
    @Column(name="trang_thai")
    private String trangThai;
//
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;

    // Khoa Ngoai
   // @NotNull
    @ManyToOne
    @JoinColumn(name = "id_danh_muc", referencedColumnName = "id")
    private DanhMuc danhMuc;

}
