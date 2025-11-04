package com.kh.moving.movie.model.dto;

import java.util.List;

import com.google.gson.annotations.SerializedName;

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
public class MovieResponseDTO {
	private Dates dates;
	private int page;
	private List<ApiMovieDTO> results;

	@SerializedName("total_pages")
	private int totalPages;

	@SerializedName("total_results")
	private int totalResults;
}