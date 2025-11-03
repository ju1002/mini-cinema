package com.kh.moving.movie.model.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.kh.moving.movie.model.dto.ApiMovieDTO;
import com.kh.moving.movie.model.dto.MovieResponseDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ApiService {

	private final String API_KEY = "b846beab67c6bc264966391ed7157095";
	private final Gson gson = new Gson();

	// 현재 상영중인 영화 끌고오는 api 호출
	public String requestApiMovie() {

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

	public List<ApiMovieDTO> getNowPlayingMovies() {
		String jsonResponse = requestApiMovie();

		if (jsonResponse != null && !jsonResponse.isEmpty()) {
			MovieResponseDTO movieResponse = gson.fromJson(jsonResponse, MovieResponseDTO.class);

			return movieResponse.getResults();
		}

		return null;
	}
}
