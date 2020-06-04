package com.code.fashion.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.code.fashion.dao.SellsDAO;
import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.CustomerEntity;
import com.code.fashion.entity.UserEntity;
import com.code.fashion.form.SearchForm;
import com.code.fashion.model.Report;


@Controller
public class ReportController {
	@Autowired
    SellsDAO sellsDAO;

	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = { "/report" }, method = RequestMethod.GET)
	public String data(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required = false) Integer page, Principal principal) {
		int numberUsersInOnePage = 10;
		HttpSession session = request.getSession();
		if ((session.getAttribute("groupId") == null) || (session.getAttribute("username") == null)) {
			UserEntity userDb = userDAO.findUserInfo(principal.getName());
			session.setAttribute("groupId", userDb.getGroupId().getId());
			session.setAttribute("username", userDb.getFirstName());
			return "redirect:/login";
		}
		if (page == null)
			page = 1;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		System.out.println(dateFormat.format(date));
		long userCount = sellsDAO.getNumberOfReport(dateFormat.format(date));
		int pageCount = (int) Math.ceil(userCount / numberUsersInOnePage);
		if (page > pageCount && pageCount > 0)
			page = pageCount;
		System.out.println(pageCount);
		CustomerEntity customer = new CustomerEntity();
		SearchForm searchForm = new SearchForm();
		model.addAttribute("employee", customer);
		model.addAttribute("search", searchForm);
		List<Report> list = sellsDAO.getDayReport(dateFormat.format(date));

		model.addAttribute("listReport", list);
		model.addAttribute("numberUsersInOnePage", numberUsersInOnePage);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", page.intValue());
		return "dayReport";
	}
	@RequestMapping(value = { "/report" }, method = RequestMethod.POST)
	public String getReport(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required = false) Integer page, Principal principal,@RequestParam(name="dateSearch",required=false)String date){
		int numberUsersInOnePage = 10;
		HttpSession session = request.getSession();
		if ((session.getAttribute("groupId") == null) || (session.getAttribute("username") == null)) {
			UserEntity userDb = userDAO.findUserInfo(principal.getName());
			session.setAttribute("groupId", userDb.getGroupId().getId());
			session.setAttribute("username", userDb.getFirstName());
			return "redirect:/login";
		}
		if (page == null)
			page = 1;
		long userCount = sellsDAO.getNumberOfReport(date);
		int pageCount = (int) Math.ceil(userCount / numberUsersInOnePage);
		if (page > pageCount && pageCount > 0)
			page = pageCount;
		System.out.println(pageCount);
		CustomerEntity employee = new CustomerEntity();
		SearchForm searchForm = new SearchForm();
		model.addAttribute("employee", employee);
		model.addAttribute("search", searchForm);
		List<Report> list = sellsDAO.getDayReport(date);

		model.addAttribute("listReport", list);
		model.addAttribute("numberUsersInOnePage", numberUsersInOnePage);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", page.intValue());
		return "dayReport";
	}
}
