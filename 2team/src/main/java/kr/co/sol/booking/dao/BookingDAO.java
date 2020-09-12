package kr.co.sol.booking.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.common.dto.BookingDTO;

@Mapper
public interface BookingDAO {
	int bookingProc(BookingDTO bdto);
}
