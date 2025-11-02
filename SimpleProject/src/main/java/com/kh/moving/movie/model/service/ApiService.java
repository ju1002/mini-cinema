package com.kh.moving.movie.model.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ApiService {
	
	private final String API_KEY = "b846beab67c6bc264966391ed7157095";
	
	
	public String requestApi() {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("https://api.themoviedb.org/3/movie/now_playing?api_key=");
		sb.append(API_KEY);
		sb.append("&language=ko-KR&region=KR");
		
		try {
			URI uri = new URI(sb.toString());
			RestTemplate restTemplate = new RestTemplate();
			String response = restTemplate.getForObject(uri, String.class);
			return response;
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	
}
