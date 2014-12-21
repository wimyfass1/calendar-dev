package com.mycompany.myapp.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventLevel;
import com.mycompany.myapp.service.CalendarService;
import com.mycompany.myapp.domain.EventAttendee;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/events")
public class EventController {
	@Autowired
	private CalendarService calendarService;	

	private List<Event> events = null;
	private List<EventAttendee> eventAttendees = null;
	private Event event = new Event();

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView defaltEvent(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");

		mav.setViewName("events/indexEvent");

		return mav;
	}

	@RequestMapping(value = "/indexEvent", method = RequestMethod.POST)
	public ModelAndView inedxEvent(Locale locale, ModelAndView mav, HttpServletRequest request) {
		mav.addObject("message", "event를 생성하세요.");

		//SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		//String sdate;
		//Date date = sdf.parse(sdate);

		request.getParameterNames();

		System.out.println(request.getParameterNames());
		System.out.println("test");

		mav.setViewName("events/indexEvent");

		return mav;
	}

	@RequestMapping(value = "/eventSet", method = RequestMethod.GET)
	public ModelAndView evnetGet(Locale locale, ModelAndView mav,
			@RequestParam(value = "event1", required = false) int event1 ,
			@RequestParam(value = "deleteEvent", required = false) int deleteEvent) {


		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		CalendarUser calendarUser = new CalendarUser();

		calendarUser = calendarService.getUserByEmail(email);	    

		events = new ArrayList<Event>();
		eventAttendees = new ArrayList<EventAttendee>();

		events = calendarService.getEventForOwner(calendarUser.getId());
		eventAttendees = calendarService.getEventAttendeeByAttendeeId(calendarUser.getId());


		mav.setViewName("events/eventSet");
		if(event1 != 0)
		{
			event1--;

			this.event = calendarService.getEvent(event1);

			mav.addObject("events", this.event);
		}
		if(deleteEvent !=0)
		{
			deleteEvent--;
			System.out.println("delete!!" + deleteEvent);

			calendarService.deleteEventAttendee(eventAttendees.get(event1).getId());

			if(event1 == -1)
			{
				mav.setViewName("events/myEvent");
			}
		}

		return mav;
	}

	@RequestMapping(value = "/eventSet", method = RequestMethod.POST)
	public ModelAndView evnetSet(Locale locale, ModelAndView mav,
			@RequestParam(value = "summary", required = false) String summary,
			@RequestParam(value = "description", required = false) String description,
			@RequestParam(value = "date", required = false) Date date){


		Calendar cal = Calendar.getInstance();
		cal.setTime(date);


		Timestamp timestamp = new Timestamp(Calendar.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 
		Timestamp timestamp2 = new Timestamp(cal.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 


		this.event.setDate(date.getDate());
		this.event.setDescription(description);
		this.event.setSummary(summary);

		calendarService.upgradeEventLevel(this.event);


		mav.setViewName("events/eventSet");
		return mav;
	}

	@RequestMapping(value = "/registrationSet", method = RequestMethod.GET)
	public ModelAndView registrationGet(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		CalendarUser calendarUser = new CalendarUser();

		calendarUser = calendarService.getUserByEmail(email);	    

		mav.addObject("calendarUser", calendarUser);

		return mav;
	}

	@RequestMapping(value = "/registrationSet", method = RequestMethod.POST)
	public ModelAndView registrationSet(Locale locale, ModelAndView mav,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "name", required = false, defaultValue = "0")String name){


		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		System.out.println("동작!");
		CalendarUser calendarUser = new CalendarUser();

		calendarUser = calendarService.getUserByEmail(email);	 

		calendarUser.setName(name);

		calendarUser.setPassword(password);

		calendarService.userSet(calendarUser);


		mav.setViewName("events/registrationSet");
		return mav;
	}

	@RequestMapping(value = "/allEvent", method = RequestMethod.GET)
	public ModelAndView allEvent(Locale locale, ModelAndView mav) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		events = new ArrayList<Event>();
		eventAttendees = new ArrayList<EventAttendee>();

		events = calendarService.getAllEvents();
		eventAttendees = calendarService.findAllEventAttendee();
		System.out.println(events.get(1).getWhen());

		System.out.println(events.size());
		System.out.println(eventAttendees.size());

		mav.addObject("events",events);
		mav.addObject("eventAttendees",eventAttendees);

		mav.addObject("message", events.size());


		mav.setViewName("events/allEvent");

		return mav;
	}

