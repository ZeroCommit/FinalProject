package com.ef.exhibition.artist.model.vo;

import java.sql.Date;

import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Artist {
	
	private int artNo;
	
	private String artName;
	private Date artBirth;
	private String artCareer;
	private String artEdu;
	private String artRecord;
	private String artImg;
}
