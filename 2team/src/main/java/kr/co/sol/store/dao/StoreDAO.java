package kr.co.sol.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.sol.custom.dto.StoreDTO;

@Mapper
public interface StoreDAO {
	List<StoreDTO> getStoreList();

	List<StoreDTO> getStore(String searchOption, String keyword);
}
