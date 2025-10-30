package com.kh.moving.movie.model.service;

import java.util.List;

import com.kh.moving.movie.model.dto.MovieDTO;

public interface MovieService {
	
	List<MovieDTO> getListMovie(); // 영화 목록들 조회
}
