package kr.co.sol.admin;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import kr.co.sol.custom.dto.MemberDTO;
import kr.co.sol.custom.dto.RestaurantDTO;

@Mapper
public interface AdminDAO {

	List<HashMap<String, Object>> getMember();
	List<RestaurantDTO> getStoreList();
	List<RestaurantDTO> getStore(String searchOption, String keyword);
	List<HashMap<String, Object>> getMemberList(@Param("searchOption") String searchOption,	@Param("keyword") String keyword);
	MemberDTO login(String id, String passwd);
	String login2(MemberDTO mdto);
	MemberDTO loginPro(MemberDTO mdto);
}
