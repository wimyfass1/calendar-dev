package com.mycompany.myapp.web.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CalendarService calendarService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index(Locale locale, ModelAndView mav) {
		mav.addObject("message", "myCalendar 서비스에 오신 것을 환영합니다.");
		mav.setViewName("index");

		//추가
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName(); //get logged in username

		mav.addObject("user_email", email);

		System.out.println(email);

		return mav;
	}
}
