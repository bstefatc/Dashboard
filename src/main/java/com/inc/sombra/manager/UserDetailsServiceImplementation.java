package com.inc.sombra.manager;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.inc.sombra.entity.Role;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {

	@Autowired
	IUserManager userManager;

	/**
	 * check user data
	 * 
	 * @param username
	 * @return org.springframework.security.core.userdetails.User Object
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		// com.inc.sombra.entity.User user = new com.inc.sombra.entity.User();
		// user = userManager.findByUsername(username);
		// Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		// Role role = user.getRole();
		// authorities.add(new SimpleGrantedAuthority(role.getName().name()));
		// return new User(user.getUsername(), user.getPassword(), true, true,
		// true, true, authorities);

		com.inc.sombra.entity.User user = new com.inc.sombra.entity.User();
		user.setUsername(username);
		Role rol = new Role();
		rol.setId(1);
		rol.setName(Role.Name.user);
		user.setRole(rol);
		user.setPassword("b");
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		Role role = user.getRole();
		authorities.add(new SimpleGrantedAuthority(role.getName().name()));
		return new User(user.getUsername(), user.getPassword(), true, true, true, true, authorities);
	}

}
