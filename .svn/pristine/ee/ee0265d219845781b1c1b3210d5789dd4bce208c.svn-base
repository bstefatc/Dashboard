package com.inc.sombra.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import com.inc.sombra.listener.Listener;

@MappedSuperclass
@EntityListeners(Listener.class)
public class AbstractEntity {
	@Column(name = "post_date")
	private Date date;

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
