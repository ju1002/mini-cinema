package com.kh.moving.reservation.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.moving.reservation.model.dto.MovieListDTO;
import com.kh.moving.reservation.model.dto.ReservationDTO;
import com.kh.moving.reservation.model.dto.ReserveSeatsDTO;
import com.kh.moving.reservation.model.dto.ScreeningDTO;

@Mapper
public interface ReservationMapper {

	@Select("SELECT MOVIE_ID movieId , MOVIE_TITLE movieTitle FROM TB_MOVIE_DETAIL ORDER BY TO_DATE(Release_DATE,'YYYY.MM.DD')")
	List<MovieListDTO> findMovieList();

	@Select("""
		  SELECT 
        SCREENING_ID AS screeningId,
        TO_CHAR(START_TIME, 'HH24:MI') AS startTime
    FROM TB_SCREENING
    WHERE MOVIE_ID = #{movieId}
      AND TRUNC(START_TIME) = TO_DATE(#{selectDate}, 'YYYY-MM-DD')
    ORDER BY START_TIME ASC
			""")
	List<ScreeningDTO> findScreeningList(@Param("movieId") String movieId ,@Param("selectDate") String selectDate);

	@Select("""
	SELECT
    COUNT(*) AS count
FROM
    TB_RESERVATION_SEAT rs
JOIN
    TB_RESERVATION r USING (RESERVATION_ID)
JOIN
    TB_SCREENING s USING (SCREENING_ID)
WHERE
    SCREENING_ID = #{screeningId}   
    AND TRUNC(s.START_TIME) = TO_DATE(#{selectDate}, 'YYYY-MM-DD')
    AND RESERVATION_STATUS = 'Y'
			""")
	int findReservationCount(@Param("screeningId") int screeningId, @Param("selectDate") String selectDate);

	@Select("""
SELECT 
    rs.SEAT_NUMBER
FROM 
    TB_RESERVATION_SEAT rs
JOIN 
    TB_RESERVATION r 
    ON rs.RESERVATION_ID = r.RESERVATION_ID
JOIN 
    TB_SCREENING s 
    ON r.SCREENING_ID = s.SCREENING_ID
WHERE 
    s.MOVIE_ID = #{reserveSeats.movieId}
    AND TRUNC(s.START_TIME) = TO_DATE(#{reserveSeats.selectDate}, 'YYYY-MM-DD')
    AND TO_CHAR(s.START_TIME, 'HH24:MI') = #{reserveSeats.startTime}
    AND r.RESERVATION_STATUS = 'Y'              
						""")
	List<String> findReserveSeats(@Param("reserveSeats")ReserveSeatsDTO reserveSeats);

	
	
	
	@Insert("""	
			INSERT 
			  INTO
			       TB_RESERVATION 
			       (
			       RESERVATION_ID
			     , USER_NO
			     , MOVIE_ID
			     , SCREENING_ID
			     , RESERVATION_STATUS
			     , RESERVATION_DATE)
			VALUES 
				   (
				   RESERVATION_SEQ.NEXTVAL
			     , #{reserveDTO.userNo}
			     , #{reserveDTO.movieId}
			     , #{reserveDTO.screeningId}
			     , DEFAULT
			     , SYSDATE
			       )
			""")
	int saveReservation(@Param("reserveDTO")ReservationDTO reserveDTO);
	
	@Insert("""
			INSERT
			  INTO
			  	   TB_RESERVATION_SEAT
			  	   (
			  	   SEAT_ID
			  	 , SEAT_NUMBER
			  	 , Reservation_ID
			  	   )
			VALUES
			 	   (
			 	   RESERVATION_SEAT_SEQ.NEXTVAL
			 	 , #{seat}
			 	 , RESERVATION_SEQ.CURRVAL
			 	   )    
			""")
	int saveReserveSeat(@Param("seat")String seat);
	
	 
}
