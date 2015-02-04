package com.inc.sombra.dto.model;

import java.util.List;

import com.inc.sombra.entity.Comment;
import com.inc.sombra.entity.Picture;
import com.inc.sombra.entity.Task;

public class ItemDto {
	private Picture picture;
	private List<Comment> commentList;
	private List<Task> taskList;

	public Picture getPicture() {
		return picture;
	}

	public void setPicture(Picture picture) {
		this.picture = picture;
	}

	public List<Comment> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}

	public List<Task> getTaskList() {
		return taskList;
	}

	public void setTaskList(List<Task> taskList) {
		this.taskList = taskList;
	}

}
