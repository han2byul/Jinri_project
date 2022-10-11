package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.SearchVO;

public class SearchDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 검색하기
	public List<SearchVO> selectList(Map<String, Object> map) {

		List<SearchVO> list;

		list = sqlSession.selectList("s.search_book", map);

		return list;
	}

	// 검색한 게시물 수 조회
	public int getRowTotal(Map<String, Object> map) {

		int res;

		res = sqlSession.selectOne("s.search_count", map);

		return res;
	}

	// 찜하기 추가
	public int wish(SearchVO vo) {
		int res = sqlSession.insert("s.wish_insert", vo);
		return res;
	}
}
