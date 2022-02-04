package com.luvit.controller;

import com.luvit.domain.CartVO;
import com.luvit.domain.OrderVO;
import com.luvit.domain.UserVO;
import com.luvit.service.CartService;
import com.luvit.service.OrderService;
import com.luvit.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
@RequestMapping(value = "/order/*")
public class OrderController {


    // 카트 서비스, 유저 서비스, 페이먼트 서비스 준비
    // cartvo+uservo=ordervo unification => vo obj hand over to payment.jsp, box off =>controller (method diverge receipt, kakao)
    //***** // defo be aware of vo handling

    @Inject
    private CartService cartService;
    @Inject
    private UserService userService;

    @Inject
    private OrderService orderService;
    // TODO
    // 여기에 order에 필요한 service 또는 dao 객체 필요


    private static final Logger logger =
            LoggerFactory.getLogger(OrderController.class);


    //TODO 여기서부터 uservo + cartvo 까서 통합 작업 => ordervo
    // to payment.jsp, ordervo chuck it show off
    //**** // required ordervo upcoming modification, due to cartvo has changed


    @RequestMapping(value = "/placeorder", method = RequestMethod.POST)
    public String placeOrder(OrderVO ordervo, HttpSession session, Model model) throws Exception {

        int result = orderService.placeorder(ordervo);
//        model.addAttribute()
        return "";
    }

    @RequestMapping(value = "/orderFail")
    public String orderFail() throws Exception {
        return "/order/orderFail";
    }

    @RequestMapping(value = "/orderSuccess")
    public String orderSuccess() throws Exception {
        return "/order/orderSuccess";
    }


}
