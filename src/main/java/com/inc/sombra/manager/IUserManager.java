package com.inc.sombra.manager;

import org.springframework.stereotype.Component;

import com.inc.sombra.entity.User;
import com.inc.sombra.exeptions.RegistrationException;

@Component
public interface IUserManager {

	public User findByUsername(String username);

	void saveAndValidNewRegistredUser(User user) throws RegistrationException;
}
