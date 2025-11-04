package com.kh.moving.movie.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.moving.movie.model.dao.MovieMapper;
import com.kh.moving.movie.model.dto.MovieDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieServiceImpl implements MovieService {
	
	private final MovieMapper movieMapper;
	
	@Override
	public List<MovieDTO> getListMovie() {
		return movieMapper.getListMovie();
	}
	
	public MovieDTO findByMovieId(String movieId) {
		return movieMapper.findByMovieId(movieId);
	}
}
