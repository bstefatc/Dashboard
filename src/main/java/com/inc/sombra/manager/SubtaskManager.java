package com.inc.sombra.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inc.sombra.dao.ISubTaskDao;
import com.inc.sombra.entity.Subtask;

@Service
public class SubtaskManager implements ISubtaskManager {

	@Autowired
	private ISubTaskDao subtaskDao;
	@Autowired
	private ITaskManager taskManager;

	@Override
	public void save(Subtask subtask, Integer taskId) {
		if ((!subtask.getName().equals("")) && (!subtask.getName().equals(null))) {
			subtask.setTask(taskManager.findById(taskId));
			subtaskDao.save(subtask);
		}
	}

	@Override
	public Subtask findOne(Integer id) {
		return subtaskDao.findOne(id);
	}

}
