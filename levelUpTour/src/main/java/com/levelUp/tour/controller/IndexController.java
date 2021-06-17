package com.levelUp.tour.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class IndexController {
	@RequestMapping(value="/")
	public ModelAndView index() {
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("index");	
		return modelandview;
	}
	
	@GetMapping("/apitest")
    public String callApiWithXml() {
        StringBuffer result = new StringBuffer();
        try {
            String apiUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?" +
                    "serviceKey=OYrsd6Ct95E9OC%2FCrnxkyfj58IJs2BtxyMDqs4M3YfvFUKlu6Dv2UaqZr8TEWnhjcO6LXC92N2ZRYXfc%2BTdvEA%3D%3D" +
                    "&numOfRows=10" +
                    "&pageNo=1" + 
                    "&MobileOS=ETC" +
                    "&MobileApp=AppTest" +
                    "&contentTypeId=12"+
                    "&cat1=A01"+
                    "&cat2=A0101"+
                    "&cat3=A01010100"
                    ;
            URL url = new URL(apiUrl);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");

            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));

            String returnLine;
            result.append("<xmp>");
            while((returnLine = bufferedReader.readLine()) != null) {
                result.append(returnLine + "&#10;");
            }
            urlConnection.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result + "</xmp>";
    }
	
	@GetMapping("/jsonapi")
    public String callApiWithJson() {
        StringBuffer result = new StringBuffer();
        String jsonPrintString = null;
        try {
            String apiUrl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode?" +
                    "serviceKey=OYrsd6Ct95E9OC%2FCrnxkyfj58IJs2BtxyMDqs4M3YfvFUKlu6Dv2UaqZr8TEWnhjcO6LXC92N2ZRYXfc%2BTdvEA%3D%3D" +
                    "&numOfRows=10" +
                    "&pageNo=1" + 
                    "&MobileOS=ETC" +
                    "&MobileApp=AppTest" +
                    "&contentTypeId=12"+
                    "&cat1=A01"+
                    "&cat2=A0101"+
                    "&cat3=A01010100"
                    ;
            URL url = new URL(apiUrl);
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.connect();
            BufferedInputStream bufferedInputStream = new BufferedInputStream(urlConnection.getInputStream());
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream, "UTF-8"));
            String returnLine;
            while((returnLine = bufferedReader.readLine()) != null) {
                result.append(returnLine);
            }

            JSONObject jsonObject = XML.toJSONObject(result.toString());
            jsonPrintString = jsonObject.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonPrintString;
    }
	
}
