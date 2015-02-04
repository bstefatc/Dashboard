package com.inc.sombra.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.inc.sombra.entity.Task;

@Repository
public interface ITaskDao extends JpaRepository<Task,Integer> {
	@Query(name = "query", value = "select t from Task t join t.picture p where p.id = ?1")
	public List<Task> findTaskById(Integer pictureId);
}
