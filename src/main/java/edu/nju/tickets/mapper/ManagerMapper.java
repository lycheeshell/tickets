package edu.nju.tickets.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.nju.tickets.pojo.Manager;
import edu.nju.tickets.pojo.Venue;

public interface ManagerMapper {

	@Select("select count(*) from t_manager where account=#{0}")
	public int getManagerNumber(String account);
	
	@Insert("insert into t_manager values (default, #{account}, #{password})")
	public int addManager(Manager manager);
	
	@Select("select count(*) from t_manager where account=#{account} and password=#{password}")
	public int login(Manager manager);
	
	@Select("select * from t_venue where state!=1")
	public List<Venue> getVenues();

	@Update("update t_venue set state=1 where id=#{0}")
	public int agreeVenue(int id);

	@Delete("delete from t_venue where id=#{0}")
	public int deleteVenue(int id);
	
}
