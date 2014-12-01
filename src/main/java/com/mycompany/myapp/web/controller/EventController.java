package com.mycompany.myapp.web.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;	
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public ModelAndView createEvent(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");
		mav.setViewName("createEvent");
		return mav;
	}
}
