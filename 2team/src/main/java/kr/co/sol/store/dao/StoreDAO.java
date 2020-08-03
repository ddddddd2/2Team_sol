package kr.co.sol.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.sol.store.dto.StoreDTO;

@Mapper
public interface StoreDAO {

	List<StoreDTO> getStore();

	List<StoreDTO> getStoreList(String searchOption, String keyword);

}
