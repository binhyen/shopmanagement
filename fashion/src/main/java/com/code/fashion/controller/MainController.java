package com.code.fashion.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.code.fashion.dao.GroupDAO;
import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.GroupEntity;
import com.code.fashion.entity.UserEntity;

@Controller
public class MainController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = {"/","/login"})
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value = "/homepage")
	public String homePage(Model model ,Principal principal, HttpServletRequest request) {
		UserEntity user = null;
		try {
			user = userDAO.findUserInfo(principal.getName());
		} catch (Exception e) {
			System.out.println(e);
		}
		model.addAttribute("user", user);
		HttpSession session = request.getSession();
		session.setAttribute("username", principal.getName());
		return "homepage";
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {

		if (principal != null) {
			model.addAttribute("message",
					"Hi " + principal.getName() + "<br> You do not have permission to access this page!");
		} else {
			model.addAttribute("msg", "You do not have permission to access this page!");
		}
		return "403Page";
	}
	
	@RequestMapping(value = "/updatepass", method = RequestMethod.POST)
	public String DoiPass(@RequestParam(name = "newpass") String newpass,
			@RequestParam(name = "oldpass") String oldpass, @RequestParam(name = "renewpass") String renewpass,
			Model model, HttpServletRequest request, Principal principal) {
		HttpSession session = request.getSession();
		UserEntity entity = userDAO.findUserInfo(principal.getName());
		if (oldpass.equals(entity.getPassword())) {
			if (newpass.equals(renewpass)) {
				entity.setPassword(newpass);
				userDAO.updateUser(entity);
				session.setAttribute("Error", "Đổi pass thành công");
				return "redirect:/homepage";
			} else {
				session.setAttribute("Error", "Xác nhận mật khẩu không chính xác");
				return "redirect:/homepage";
			}
		} else {
			session.setAttribute("Error", "Mật khẩu cũ không chính xác");
			return "redirect:/homepage";
		}

	}
}
