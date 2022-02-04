package com.luvit.service;

import com.luvit.domain.OrderVO;

public interface OrderService {
    // 결제 공통 모듈 (디비저장)
    // 주문번호에 따른 저장은 미란씨가 또 따로 가져감

    int placeorder(OrderVO vo) throws Exception;
}
