package com.kh.moving.movie.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.moving.movie.model.dto.MovieDTO;

@Mapper
public interface MovieMapper {

    @Select("""
    			SELECT
    			  	   MD.MOVIE_ID movieId
    			  	 , MD.MOVIE_TITLE movieTitle
    			  	 , MD.RELEASE_DATE releaseDate
    			  	 , MD.PLAY_TIME playTime
    			  	 , MD.DIRECTOR director
    			  	 , MD.RATING rating
    			  	 , MD.STORY story
    			  	 , MD.ORIGIN_NAME originName
    			  	 , MD.ACTOR actor
    			  	 , MD.MOVIE_STATUS movieStatus
    			  	 , LISTAGG(G.GENRE_NAME, ', ') WITHIN GROUP (ORDER BY G.GENRE_NAME) genreName
    			  FROM 
    			  	   TB_MOVIE_DETAIL MD
    	     LEFT JOIN  
    				   TB_MOVIE_GENRE MG ON MD.MOVIE_ID = MG.MOVIE_ID
    		 LEFT JOIN 
    				   TB_GENRE G ON MG.GENRE_ID = G.GENRE_ID
    		  GROUP BY
     				   MD.MOVIE_ID
     			     , MD.MOVIE_TITLE
     			     , MD.RELEASE_DATE
      				 , MD.PLAY_TIME
     				 , MD.DIRECTOR
     				 , MD.RATING
     				 , MD.STORY
     				 , MD.ORIGIN_NAME
     				 , MD.ACTOR
     			     , MD.MOVIE_STATUS
    			 ORDER
    			    BY
    			       TO_DATE (RELEASE_DATE, 'YYYY.MM.DD') DESC
    		""")
    List<MovieDTO> getListMovie();
    
    @Select("""
			SELECT
			  	   MD.MOVIE_ID movieId
			  	 , MD.MOVIE_TITLE movieTitle
			  	 , MD.RELEASE_DATE releaseDate
			  	 , MD.PLAY_TIME playTime
			  	 , MD.DIRECTOR director
			  	 , MD.RATING rating
			  	 , MD.STORY story
			  	 , MD.ORIGIN_NAME originName
			  	 , MD.ACTOR actor
			  	 , MD.MOVIE_STATUS movieStatus
			  	 , LISTAGG(G.GENRE_NAME, ', ') WITHIN GROUP (ORDER BY G.GENRE_NAME) genreName
			  FROM 
			  	   TB_MOVIE_DETAIL MD
	     LEFT JOIN  
				   TB_MOVIE_GENRE MG ON MD.MOVIE_ID = MG.MOVIE_ID
		 LEFT JOIN 
				   TB_GENRE G ON MG.GENRE_ID = G.GENRE_ID
    		 WHERE 
    			   MD.MOVIE_ID = #{movieId}
    		 GROUP
    		 	BY
 				   MD.MOVIE_ID
 			     , MD.MOVIE_TITLE
 			     , MD.RELEASE_DATE
  				 , MD.PLAY_TIME
 				 , MD.DIRECTOR
 				 , MD.RATING
 				 , MD.STORY
 				 , MD.ORIGIN_NAME
 				 , MD.ACTOR
 			     , MD.MOVIE_STATUS
			 ORDER
			    BY
			       TO_DATE (RELEASE_DATE, 'YYYY.MM.DD') DESC
		""")
    MovieDTO findByMovieId();
    
}
