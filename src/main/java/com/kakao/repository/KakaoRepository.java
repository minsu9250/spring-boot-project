package com.kakao.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.kakao.entity.KakaoEntity;

public interface KakaoRepository extends JpaRepository <KakaoEntity, Integer>{
	KakaoEntity findByEmail(@Param("email") String email);
	KakaoEntity findByCoupon(@Param("coupon") String coupon);
	
	Page<KakaoEntity> findAll(Pageable pageable);
}

