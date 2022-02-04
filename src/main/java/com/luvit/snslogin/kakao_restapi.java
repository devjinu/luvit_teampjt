package com.luvit.snslogin;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@ResponseBody
public class kakao_restapi {
    private final static String K_CLIENT_ID = "e3ed4af2450df791321f3a4e05f9de81";
    final static String K_REDIRECT_URI = "http://rustywhite404.cafe24.com/snslogin/kakao";



    public static String getAuthorizationUrl(HttpSession session) {
        String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri=" + K_REDIRECT_URI + "&response_type=code";
        return kakaoUrl;
    }


    public static JsonNode getAccessToken(String autorize_code) {

        final String RequestUrl = "https://kauth.kakao.com/oauth/token";

        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

        postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));

        postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI));

        postParams.add(new BasicNameValuePair("code", autorize_code));

        final HttpClient client = HttpClientBuilder.create().build();

        final HttpPost post = new HttpPost(RequestUrl);

        JsonNode returnNode = null;

        try {

            post.setEntity(new UrlEncodedFormEntity(postParams));

            final HttpResponse response = client.execute(post);

            ObjectMapper mapper = new ObjectMapper();

            returnNode = mapper.readTree(response.getEntity().getContent());

        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();

        } catch (ClientProtocolException e) {

            e.printStackTrace();

        } catch (IOException e) {

            e.printStackTrace();

        } finally {

        }

        return returnNode;

    }

    public static JsonNode getKakaoUserInfo(JsonNode accessToken) {

        final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);

        // add header
        post.addHeader("Authorization", "Bearer " + accessToken);

        JsonNode returnNode = null;

        try {
            final HttpResponse response = client.execute(post);
            final int responseCode = response.getStatusLine().getStatusCode();

            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());

        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // clear resources
        }

        return returnNode;
    }


    // 로그아웃
    public JsonNode Logout(String autorize_code) {
        final String RequestUrl = "https://kapi.kakao.com/v1/kakao/logout";

        final HttpClient client = HttpClientBuilder.create().build();

        final HttpPost post = new HttpPost(RequestUrl);

        post.addHeader("Authorization", "Bearer " + autorize_code);

        JsonNode returnNode = null;

        try {

            final HttpResponse response = client.execute(post);

            ObjectMapper mapper = new ObjectMapper();

            returnNode = mapper.readTree(response.getEntity().getContent());

        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();

        } catch (ClientProtocolException e) {

            e.printStackTrace();

        } catch (IOException e) {

            e.printStackTrace();

        } finally {

        }

        return returnNode;

    }


}
