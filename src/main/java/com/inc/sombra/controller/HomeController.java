package com.inc.sombra.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.inc.sombra.dto.manager.IItemDtoManager;
import com.inc.sombra.entity.Comment;
import com.inc.sombra.entity.Subtask;
import com.inc.sombra.entity.Task;
import com.inc.sombra.entity.User;
import com.inc.sombra.manager.ICommentManager;
import com.inc.sombra.manager.IPictureManager;
import com.inc.sombra.manager.ISubtaskManager;
import com.inc.sombra.manager.ITaskManager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private IPictureManager pictureManager;
	@Autowired
	private ICommentManager commentManager;
	@Autowired
	private ITaskManager taskManager;
	@Autowired
	private ISubtaskManager subtaskManager;
	@Autowired
	private IItemDtoManager itemDtoManager;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("pictureList", pictureManager.getAll());
		model.addAttribute("user", new User());
		return "home";
	}

	@RequestMapping(value = "/items/{itemId}", method = RequestMethod.GET)
	public String item(Model model, @PathVariable Integer itemId) {
		logger.info("Welcome home! The client locale is {}.");
		model.addAttribute("commentForm", new Comment());
		model.addAttribute("addToDoForm", new Task());
		model.addAttribute("addsubtask", new Subtask());
		model.addAttribute("dto", itemDtoManager.createHomeDto(itemId));
		return "item";
	}

	@RequestMapping(value = "/items/addcomment/{itemId}", method = RequestMethod.POST)
	public String addComment(@ModelAttribute("commentForm") Comment comment, @PathVariable Integer itemId) {
		commentManager.save(comment, itemId);
		return "redirect:/items/" + itemId;
	}

	@RequestMapping(value = "/items/addtodo/{itemId}", method = RequestMethod.POST)
	public String addTask(@ModelAttribute("addToDoForm") Task task, @PathVariable Integer itemId) {
		taskManager.save(task, itemId);
		return "redirect:/items/" + itemId;
	}

	@RequestMapping(value = "/items/addsubtask/{taskId}/{itemId}", method = RequestMethod.POST)
	public String addSubtask(@ModelAttribute("addsubtask") Subtask subtask, @PathVariable Integer taskId, @PathVariable Integer itemId) {
		subtaskManager.save(subtask, taskId);
		return "redirect:/items/" + itemId;

	}
}
