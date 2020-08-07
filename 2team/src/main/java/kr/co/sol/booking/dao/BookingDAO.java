package kr.co.sol.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.booking.dto.BookingDTO;

@Mapper
public interface BookingDAO {

	List<BookingDTO> getBookingList();

}
