package com.mycompany.myapp.dao;

import java.util.List;

import com.mycompany.myapp.domain.EventAttendee;

public interface EventAttendeeDao {
    public List<EventAttendee> findEventAttendeeByEventId(int eventId);
    
    public List<EventAttendee> findEventAttendeeByAttendeeId(int attendeeId);

    public int createEventAttendee(EventAttendee eventAttendee);
    
    public void deleteAll();

	public List<EventAttendee> findAllEventAttendee();

	public void deleteEventAttendee(int id);
}