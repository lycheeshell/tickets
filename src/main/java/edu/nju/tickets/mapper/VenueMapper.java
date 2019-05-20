package edu.nju.tickets.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.nju.tickets.pojo.Venue;

public interface VenueMapper {
	
	@Select("select count(*) from t_venue where account=#{0}")
	public int getManagerNumber(String account);
	
	@Insert("insert into t_venue values (default, #{account}, #{password}, #{name}, #{location}, #{phone}, #{seat}, 0, 0)")
	public int addManager(Venue venue);
	
	@Select("select * from t_venue where account=#{account} and password=#{password}")
	public Venue login(Venue venue);
	
	@Select("select * from t_venue where id=#{0}")
	public Venue getVenueInfo(int id);

	@Update("update t_venue set password=#{password}, name=#{name}, location=#{location}, phone=#{phone}, seat=#{seat}, state=2 where account=#{account}")
	public int modifyVenue(Venue venue);

	@Select("select seat from t_venue where id=#{0}")
	public int getSeatNum(int venueid);

}