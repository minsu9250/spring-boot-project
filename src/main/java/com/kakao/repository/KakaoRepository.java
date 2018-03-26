package com.kakao.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.kakao.entity.KakaoEntity;

public interface KakaoRepository extends JpaRepository <KakaoEntity, Integer>{

}

