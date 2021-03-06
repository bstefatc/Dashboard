package com.inc.sombra.manager;

import java.util.List;

import org.springframework.stereotype.Component;

import com.inc.sombra.entity.Comment;

@Component
public interface ICommentManager {
	public List<Comment> findByPictureId(Integer pictureId);

	public void save(Comment comment, Integer itemId);
}
