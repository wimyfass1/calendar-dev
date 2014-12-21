package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.Event;
import com.mycompany.myapp.domain.EventLevel;

@Repository("eventDao")
public class JdbcEventDao implements EventDao {
	private JdbcTemplate jdbcTemplate;

	private RowMapper<Event> rowMapper;

	@Autowired
	private CalendarUserDao calendarUserDao;
	
	// --- constructors ---
	public JdbcEventDao() {
		rowMapper = new RowMapper<Event>() {
			public Event mapRow(ResultSet rs, int rowNum) throws SQLException {
				Event event = new Event();
				event.setId(rs.getInt("id"));
				Calendar when = Calendar.getInstance();
				when.setTimeInMillis(rs.getTimestamp("timestamp").getTime());
				event.setWhen(when);
				event.setSummary(rs.getString("summary"));
				event.setDescription(rs.getString("description"));
				event.setOwner(calendarUserDao.findUser(rs.getInt("owner")));
				event.setNumLikes(rs.getInt("num_likes"));  						/* Updated by Assignment 3 */
				event.setEventLevel(EventLevel.valueOf(rs.getInt("event_level")));	/* Updated by Assignment 3 */
				return event;
			}
		};
	}
	
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// --- EventService ---
	@Override
	public Event findEvent(int eventId) {
		String sql_query = "select * from events where id = ?";
		return this.jdbcTemplate.queryForObject(sql_query, new Object[] {eventId}, rowMapper);
	}

	@Override
	public int createEvent(final Event event) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {
			@SuppressWarnings("deprecation")
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement("insert into events (timestamp,summary, description, owner, num_likes, event_level) values(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
				//insert into events(summary, description, owner, num_likes, event_level,'when') values('k','k',3,0,1,'2014-12-01 11:08:07.873')
				Timestamp timestamp2 = new Timestamp(Calendar.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 
				//Timestamp timestamp2 = new Timestamp(event.getWhen().getInstance().getTime().getDate()); /* Updated by Assignment 3 */ 
				
				timestamp2.setDate(event.getDate());

				System.out.println("errer!!");
				System.out.println(timestamp2);
				
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				System.out.println(format.format(timestamp2));
				System.out.println(event.getSummary());
				

		//		ps.setString(1, format.format(timestamp2));
				ps.setTimestamp(1, timestamp2);
				ps.setString(2, event.getSummary());
				ps.setString(3, event.getDescription());
				ps.setInt(4, event.getOwner().getId());
				ps.setInt(5, event.getNumLikes());      		/* Updated by Assignment 3 */
				ps.setInt(6, event.getEventLevel().intValue());	/* Updated by Assignment 3 */
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}	
	
	/*
	@Override
	public int createEvent(final Event event) {
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement("insert into events('when', summary, description, owner, num_likes, event_level) values(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

				Timestamp timestamp2 = new Timestamp(event.getWhen().getInstance().getTimeInMillis());
				//Timestamp timestamp2 = new Timestamp(event.getWhen().getInstance().getTime().getDate()); 
				
				timestamp2.setDate(event.getDate());

				System.out.println("errer!!");
				System.out.println(timestamp2);
				
				ps.setTimestamp(1, timestamp2);
				ps.setString(2, event.getSummary());
				ps.setString(3, event.getDescription());
				ps.setInt(4, event.getOwner().getId());
				ps.setInt(5, event.getNumLikes());      	
				ps.setInt(6, event.getEventLevel().intValue());	
				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}	
	*/

	@Override
	public List<Event> findForOwner(int ownerUserId) {
		String sql_query = "select * from events where owner = ?";
		return this.jdbcTemplate.query(sql_query, new Object[] {ownerUserId}, rowMapper);
	}

	@Override
	public List<Event> findAllEvents(){
		String sql_query = "select * from events";
		return this.jdbcTemplate.query(sql_query, rowMapper);
	}

	@Override
	public void deleteAll() {
		String sql = "delete from events";
		this.jdbcTemplate.update(sql);
	}
	
	@Override
	public void deleteEvent(int id) {
		// TODO Assignment 3
		String sql_query = "delete from events where id = ?";
		this.jdbcTemplate.update(sql_query, new Object[] {id});
	}
	
	@Override
	public List<Event> findEventsByLevel(EventLevel eventLevel) {
		// TODO Assignment 3
		// 인자로 받은 이벤트 레벨에 대해 해당 레벨을 지니고 있는 이벤트들을 반환한다.
		String sql_query = "select * from events where event_level = ?";
		return this.jdbcTemplate.query(sql_query, new Object[] {eventLevel}, rowMapper);
	}

	@Override
    public void udpateEvent(Event event) {
		// TODO Assignment 3
		// 인자로 받은 이벤트가 지닌 각 필드 값으로 해당 이벤트 DB 테이블 내 칼럼을 업데이트 한다.
		String sql_query = "update events set timestamp = ?, summary = ?, description = ?, owner = ?, num_likes = ?, event_level = ? where id = ?";
		Timestamp timestamp2 = new Timestamp(Calendar.getInstance().getTimeInMillis()); /* Updated by Assignment 3 */ 
		//Timestamp timestamp2 = new Timestamp(event.getWhen().getInstance().getTime().getDate()); /* Updated by Assignment 3 */ 
		
		timestamp2.setDate(event.getDate());

		System.out.println("errer!!");
		System.out.println(timestamp2);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		System.out.println(format.format(timestamp2));
		System.out.println(event.getSummary());
		

		this.jdbcTemplate.update(sql_query, new Object[] {timestamp2, event.getSummary(), event.getDescription(), event.getOwner().getId(), event.getNumLikes(), event.getEventLevel().intValue(), event.getId()});
	}
}