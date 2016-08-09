package com.qy.test;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Test {

	public static void main(String[] args) throws Exception {
		String q = "java";
		String start="0";
		String urlStr = "https://www.googleapis.com/customsearch/v1element?key=AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY&rsz=filtered_cse&num=10&hl=zh_CN&prettyPrint=false&source=gcsc&gss=.com&sig=8bdfc79787aa2b2b1ac464140255872c&start="+start+"&cx=016789904072617331679:m99586mr47g&q="+q+"&sort=date&googlehost=www.google.com";
	
		URL url = new URL(urlStr);
		BufferedInputStream buf=new BufferedInputStream(url.openStream());
		InputStreamReader reader = new InputStreamReader(buf,"utf-8");
		BufferedReader bufr = new BufferedReader(reader);
		
		String line;
		StringBuffer sb=new StringBuffer();
		while((line=bufr.readLine()) != null){
			sb.append(line);
		}
		bufr.close();
		//System.out.println(sb.toString());
		//提取有用信息
		JSONObject jsonObject=JSONObject.fromObject(sb.toString());
		JSONArray results=jsonObject.getJSONArray("results");
		
		JSONArray r = new JSONArray();
		for(int i=0;i<results.size();i++){
			JSONObject j = (JSONObject) results.get(i);
			
			JSONObject o = new JSONObject();
			o.put("title", j.get("title"));
			o.put("content",j.get("content"));
			o.put("unescapedUrl",j.get("unescapedUrl"));
			
			r.add(o);
		}
		System.out.println(r);
	}
}



























