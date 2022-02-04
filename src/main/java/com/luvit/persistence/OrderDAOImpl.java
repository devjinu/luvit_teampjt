package com.luvit.persistence;


import com.luvit.domain.OrderVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class OrderDAOImpl implements OrderDAO {
    private static final String namespace
            = "com.luvit.mapper.OrderMapper";
    @Inject
    private SqlSession sqlSession;

    @Override
    public int placeorder(OrderVO ovo) throws Exception {
        int orderNumber = sqlSession.insert(namespace + ".placeorder", ovo);
        return orderNumber;
    }

}