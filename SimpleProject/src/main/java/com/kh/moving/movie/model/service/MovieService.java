package com.kh.moving.movie.model.service;

import java.util.List;

import com.kh.moving.movie.model.dto.MovieDTO;

public interface MovieService {
	
	List<MovieDTO> getListMovie(); // 영화 목록들 조회
	
	MovieDTO findByMovieId(String movieId); // 영화 번호에 맞는 상세정보 조회
	
	
}
