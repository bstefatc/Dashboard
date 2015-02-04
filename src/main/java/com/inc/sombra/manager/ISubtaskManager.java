package com.inc.sombra.manager;

import org.springframework.stereotype.Component;

import com.inc.sombra.entity.Subtask;

@Component
public interface ISubtaskManager {
	public void save(Subtask subtask, Integer taskId);

	public Subtask findOne(Integer id);
}
