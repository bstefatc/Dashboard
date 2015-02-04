package com.inc.sombra.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.inc.sombra.dao.IRoleDao;
import com.inc.sombra.dao.IUserDao;
import com.inc.sombra.entity.Role;
import com.inc.sombra.entity.User;
import com.inc.sombra.exeptions.RegistrationException;

@Service
public class UserManager implements IUserManager {

	@Autowired
	IUserDao userDao;
	@Autowired
	IRoleDao roleDao;

	static StandardPasswordEncoder encoder = new StandardPasswordEncoder();

	@Override
	public User findByUsername(String username) {
		User user = new User();
		user = userDao.findByUsername(username);
		return user;
	}

	@Override
	@Transactional
	public void saveAndValidNewRegistredUser(User user) throws RegistrationException {
		validNewUser(user);
		Role role = roleDao.findEntity(Role.Name.user);
		if (role == null) {
			role = new Role();
			role.setName(Role.Name.user);
			roleDao.save(role);
			user.setRole(role);
		} else {
			user.setRole(role);
		}
		// user.setPassword(encoder.encode(user.getPassword()));
		userDao.save(user);

	}

	@Transactional
	private void validNewUser(User user) throws RegistrationException {
		if (user == null) {

			throw new RegistrationException("Null user");
		}

		if (user.getUsername().isEmpty()) {

			throw new RegistrationException("The username is empty");
		}

		if (user.getPassword().isEmpty()) {

			throw new RegistrationException("The password is empty");
		}

		User user1 = userDao.findByUsername(user.getUsername());

		if (user1 != null) {
			if (user.getUsername().equals(user1.getUsername())) {
				throw new RegistrationException("User with this username exists");
			}

			if (user.getUsername().equals(user1.getUsername())) {

				throw new RegistrationException("User with this username exists");
			}

		}

	}

}
