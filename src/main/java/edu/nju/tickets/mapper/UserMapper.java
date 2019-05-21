package edu.nju.tickets.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import edu.nju.tickets.pojo.User;

public interface UserMapper {
	
	@Select("select * from t_user where id=#{0}")
	public User selectById(int id);
	
	@Select("select count(*) from t_user where account=#{0}")
	public int getUserNumber(String account);
	
	@Select("select count(*) from t_user where account=#{0} and state=2")
	public int getInactiveUserNumber(String account);
	
	@Update("update t_user set email=#{email}, password=#{password} where account=#{account}")
	public int updateRegisterUser(User user);
	
	@Insert("insert into t_user values (default, #{account}, #{email}, #{password}, null, 0, 0, 1, 2)")
	public int addUser(User user);
	
	@Update("update t_user set state=1 where account=#{0}")
	public int confirmEmail(String account);
	
	@Select("select * from t_user where account=#{account} and password=#{password} and state=1")
	public User login(User user);
	
	@Select("select * from t_user where id=#{0}")
	public User getUserInfo(int id);

	@Update("update t_user set password=#{password}, name=#{name},email=#{email} where id=#{id} and account=#{account}")
	public int modifyUser(User user);

	@Update("update t_user set state=0 where id=#{0}")
	public int dropUser(int id);

	@Update("update t_user set money=money+#{1} where id=#{0}")
	public int addMoney(int id, int moneyToAdd);

	@Update("update t_user set score=score-#{1}*100 where id=#{0}")
	public int updateUserScore(int id, int coupon);

	@Select("select money from t_user where id=#{0}")
	public int getUserMoney(int userid);

	@Update("update t_user set money=#{1} where id=#{0}")
	public int updateMoney(int userid, int newMoney);
	
	
	
	
	
//    @Results(value={
//    		@Result(id=true,property="id",column="id"),
//    		@Result(property="account",column="user_name"),
//    		@Result(property="password",column="password"),
//    		@Result(property="age",column="age")
//    		})
//    @Select("select * from user_t where id=#{0}")
//    public User selectByPrimaryKey(int id);

}