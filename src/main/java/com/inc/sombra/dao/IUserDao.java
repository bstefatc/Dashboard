package com.inc.sombra.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.inc.sombra.entity.User;

@Repository
public interface IUserDao extends JpaRepository<User, Integer> {
	@Query(name = "query", value = "select u from User u where u.username = ?1")
	public User findByUsername(String username);
}
