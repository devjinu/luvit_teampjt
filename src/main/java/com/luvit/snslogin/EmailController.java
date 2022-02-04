package com.luvit.snslogin;

import com.luvit.domain.UserVO;
import com.luvit.persistence.UserDAO;
import com.luvit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/user/*")
public class EmailController {
    int random;
    String email;
    @Inject
    private UserService service;

    @Autowired
    private JavaMailSender mailSender;

    @Inject
    private UserDAO udao;

    @Inject
    BCryptPasswordEncoder pwEncoder;


    @RequestMapping(value = "/findmypw", method = RequestMethod.GET)
    public String findmypw() {

        return "/user/findmypw";
    }

    @RequestMapping(value = "/findmyid", method = RequestMethod.GET)
    public String findmyid() {

        return "/user/findmyid";
    }

    @RequestMapping(value = "/searchPw", method = RequestMethod.POST)
    public ModelAndView findMyPw(HttpServletRequest request, ModelMap model) throws Exception {

        ModelAndView mav = new ModelAndView();
        String id = request.getParameter("id");
        String EMAIL = request.getParameter("email"); /* */

        int random = (int) (Math.random() * 1000 + 1);

        System.out.println("id  : " + id);
        System.out.println("EMAIL  : " + EMAIL);


        try {
            /* if (EMAIL.equals(idvo.getEmail())) {*/

            UserVO idvo = service.readMember(id);
            UserVO emailvo = service.findmyid(EMAIL);
            System.out.println("emailvo.getId() : " + emailvo);
            System.out.println("idvo.getEmail() : " + idvo.getEmail());
            System.out.println("EMAIL : " + EMAIL);
            System.out.println(idvo.getId().equals(id));
            System.out.println(idvo.getEmail().equals(EMAIL));
            if (idvo.getId().equals(id)) {
                if (idvo.getEmail().equals(EMAIL)) {
                    idvo.setPw(pwEncoder.encode(String.valueOf(random)));
                    System.out.println("@@@@@@@@@@@@" + random);
                    service.tempPw(idvo);
                    System.out.println("비밀번호 setPw 결과===>" + idvo.getPw());

                    MimeMessage msg = mailSender.createMimeMessage();
                    MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

                    messageHelper.setSubject(id + "님의 임시 비밀번호입니다.");
                    messageHelper.setText("비밀번호는 " + random + " 입니다.");
                    messageHelper.setTo(EMAIL);
                    msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(EMAIL));
                    mailSender.send(msg);

                } else {
                    mav.setViewName("/user/emailFail");
                    return mav;
                }
            } else {
                mav.setViewName("/user/emailFail");
                return mav;
            }
            mav.setViewName("/user/emailSuccess");
            return mav;

        } catch (
                Exception e) {
            e.printStackTrace();
            System.out.println("이메일 발송 실패   @@@@@@@@@@@");
            mav.setViewName("/user/emailFail");
            return mav;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/searchId", method = RequestMethod.POST)
    public HashMap<String, String> findMyId(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {

        HashMap<String, String> map = new HashMap<String, String>();

        random = (int) (Math.random() * 1000 + 1);
        UserVO vo = service.findmyid(email);
        String EMAIL = vo.getEmail();
        if (vo == null) {
            map.put("code", "0");
            return map;
        }

        try {
            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
            messageHelper.setSubject("해당하는 이메일의 아이디 찾기 결과입니다.");
            messageHelper.setText("아이디는 : " + service.findmyid(email).getId() + " 이며, 비밀번호 수정을 권장합니다.");
//            messageHelper.setText("인증번호는 : " + random + " 입니다");
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(EMAIL));
            mailSender.send(msg);

            if (vo != null) {
                map.put("code", "1");
                map.put("result", "발송 성공");
            } else {
                map.put("code", "0");
            }


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("이메일 발송 실패   @@@@@@@@@@@");
            map.put("result", "발송 실패");
        }
        return map;
    }


    @ResponseBody
    @RequestMapping(value = "/emailVeri", method = RequestMethod.POST)
    public ModelAndView emailVerification(@RequestParam("email") final String email, ModelMap model, final Model md, final HttpServletResponse response) throws Exception {

        System.out.println("email : " + email);


        ModelAndView mv = new ModelAndView();

        random = (int) (Math.random() * 1000 + 1);

        try {

            // mail sending
            String EMAIL = email;

            MimeMessage msg = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

            messageHelper.setText("인증번호는 " + random + " 입니다.");
            messageHelper.setTo(EMAIL);
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(EMAIL));
            mailSender.send(msg);

            // user duplicate check
            // email,id,nickname = X
//            UserVO vo = service.readMember(id);
            mv.addObject("random", random);


        } catch (Exception e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }

        mv.setViewName("jsonView");


        return mv;
    }


    @RequestMapping(value = "/hashCheck", method = RequestMethod.GET)
    public @ResponseBody
    HashMap<String, Integer> hashCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        int genCode = random;

        int userHash = Integer.parseInt(request.getParameter("hashCheck"));
        System.out.println(userHash);
        System.out.println(genCode);
        if (userHash == genCode) {
            map.put("code", 1);
        } else {
            map.put("code", 0);
        }
        return map;

    }

    @RequestMapping(value = "/checkHash", method = RequestMethod.GET)
    public int checkHashGET(@RequestParam("hashVal") int hashVal, @RequestParam("email_hash") int email_hash, HttpServletResponse response) throws Exception {
        int result = 0;
        System.out.println("hashVal>>>>" + hashVal);
        System.out.println("email_hash >>>>" + email_hash);
        if ((hashVal - email_hash) == 0) {
            result = 1;
        } else {
            result = 0;
        }
        System.out.println("result >>>>>" + result);

        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();


        return result;
    }


    @ResponseBody
    public Map<String, Object> hashJson(String email, int hash) {
        Map<String, Object> returned = new HashMap<String, Object>();
        returned.put("email", email);
        returned.put("hash", hash);
        return returned;
    }

    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
    public String emailSend(@RequestParam("email_check") String email, HttpServletResponse response) throws Exception {
        System.out.println("받아온 email >>>>>" + email);
        int random = (int) (Math.random() * 1000000 + 1);
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");

        messageHelper.setText("인증번호는 " + random + " 입니다.");
        messageHelper.setTo(email);
        msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
        mailSender.send(msg);

        String result = String.valueOf(random);

        PrintWriter out = response.getWriter();
        out.println(result);
        out.flush();
        out.close();

        return result;
    }

    // ErrorReponse.java
    public class ErrorResponse {
        private final String message;

        public ErrorResponse(String message) {
            this.message = message;
        }

        public String getMessage() {
            return message;
        }
    }


}
