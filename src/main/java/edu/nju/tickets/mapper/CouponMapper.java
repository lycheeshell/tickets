package edu.nju.tickets.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import edu.nju.tickets.pojo.Coupon;

public interface CouponMapper {
	
	@Insert("insert into t_coupon values (default, #{0}, #{1}, date_sub(now(), interval -10 day), 1 )")
	public int addCoupon(int userid, int amount);

	@Results(value={
		@Result(id=true,property="id",column="id"),
    	@Result(property="amount",column="amount"),
    	@Result(property="endtime",column="endtime", jdbcType=JdbcType.TIMESTAMP)
    	})
	@Select("select * from t_coupon where user_id=#{0} and state=1 order by amount desc")
	public List<Coupon> getCoupons(int userid);

	@Update("update t_coupon set state = 0 where id = #{0}")
	public int updateCouponState(int couponid);

}
