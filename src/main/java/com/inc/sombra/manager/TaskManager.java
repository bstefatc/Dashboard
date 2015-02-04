package com.inc.sombra.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.sombra.dao.ITaskDao;
import com.inc.sombra.entity.Task;

@Service
public class TaskManager implements ITaskManager {
	@Autowired
	private ITaskDao taskDao;
	@Autowired
	private IPictureManager pictureManager;

	@Override
	public void save(Task task, Integer itemId) {
		if ((!task.getName().equals("")) && (!task.getName().equals(null))) {
			task.setPicture(pictureManager.findPictureById(itemId));
			taskDao.save(task);
		}
	}

	@Override
	public List<Task> findTaskById(Integer pictureId) {
		return taskDao.findTaskById(pictureId);
	}

	@Override
	public Task findById(Integer taskId) {
		return taskDao.findOne(taskId);
	}
}
