package com.luvit.persistence;

import com.luvit.domain.OrderVO;

public interface OrderDAO {
    int placeorder(OrderVO ovo) throws Exception;
}
