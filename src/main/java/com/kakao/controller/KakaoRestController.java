package com.kakao.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kakao.entity.KakaoEntity;
import com.kakao.repository.KakaoRepository;

@RestController
@RequestMapping("/kakao")
public class KakaoRestController {
	@Autowired
	private KakaoRepository dao;
	
	// 쿠폰 생성
	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public KakaoEntity entity (@RequestBody KakaoEntity kakaoEntity) {
		
		if (kakaoEntity.getEmail() == null || kakaoEntity.getEmail().isEmpty()) {
            throw new IllegalArgumentException("이메일을 입력해주시기 바랍니다.");
        }

		KakaoEntity emailChk = dao.findByEmail(kakaoEntity.getEmail());
		
		if(emailChk != null) {
			throw new IllegalArgumentException("중복된 이메일입니다.");
		}
		
		// coupon create
        String coupon="";
        
        Random rnd = new Random();
        for(int i=0;  i<16; i++){
            int index = rnd.nextInt(3);
            switch(index){
            case 0 : 
                // a-z
                coupon += (char)((int)(rnd.nextInt(26)) + 97);
                break;
            case 1 :
                // A-Z
                coupon += (char)((int)(rnd.nextInt(26)) + 65);
                break;
            case 2 : 
                // 0-9
                coupon += (int)(rnd.nextInt(10));
                break;
            }
        }
        
        KakaoEntity couponChk = dao.findByCoupon(coupon);
        
        if(couponChk != null) {
        	throw new IllegalArgumentException("중복된 쿠폰번호입니다.");
		}
        
        kakaoEntity.setCoupon(coupon);
        kakaoEntity.setRegDate(new Date());
		KakaoEntity kakaoData = dao.save(kakaoEntity);

		return kakaoData;
	}
	
	// 쿠폰 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public Page<KakaoEntity> list(KakaoEntity kakaoEntity, 
			@PageableDefault(sort = { "id" }, direction = Direction.ASC, size = 3) Pageable pageable) {
		
		Page<KakaoEntity> kakaoData = dao.findAll(pageable);
		
		return kakaoData;
	}
	
	// 예외 처리
	@ExceptionHandler(IllegalArgumentException.class)
	void handleBadRequests(HttpServletResponse response) throws IOException {
	    response.sendError(HttpStatus.BAD_REQUEST.value());
	}
}
