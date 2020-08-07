package kr.co.sol.booking.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.sol.booking.dto.BookingDTO;
import kr.co.sol.booking.service.BookingService;

@Controller
public class BookingController {
	@Autowired
	BookingService bookingService;
	
	@RequestMapping("/admin/booking")
	public String bookingManage(Model model) {
		List<BookingDTO> bdto2 = bookingService.getBookingList();
		System.out.println(bdto2);
		model.addAttribute("bdto", bdto2);
		return "/admin/booking";
		
	}
}
