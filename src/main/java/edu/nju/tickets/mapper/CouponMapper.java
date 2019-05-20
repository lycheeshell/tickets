package edu.nju.tickets.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.JdbcType;

import edu.nju.tickets.pojo.Coupon;

public interface CouponMapper {
	
	@Insert("insert into t_coupon values (default, #{0}, #{1}, date_sub(now(), interval -10 day) )")
	public int addCoupon(int userid, int amount);

	@Results(value={
		@Result(id=true,property="id",column="id"),
		@Result(property="user",column="user_id", one=@One(select ="edu.nju.tickets.mapper.UserMapper.selectById")),
    	@Result(property="amount",column="amount"),
    	@Result(property="endtime",column="endtime", jdbcType=JdbcType.TIMESTAMP)
    	})
	@Select("select * from t_coupon where user_id=#{0}")
	public List<Coupon> getCoupons(int userid);

}
