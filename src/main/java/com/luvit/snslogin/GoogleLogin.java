package com.luvit.snslogin;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.luvit.domain.UserVO;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;

public abstract class GoogleLogin {

    public static UserVO getGoogleUserInfo(String access_Token)  {
        UserVO vo = new UserVO();
        //요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> googleUserInfo = new HashMap<>();
        String reqURL = "https://www.googleapis.com/userinfo/v2/me?access_token=" + access_Token;
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection(); //요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            System.out.println(access_Token);
            int responseCode = conn.getResponseCode();

            if (responseCode == 200) {
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
                String line = "";
                String result = "";
                while ((line = br.readLine()) != null) {
                    result += URLDecoder.decode(line, "UTF-8");
                }

                JsonParser parser = new JsonParser();
                System.out.println("result : " + result);
                JsonElement element = parser.parse(result);
                String name = element.getAsJsonObject().get("name").getAsString();
                String id = "G" + element.getAsJsonObject().get("id").getAsString();

                System.out.println("아이디 : "+id);
                System.out.println("이름 : "+name);

                vo.setId(id);
                vo.setNickname(name);

            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return vo;
    }


}
