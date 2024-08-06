package com.muse.lab.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderVO {
	// pay
	private String orderNum;
	private String productName;
	private Date orderDate;
	private int totalPrice;
	private String impUid;
	private String userId;
	private String payMethod;

}
