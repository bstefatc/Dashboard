package com.inc.sombra.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.inc.sombra.entity.Role;
import com.inc.sombra.entity.Role.Name;

@Repository
public interface IRoleDao extends JpaRepository<Role, Integer> {
	@Query(name = "query", value = "select r from Role r where r.name = ?1")
	public Role findEntity(Name user);
}
