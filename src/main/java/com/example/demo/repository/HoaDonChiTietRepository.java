package com.example.demo.repository;

import com.example.demo.entity.Hdct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<Hdct, Integer> {
}
