package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.ReviewVO;

public class ReviewDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 조회
	public List<ReviewVO> selectList(Map<String, Object> map) {

		List<ReviewVO> list;

		if (map.get("search").equals("all")) {
			list = sqlSession.selectList("r.review_list", map);
		} else {
			list = sqlSession.selectList("r.review_search", map);
		}
		return list;
	}

	// 상세보기를 위한 게시물 한 건 조회
	public ReviewVO selectOne(int idx) {

		ReviewVO vo = sqlSession.selectOne("r.review_one", idx);
		return vo;
	}

	// 새글 추가
	public int insert(ReviewVO vo) {
		int res = sqlSession.insert("r.review_insert", vo);
		return res;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("r.update_readhit", idx);
		return res;
	}

	// 내용 수정하기
	public int update(ReviewVO vo) {
		int res = sqlSession.update("r.review_update", vo);
		return res;
	}

	// 게시글 삭제
	public int delete(int idx) {
		// idx는 파라미터 값이다.
		int res = sqlSession.update("r.review_delete", idx);
		return res;
	}

	// 전체 게시물 수 조회
	public int getRowTotal(Map<String, Object> map) {

		int res;
		if (map.get("search").equals("all")) {
			res = sqlSession.selectOne("r.review_count", map);
		} else {
			res = sqlSession.selectOne("r.review_s_count", map);
		}

		return res;
	}

	// 월별 게시물 수 조회
	public int monthCount(int months) {

		String month = null;

		if (months < 10) {
			month = "0" + months;
		} else {
			month = String.valueOf(months);
		}

		int res = sqlSession.selectOne("r.monthCount", month);

		return res;
	}

}
