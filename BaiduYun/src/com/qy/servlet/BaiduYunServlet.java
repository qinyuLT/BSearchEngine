package com.qy.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/BaiduYunServlet")
public class BaiduYunServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String q = URLEncoder.encode(request.getParameter("q"),"utf-8");
		String start=request.getParameter("start");
		String jsoncallback=request.getParameter("jsoncallback");
		
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
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(jsoncallback+"("+r.toString()+")");
		out.flush();
		out.close();
	}

}









