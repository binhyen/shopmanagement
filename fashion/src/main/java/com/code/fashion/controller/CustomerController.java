package com.code.fashion.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.code.fashion.dao.CustomerDAO;
import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.CustomerEntity;
import com.code.fashion.entity.UserEntity;
import com.code.fashion.form.SearchForm;


@Controller
public class CustomerController {
	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(value = { "/customer" }, method = RequestMethod.GET)
	public String data(HttpServletRequest request, Model model,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(name = "id", required = false) String id, Principal principal) {
		int USERS_PER_PAGE = 5;
		HttpSession session = request.getSession();
		if ((session.getAttribute("groupId") == null) || (session.getAttribute("username") == null)) {
			UserEntity userDb = userDAO.findUserInfo(principal.getName());
			session.setAttribute("groupId", userDb.getGroupId().getId());
			session.setAttribute("username", userDb.getFirstName());
			return "redirect:/login";
		}
		if (page == null)
			page = 1;
		double userCount = customerDAO.countNumOfCustomer();
		int pageCount = (int) Math.ceil(userCount / USERS_PER_PAGE);
		if (page > pageCount && pageCount > 0)
			page = pageCount;
		System.out.println(pageCount);
		CustomerEntity customer = new CustomerEntity();
		SearchForm searchForm = new SearchForm();
		if (id != null) {
			customer = customerDAO.getCustomer(id);
		}
		model.addAttribute("customer", customer);
		model.addAttribute("search", searchForm);
		int start = (page - 1) * USERS_PER_PAGE;
		List<CustomerEntity> list = customerDAO.getListCustomer(start, start + USERS_PER_PAGE);

		model.addAttribute("listCustomers", list);
		model.addAttribute("USERS_PER_PAGE", USERS_PER_PAGE);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("page", page.intValue());
		return "customer";
	}
	
	@RequestMapping(value = "/customer", method = RequestMethod.POST)
	public String addOrUpdateCustomer( //
			Model model, @ModelAttribute("customer") CustomerEntity customerEntity,
			@ModelAttribute("search") SearchForm searchForm) {
		customerDAO.insertOrUpdateCustomer(customerEntity);
		model.addAttribute("save", customerEntity.getId());
		return "redirect:/customer";
	}

	@RequestMapping(value = "/deleteCustomer")
	public String deleteCustomer(Model model, @RequestParam(name = "id", required = false) String id,
			@RequestParam(name = "page", required = false) Integer page) {
		customerDAO.deleteCustomer(id);
		if (page == null) {
			page = 1;
		}
		model.addAttribute("deleted", id);
		return "redirect:/customer";
	}

	@RequestMapping(value = "aCus", method = RequestMethod.GET)
	@ResponseBody
	public CustomerEntity sendCustomer(@RequestParam("id") String id, Model model) {
		System.out.println("id " + id);
		CustomerEntity customerEntity = customerDAO.getCustomer(id);
		System.out.println(customerEntity.getId());
		return customerEntity;
	}
	
	@RequestMapping("/insertCustomer")
	   public String createApplicant(Model model) {
		   CustomerEntity customerInfor =new CustomerEntity();
		   model.addAttribute("customerForm", customerInfor);
		   return "insertCustomer";
	   }
	   
	   // Save or update Applicant
	   // 1. @ModelAttribute bind form value
	   // 2. @Validated form validator
	   // 3. RedirectAttributes for flash value
	   @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	   public String saveApplicant(Model model, //
	           @ModelAttribute("customerForm") CustomerEntity customerInfo, //
	           BindingResult result) {
		   customerInfo.setPoint(0);
		   customerInfo.setRank("none");
		   customerDAO.insertOrUpdateCustomer(customerInfo);
	       return "redirect:/insertCustomer";
	   }
}