	@RequestMapping(value = "/allEvent", method = RequestMethod.POST)
	public ModelAndView allEvent_user(Locale locale, ModelAndView mav,
			@RequestParam(value = "event1", required = false) int event_num,
			@RequestParam(value = "event11", required = false, defaultValue = "0") int delete_num){

		events = new ArrayList<Event>();
		eventAttendees = new ArrayList<EventAttendee>();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);
		if(event_num != 0)
		{

			CalendarUser calendarUser = new CalendarUser();
			EventAttendee eventAttendee = new EventAttendee();

			calendarUser = calendarService.getUserByEmail(email);	    

			event_num--;

			eventAttendee.setEvent(calendarService.getEvent(event_num));
			eventAttendee.setAttendee(calendarUser);

			calendarService.createEventAttendee(eventAttendee);

			System.out.println(event_num);
		}

		if(delete_num != 0)
		{
			delete_num--;

			System.out.println(delete_num);

			calendarService.deleteEvent(delete_num);

		}

		events = calendarService.getAllEvents();
		eventAttendees = calendarService.findAllEventAttendee();

		mav.addObject("events",events);
		mav.addObject("eventAttendees",eventAttendees);

		mav.setViewName("events/allEvent");

		return mav;
	}

	@RequestMapping(value = "/myEvent", method = RequestMethod.GET)
	public ModelAndView myEvent(Locale locale, ModelAndView mav) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		CalendarUser calendarUser = new CalendarUser();

		calendarUser = calendarService.getUserByEmail(email);	    

		events = new ArrayList<Event>();
		eventAttendees = new ArrayList<EventAttendee>();

		events = calendarService.getEventForOwner(calendarUser.getId());
		eventAttendees = calendarService.getEventAttendeeByAttendeeId(calendarUser.getId());

		System.out.println(events.size());
		System.out.println(eventAttendees.size());

		if(events.size() != 0)
		{
			mav.addObject("events",events);
			mav.addObject("eventError", "Nope");
		}

		if(eventAttendees.size() != 0)
		{
			mav.addObject("eventAttendees",eventAttendees);
			mav.addObject("eventAttendeesError", "Nope");
		} 


		mav.setViewName("events/myEvent");

		return mav;
	}

	@RequestMapping(value = "/okEvent", method = RequestMethod.GET)
	public ModelAndView okEvent(@RequestParam(value = "date1", required = false) Date date1,
			@RequestParam(value = "summary", required = false) String summary,
			@RequestParam(value = "description", required = false) String description,
			Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);

		Calendar cal = Calendar.getInstance();
		cal.setTime(date1);


		Timestamp timestamp = new Timestamp(Calendar.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 
		Timestamp timestamp2 = new Timestamp(cal.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 

		Event event = new Event();

		event.setOwner(calendarService.getUserByEmail(email));
		event.setDate(date1.getDate());
		event.setDescription(description);
		event.setSummary(summary);
		event.setNumLikes(0);
		event.setEventLevel(EventLevel.NORMAL);

		calendarService.createEvent(event);

		timestamp2.setDate(date1.getDate());

		System.out.println(cal);
		System.out.println(timestamp);
		System.out.println(timestamp2);

		mav.setViewName("events/okEvent");

		return mav;
	}

	@RequestMapping(value = "/newevent", method = RequestMethod.GET)
	public ModelAndView newEvent(Locale locale, ModelAndView mav) {
		mav.addObject("message", "event를 생성하세요.");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String email = auth.getName();
		mav.addObject("user_email",email);
		mav.setViewName("events/newevent");

		return mav;
	}

}