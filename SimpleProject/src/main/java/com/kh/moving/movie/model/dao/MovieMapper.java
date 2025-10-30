package com.kh.moving.movie.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.moving.movie.model.dto.MovieDTO;

@Mapper
public interface MovieMapper {

    @Select("""
    			SELECT
    			  	   MOVIE_ID movieId
    			  	 , MOVIE_TITLE movieTitle
    			  	 , RELEASE_DATE releaseDate
    			  	 , PLAY_TIME playTime
    			  	 , DIRECTOR director
    			  	 , RATING rating
    			  	 , STORY story
    			  	 , ORIGIN_NAME originName
    			  	 , ACTOR actor
    			  	 , MOVIE_STATUS movieStatus
    			  FROM 
    			  	   TB_MOVIE_DETAIL
    		""")
    List<MovieDTO> getListMovie();
    
}
