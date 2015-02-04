package com.inc.sombra.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.sombra.dao.ICommentDao;
import com.inc.sombra.entity.Comment;

@Service
public class CommentManager implements ICommentManager {
	@Autowired
	private ICommentDao commentDao;
	@Autowired
	private IPictureManager pictureManager;

	@Override
	public List<Comment> findByPictureId(Integer pictureId) {
		return commentDao.findByPictureId(pictureId);
	}

	@Override
	public void save(Comment comment, Integer itemId) {
		if ((!comment.getUserName().equals("")) && (!comment.getCommentText().equals("")) && (!comment.getCommentText().equals(null))
				&& (!comment.getCommentText().equals(null))) {
			comment.setPicture(pictureManager.findPictureById(itemId));
			commentDao.save(comment);
		}
	}
}
