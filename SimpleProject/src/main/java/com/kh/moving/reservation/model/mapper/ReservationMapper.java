package com.kh.moving.reservation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.dto.ScreeningDTO;

@Mapper
public interface ReservationMapper {

	@Select("SELECT MOVIE_ID movieId , MOVIE_TITLE movieTitle FROM TB_MOVIE_DETAIL ORDER BY TO_DATE(Release_DATE,'YYYY.MM.DD')")
	List<MovieListDTO> findMovieList();

	@Select("""
			   SELECT
			          SCREENING_ID screeningId,
			          TO_CHAR(START_TIME, 'HH24:MI') startTime
			     FROM
			          TB_SCREENING
			    WHERE
			          MOVIE_ID = #{movieId}
			      AND
			      	  TO_DATE(TO_CHAR(SYSDATE, 'YYYYMMDD') || TO_CHAR(START_TIME, 'HH24:MI'), 'YYYYMMDDHH24:MI') >= SYSDATE
			    ORDER
			       BY
			          START_TIME ASC
			""")
	List<ScreeningDTO> findScreeningList(@Param("movieId") String movieId);

	@Select("""
			  SELECT
			  		 COUNT(*) count
			    FROM
			    	 TB_RESERVATION_SEAT rs
				JOIN
					 TB_RESERVATION r USING (RESERVATION_ID)
			   WHERE
			   		 r.SCREENING_ID = #{screeningId}
				 AND
				 	 TRUNC(r.RESERVATION_DATE) = TO_DATE(#{selectDate}, 'YYYY-MM-DD')
			     AND
			     	 r.RESERVATION_STATUS = 'Y'
			""")
	int findReservationCount(@Param("screeningId") int screeningId, @Param("selectDate") String selectDate);

	@Select("""
			  SELECT 
			  	     rs.SEAT_NUMBER
				FROM 
					 TB_RESERVATION_SEAT rs
                JOIN 
                     TB_RESERVATION r
			   USING (RESERVATION_ID)
			   WHERE 
			         r.MOVIE_ID = #{movieId}
				 AND 
				     TRUNC(r.RESERVATION_DATE) = TO_DATE(#{date}, 'YYYY-MM-DD')
                 AND 
                     r.RESERVATION_STATUS = 'Y'
						""")
	List<String> findReserveSeats(@Param("movieId") String movieId, @Param("date") String date);

}
