package com.code.fashion.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.code.fashion.dao.UserDAO;
import com.code.fashion.entity.UserEntity;


@Service
public class MyUserDetailsService implements UserDetailsService{
	@Autowired
	private UserDAO userDAO;
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserEntity userInfo = userDAO.findUserInfo(username);
        System.out.println("UserInfo= " + username);

        if (userInfo == null) {
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }
        
        // [USER,ADMIN,..]
        String roles= userDAO.getUserGroup(username);
        
        List<GrantedAuthority> grantList= new ArrayList<GrantedAuthority>();
        if(roles!= null)  {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + roles);
                grantList.add(authority);
        }        
        
        UserDetails userDetails = (UserDetails) new User(userInfo.getId(), //
        		"{noop}"+userInfo.getPassword(),grantList);

        System.out.println("username: "+ userInfo.getId());
        System.out.println("password: "+  userInfo.getPassword());
        System.out.println("userDetails: "+ userDetails);
        System.out.println("grantList: "+ grantList);
        System.out.println("grantList: "+ userDetails.getPassword());
        return userDetails;
	}
	
}
