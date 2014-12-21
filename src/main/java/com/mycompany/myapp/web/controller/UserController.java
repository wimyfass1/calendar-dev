package com.mycompany.myapp.web.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.config.authentication.UserServiceBeanDefinitionParser;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.EventAttendee;
import com.mycompany.myapp.service.CalendarService;

/**
 * Handles requests for the application home page.
 * 
 * 
 * 
 * 이런식으로 알아낼 수 있다.
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
      String email = auth.getName(); //get logged in username

      model.addObject("user_email", email);

      System.out.println(email);
 */
@Controller
@RequestMapping(value = "/users")
public class UserController {
	/*
	@RequestMapping(value = "/resister", method = RequestMethod.GET)
	public ModelAndView index(Locale locale, ModelAndView mav) {
		mav.addObject("message", "Users page입니다.");

		//jsp이름과 맞추기

		return mav;
	}*/
	@Autowired
	CalendarService calendarService;

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegistration(Model model) {
		CalendarUser userForm = new CalendarUser();    
		model.addAttribute("userForm", userForm);
		/*
        List<String> professionList = new ArrayList<String>();
        professionList.add("Developer");
        professionList.add("Designer");
        professionList.add("IT Manager");
        model.addAttribute("professionList", professionList);
		 */

		return "resister/registration";
	}


	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") CalendarUser user, Model model) {

		this.calendarService.add(user);

		// for testing purpose:
		System.out.println("name: " + user.getName());
		System.out.println("password: " + user.getPassword());
		System.out.println("email: " + user.getEmail());

		return "resister/registrationSuccess";
	}

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");

		model.setViewName("home");

		return model;

	}

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error, @RequestParam(value = "logout", required = false) String logout,ModelAndView model) {
	
		//이게 위로 들어간다. ModelAndView model = new ModelAndView();
	  
	  if (error != null) {
		model.addObject("error", "Invalid username and password!");
	  }
 
	  if (logout != null) {
		model.addObject("msg", "You've been logged out successfully.");
	  }
	  model.setViewName("/users/signin");
 
	  return model;
	}

	@RequestMapping(value = "/login_ok", method = RequestMethod.GET)
	public ModelAndView login_ok( ) {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("login_ok");

		return model;
	}

	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied(ModelAndView model) {
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();	
			model.addObject("username", userDetail.getUsername());
		}

		model.setViewName("403");
		
		return model;
	}
}
