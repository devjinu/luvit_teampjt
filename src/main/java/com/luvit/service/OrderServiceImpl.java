package com.luvit.service;

import com.luvit.domain.OrderVO;
import com.luvit.persistence.OrderDAO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class OrderServiceImpl implements OrderService {
    @Inject
    private OrderDAO orderDAO;


    // 리턴타입 1=>결제 성공적 저장,0=>실패
    @Override
    public int placeorder(OrderVO vo) throws Exception {
        int result = orderDAO.placeorder(vo);
        return result;
    }
}
