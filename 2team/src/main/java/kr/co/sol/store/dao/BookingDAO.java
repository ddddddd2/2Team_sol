package kr.co.sol.store.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingDAO {
public List<HashMap<String, Object>> getBooking();
}
