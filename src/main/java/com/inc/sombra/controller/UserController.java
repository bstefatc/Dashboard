package com.inc.sombra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.inc.sombra.entity.User;
import com.inc.sombra.exeptions.RegistrationException;
import com.inc.sombra.manager.IUserManager;

@Controller
public class UserController {

	@Autowired
	private IUserManager userManager;

	@RequestMapping(value = "/createuser", method = RequestMethod.POST)
	public String createuser(User user, Model model) {
		try {
			userManager.saveAndValidNewRegistredUser(user);
		} catch (RegistrationException e) {
			model.addAttribute("user", new User());
			model.addAttribute("msg", e.getMessage());
			return "redirect:/";
		}
		model.addAttribute("msg", "success registration");
		return "redirect:/";
	}

	@RequestMapping(value = "/wrong", method = RequestMethod.GET)
	public String wrong(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("msg", "wrong username or password");
		return "home";
	}

	@RequestMapping(value = "/usernamevalid", method = RequestMethod.POST)
	@ResponseBody
	public String usernamevalid(@RequestParam String username) {
		return username;
	}

}
