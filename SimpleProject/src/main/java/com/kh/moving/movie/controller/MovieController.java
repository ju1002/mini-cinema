package com.kh.moving.movie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.moving.movie.model.service.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {
	
	@Autowired
	private final MovieService movieService;
	
	public MovieController (MovieService movieService) {
		this.movieService = movieService;
	} // 매개 변수 생성자 @RequiredArgsConstructor 생략안함
	
	@GetMapping
	public String movie(Model model) {
		
		
		return "movie/movie_page";
	}
	
	
}
