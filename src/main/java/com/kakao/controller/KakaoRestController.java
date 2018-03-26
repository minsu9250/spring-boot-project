package com.kakao.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping(value = "/list", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public KakaoEntity entity(@RequestBody KakaoEntity kakaoEntity) {
		
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
        
        kakaoEntity.setCoupon(coupon);
        kakaoEntity.setRegDate(new Date());
		KakaoEntity kakaoData = dao.save(kakaoEntity);

		return kakaoData;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public List<KakaoEntity> list(KakaoEntity kakaoEntity) {

		List<KakaoEntity> kakaoList = dao.findAll();
		
		return kakaoList;
	}
}
