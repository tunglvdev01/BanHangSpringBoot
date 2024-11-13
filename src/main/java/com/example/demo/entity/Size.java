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
@Table(name = "size")
public class Size {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name="ma_size")
    private String maSize;
    @Column(name="ten_size")
    private String tenSize;
    @Column(name="trang_thai")
    private String trangThai;



    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_tao")
    private LocalDateTime ngayTao;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name="ngay_sua")
    private LocalDateTime  ngaySua;
}
