package com.inc.sombra.manager;

import java.util.List;

import org.springframework.stereotype.Component;

import com.inc.sombra.entity.Task;

@Component
public interface ITaskManager {
	public void save(Task task, Integer itemId);

	public List<Task> findTaskById(Integer pictureId);

	public Task findById(Integer taskId);
}
