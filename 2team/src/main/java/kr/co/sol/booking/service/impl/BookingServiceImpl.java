package kr.co.sol.booking.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.sol.booking.dao.BookingDAO;
import kr.co.sol.booking.service.BookingService;
import kr.co.sol.common.dto.BookingDTO;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	BookingDAO bookingDao;
	
	@Override
	public int bookingProc(BookingDTO bdto) {
		// TODO Auto-generated method stub
		return bookingDao.bookingProc(bdto);
	}

}
