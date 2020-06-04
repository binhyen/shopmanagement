package com.code.fashion.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.UserEntity;


@Controller
public class EmployeeController {
	@Autowired
	private UserDAO userDAO;
	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public String ListEmployee(Model model) {
		List<UserEntity> list = userDAO.getAllUser(0, 0);
		for (UserEntity userEntity : list) {
			if (userEntity.getSex().equalsIgnoreCase("nu")) {
				userEntity.setSex("Nữ");
			}
			
//			if(userEntity.getGroupId().getId().equalsIgnoreCase("G_001")) {
//				userEntity.getGroupId().setId("Quản ký");
//			} else {
//				userEntity.getGroupId().setId("Nhân viên");
//			}
		}
		model.addAttribute("listEmployee", list);
		return "employee";
	}

	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public String insert(Model model) {
		UserEntity entity=new UserEntity();
		model.addAttribute("employee", entity);
		model.addAttribute("listEmployee", dataForPositions());
		return "client";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEdit( Model model,
			@RequestParam(value = "id", required = false) String userId) {
		UserEntity entity = userDAO.findUserInfo(userId);
		model.addAttribute("employee", entity);
		model.addAttribute("listEmployee", dataForPositions());
		return "edit";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute(value = "employee") UserEntity user, Model model) {
		if (userDAO.findUserInfo((user.getId()))!=null) {
			model.addAttribute("msg", "Mã nhân viên đã sử dụng !!!");
			return "client";
		} else {
			userDAO.updateUser(user);
			List<UserEntity> list = userDAO.getAllUser(0, 0);
			model.addAttribute("listEmployee", list);
			return "redirect:/employee";
		}
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute(value = "employee") UserEntity user, Model model,
			@RequestParam(value = "maNV", required = false) String userId) {
		
		userDAO.updateUser(user);
		return "redirect:/employee";
	}
	
	@ModelAttribute("dataForPositions")
	private Map<String, String> dataForPositions() {
	       Map<String, String> positionMap = new LinkedHashMap<String, String>();
	       positionMap.put("G_001", "Quản lý");
	       positionMap.put("G_002", "Nhân viên bán hàng");
	       return positionMap;
	}
	
	@ModelAttribute("dataForSexs")
	private Map<String, String> dataForSexs() {
	       Map<String, String> positionSex = new LinkedHashMap<String, String>();
	       positionSex.put("Nam", "Nam");
	       positionSex.put("Nu", "Nữ");
	       System.out.println(positionSex);
	       return positionSex;
	}
}
