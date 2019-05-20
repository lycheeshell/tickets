package edu.nju.tickets.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import edu.nju.tickets.pojo.Seat;
import edu.nju.tickets.pojo.Show;

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

	@Results(value={
			@Result(id=true,property="id",column="id"),
			@Result(property="name",column="name"),
	    	@Result(property="endtime",column="endtime", jdbcType=JdbcType.TIMESTAMP),
	    	@Result(property="type",column="type"),
	    	@Result(property="description",column="description")
	    	})
	@Select("select * from t_show where venue_id=#{0} and showtime>now()")
	public List<Show> getShows(int id);

	@Results(value={
			@Result(id=true,property="id",column="id"),
			@Result(property="name",column="name"),
	    	@Result(property="amount",column="amount"),
	    	@Result(property="price",column="price")
	    	})
	@Select("select * from t_seat where show_id=#{0}")
	public List<Seat> getSeats(int showid);

	@Update("update t_seat set amount = IF(amount < 1, 0, amount -1) where id = #{0}")
	public int updateSeatSell(int seatid);

	@Select("select amount from t_seat where id=#{0}")
	public int getAmount(int seatid);

}
