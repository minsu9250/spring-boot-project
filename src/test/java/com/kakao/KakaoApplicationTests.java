package com.kakao;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertEquals;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.test.context.junit4.SpringRunner;

import com.kakao.entity.KakaoEntity;
import com.kakao.repository.KakaoRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
public class KakaoApplicationTests {
	
	private static final String email = "minsu9250@nate.com";
	private static final String coupon = "abcd1234abcd1234";
	private static final int size = 3;
	
	@Autowired KakaoRepository kakaoRepository;
	
	@Test
	public void contextLoads() {
		KakaoEntity kakaoEntity = new KakaoEntity();
		// �̸��� �ߺ� Ȯ��
		kakaoEntity.setEmail(email);
		assertThat(kakaoRepository.findByEmail(kakaoEntity.getEmail())).isNull();
		
		// ���� ��ȣ �ߺ� Ȯ��
		kakaoEntity.setCoupon(coupon);
		assertThat(kakaoRepository.findByCoupon(kakaoEntity.getCoupon())).isNull();
		
		// ���� ����
		kakaoEntity.setRegDate(new Date());
		assertThat(kakaoRepository.save(kakaoEntity));
		
		kakaoRepository.deleteAll();
		// ����¡ �׽�Ʈ�� ���� �ӽ� ����
		for (int i = 0; i < 20; i++) {
			kakaoEntity.setId(i);
			kakaoEntity.setEmail(email+i);
			kakaoEntity.setCoupon(coupon+i);
			kakaoEntity.setRegDate(new Date());
			kakaoRepository.save(kakaoEntity);
		}
		// ���� ���
		Sort sort = new Sort(Direction.ASC, "id");
		Pageable pageable = new PageRequest(0, size, sort);
		Page<KakaoEntity> entity =  kakaoRepository.findAll(pageable);
		
		List<KakaoEntity> list = entity.getContent();
		for (int i = 0; i < size; i++) {
			assertEquals(list.get(i).getEmail(), email + (i+2));
		}
		assertEquals(list.size(), size);
	}
}
