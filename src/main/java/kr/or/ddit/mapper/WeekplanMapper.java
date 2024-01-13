package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.WeekplanVO;

public interface WeekplanMapper {

	int weekplanCreatePost(WeekplanVO weekplanVO);

	List<WeekplanVO> weekplanList(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

	WeekplanVO weekplanDetail(Map<String, String> map);

	int weekplanUpdate(WeekplanVO weekplanVO);

	int weekplanDelete(WeekplanVO weekplanVO);

	String getLecName(String lecCd);

}
