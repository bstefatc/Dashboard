package com.inc.sombra.dto.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.sombra.dto.model.ItemDto;
import com.inc.sombra.manager.ICommentManager;
import com.inc.sombra.manager.IPictureManager;
import com.inc.sombra.manager.ISubtaskManager;
import com.inc.sombra.manager.ITaskManager;

@Service
public class ItemDtoManager implements IItemDtoManager {
	@Autowired
	private IPictureManager pictureManager;
	@Autowired
	private ICommentManager commentManager;
	@Autowired
	private ITaskManager taskManager;
	@Autowired
	private ISubtaskManager subtaskManager;

	@Override
	public ItemDto createHomeDto(Integer itemId) {
		ItemDto itemDto = new ItemDto();
		itemDto.setPicture(pictureManager.findPictureById(itemId));
		itemDto.setCommentList(commentManager.findByPictureId(itemId));
		itemDto.setTaskList(taskManager.findTaskById(itemId));
		return itemDto;
	}
}
