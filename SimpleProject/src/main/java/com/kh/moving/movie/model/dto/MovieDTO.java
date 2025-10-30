package com.kh.moving.movie.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MovieDTO {
	private String movieId;
	private String movieTitle;
	private String releaseDate;
	private String playTime;
	private String director;
	private String rating;
	private String story;
	private String originName;
	private String actor;
	private String movieStatus;
}
