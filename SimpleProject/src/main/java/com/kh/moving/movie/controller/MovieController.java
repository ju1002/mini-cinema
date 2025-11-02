package com.kh.moving.movie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.moving.movie.model.dto.MovieDTO;
import com.kh.moving.movie.model.service.ApiService;
import com.kh.moving.movie.model.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/movie")
public class MovieController {
	
	private final MovieService movieService;
	private final ApiService apiService;
	
//	@Autowired
//	public MovieController (MovieService movieService) {
//		this.movieService = movieService;
//	} // 매개 변수 생성자 @RequiredArgsConstructor 생략안함
	
	
	//상영중인 영화페이지로 포워딩
	@GetMapping 
	public String moviePage() {
	    return "movie/movie_page";
	}
	
	//상영중인 영화페이지 목록 뿌려주기
	@ResponseBody
	@GetMapping("/list")
	public List<MovieDTO> getListMovie() {
		
	    List<MovieDTO> movie = movieService.getListMovie();
	    
	    //log.info("조회된 영화 개수 : {} , 영화들 : {}", movie.size(), movie);
		
	    String apimovie = apiService.requestApi();
		
		log.info("잘오냐? : {}", apimovie);
		
	    return movie;
	}
	
	// 상영중인 영화 디테일화면으로 값뿌려기
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") String movieId, Model model) {
		log.info("이게 뭘까용? : {}" ,movieId);
		
	    MovieDTO movie = movieService.findByMovieId(movieId);
	    
	    log.info("이게뭘까 : {} ",movie);
	    
	    model.addAttribute("movie", movie); 
	    
	    return "movie/detail"; 
	}
	
	

	
}
