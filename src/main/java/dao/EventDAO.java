package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.EventVO;

public class EventDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 행사 전체조회
	public List<EventVO> selectList(Map<String, Object> map) {

		List<EventVO> list;

		if (map.get("search_res").equals("all")) {
			list = sqlSession.selectList("e.event_list", map);
		} else {
			list = sqlSession.selectList("e.event_all", map);
		}

		return list;
	}

	public List<EventVO> selectAll(Map<String, Object> map) {

		List<EventVO> list = sqlSession.selectList("e.event_all", map);
		return list;
	}

	// 메인조회
	public List<EventVO> list_main() {

		List<EventVO> list = sqlSession.selectList("e.event_main");
		return list;
	}

	// 아이디 검색 조회
	public List<EventVO> selectTitle(Map<String, Object> map) {

		List<EventVO> list = sqlSession.selectList("e.event_title", map);
		return list;
	}

	// 제목 검색 조회
	public List<EventVO> selectContent(Map<String, Object> map) {
		List<EventVO> list = sqlSession.selectList("e.event_content", map);
		return list;
	}

	// 게시글 삭제
	public int delete(int idx) {
		int res = sqlSession.delete("e.event_delete", idx);
		return res;
	}

	// 새 글 쓰기
	public int insert(EventVO vo) {

		int res = sqlSession.insert("e.event_insert", vo);
		return res;

	}

	// 수정할 게시글 한건 검색
	public EventVO selectOne(int idx) {
		EventVO vo = sqlSession.selectOne("e.event_one", idx);
		return vo;
	}

	// 수정시작
	public int update(EventVO vo) {
		int res = sqlSession.update("e.event_update", vo);
		return res;
	}

	// 페이징
	public int getRowTotal(Map<String, Object> map) {
		int count;
		if (map.get("search_res").equals("all")) {
			count = sqlSession.selectOne("e.event_count", map);
		} else {
			count = sqlSession.selectOne("e.event_count_all", map);
		}

		return count;
	}

	public int getRowTotal_All(Map<String, Object> map) {
		int count = sqlSession.selectOne("e.event_count_all", map);
		return count;
	}

	public int getRowTotal_Title(Map<String, Object> map) {
		int count = sqlSession.selectOne("e.event_count_title", map);
		return count;
	}

	public int getRowTotal_Content(Map<String, Object> map) {
		int count = sqlSession.selectOne("e.event_count_content", map);
		return count;
	}

}
