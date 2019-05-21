package edu.nju.tickets.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.type.JdbcType;

import edu.nju.tickets.pojo.Order;

public interface OrderMapper {
	
	@Insert("insert into t_order values (default, #{0}, #{1}, #{2}, #{3}, #{4}, #{5}, now(), null, 4 )")
	public int addOrder(int userid, int showid, int couponid, String seat, int amount, int price);
	
	@Insert("insert into t_order values (default, #{0}, #{1}, null, #{3}, #{4}, #{5}, now(), null, 4 )")
	public int addOrderwithoutCoupon(int userid, int showid, int couponid, String seat, int amount, int price);

	@Results(value={
			@Result(id=true,property="id",column="id"),
			@Result(property="show",column="show_id", one=@One(select ="edu.nju.tickets.mapper.ShowMapper.getShowById")),
			@Result(property="seat",column="seat"),
	    	@Result(property="amount",column="amount", jdbcType=JdbcType.TIMESTAMP),
	    	@Result(property="price",column="price")
	    	})
	@Select("select * from t_order where user_id=#{0} and show_id=#{1} and state=4")
	public List<Order> getUnpayedOrders(int id, int showid);

	@Update("update t_order set state=1, paytime=now() where id=#{0} and state=4")
	public int updateOrderPay(int orderid);

}
