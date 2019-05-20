package edu.nju.tickets.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ShowMapper {
	
	@Insert("insert into t_show values (default, #{1}, #{0}, #{3}, #{2}, #{4})")
	public int addShow(String showName, int venueid, String showType, String showTime, String showDescription);

	@Select("select LAST_INSERT_ID()")
	public int getLastShowId();

	@Select("select count(*) from t_seat where show_id=#{0} and name=#{1}")
	public int getSeatNumByName(int showid, String name);

	@Select("select ifnull(sum(amount),0) from t_seat where show_id=#{0}")
	public int getTotalSeatNum(int showid);

	@Insert("insert into t_seat values (default, #{0}, #{1}, #{2}, #{3})")
	public int addSeat(int showid, String name, int amount, int price);
	
	
	
}
