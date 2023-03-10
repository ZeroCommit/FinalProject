package com.ef.exhibition.booking.model.vo;

import java.sql.Date;

import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class Booking {
	
	private int bookingNo; // 예매 번호
	private Date bookingDate; // 결제일
	private String bookingName; // 예매자 이름
	private String bookingEmail; // 예매자 이메일
	private String bookingPhone; // 예매자 폰번호
	private String bookingCheck; // 예매 확인 번호
	private String bookingState; // 결제 상태
	private int bookingPrice; // 결제 금액
	private int memberNo; // 회원 번호
	private int exNo; // 전시 번호                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
}