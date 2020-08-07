package kr.co.sol.booking.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.sol.booking.dao.BookingDAO;
import kr.co.sol.booking.dto.BookingDTO;
import kr.co.sol.booking.service.BookingService;

@Service("BookingService")
public class BookingServiceImpl implements BookingService {
	@Autowired
	BookingDAO bookingDao;
	
	@Override
	public List<BookingDTO> getBookingList() {
		return bookingDao.getBookingList();
	}


}
