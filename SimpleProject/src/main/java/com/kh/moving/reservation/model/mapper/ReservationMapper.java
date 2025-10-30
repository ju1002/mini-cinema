package com.kh.moving.reservation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.moving.reservation.model.dto.MovieListDTO;

@Mapper
public interface ReservationMapper {

	
	@Select("SELECT MOVIE_ID movieId , MOVIE_TITLE movieTitle FROM TB_MOVIE_DETAIL")
	List<MovieListDTO> findMovieList();
	
}
