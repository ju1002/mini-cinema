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
import com.kh.moving.movie.model.service.MovieService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/movie")
public class MovieController {
	
	private final MovieService movieService;
	
	@Autowired
	public MovieController (MovieService movieService) {
		this.movieService = movieService;
	} // 매개 변수 생성자 @RequiredArgsConstructor 생략안함
	
	@GetMapping 
	public String moviePage() {
	    return "movie/movie_page";
	}
	
	@ResponseBody
	@GetMapping("/list")
	public List<MovieDTO> getListMovie() {
		
	    List<MovieDTO> movie = movieService.getListMovie();
	    
	    //log.info("조회된 영화 개수 : {} , 영화들 : {}", movie.size(), movie);
	    
	    return movie;
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable("id") String movieId, Model model) {
		log.info("이게 뭘까용? : {}" ,movieId);
		
	    MovieDTO movie = movieService.findByMovieId(movieId);
	    
	    log.info("이게뭘까 : {} ",movie);
	    
	    model.addAttribute("movie", movie); 
	    
	    return "movie/detail"; 
	}

	
}
