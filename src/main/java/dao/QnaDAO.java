package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 조회
	public List<QnaVO> selectList(Map<String, Object> map) {

		List<QnaVO> list;

		if (map.get("search_res").equals("all")) {
			list = sqlSession.selectList("q.qnalist", map);
		} else {
			list = sqlSession.selectList("q.qna_list", map);
		}

		return list;

	}

	// 메인조회
	public List<QnaVO> list_main() {

		List<QnaVO> list = sqlSession.selectList("q.qna_main");
		return list;
	}

	// 제목검색
	public List<QnaVO> selectTitle(Map<String, Object> map) {

		List<QnaVO> list = sqlSession.selectList("q.qna_title", map);
		return list;

	}

	// 아이디 검색

	public List<QnaVO> selectID(Map<String, Object> map) {

		System.out.println(map.get("search_res"));
		List<QnaVO> list = sqlSession.selectList("q.qna_id", map);
		return list;

	}

	// 새글 추가하기
	public int insert(QnaVO vo) {
		int res = sqlSession.insert("q.qna_insert", vo);
		return res;
	}

	// 상세보기를 위한 게시물 한건 조회
	public QnaVO selectOne(int idx) {
		QnaVO vo = sqlSession.selectOne("q.qna_one", idx);
		return vo;
	}
	// 글 삭제

	public int delete(QnaVO vo) {
		int res = sqlSession.update("q.qna_del_update", vo);
		return res;
	}

	// 수정 시작
	public int update(QnaVO vo) {
		int res = sqlSession.update("q.qna_update", vo);
		return res;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("q.qna_update_readhit", idx);
		return res;
	}

	// 댓글작성을 위한 step값 증가
	public int update_step(QnaVO vo) {

		int res = sqlSession.update("q.qna_update_step", vo);
		return res;

	}

	// 댓글작성
	public int reply(QnaVO vo) {
		int res = sqlSession.insert("q.qna_reply", vo);
		return res;
	}

	// 페이징
	public int getRowTotal(Map<String, Object> map) {

		int res = 0;

		if (map.get("search_res").equals("all")) {
			res = sqlSession.selectOne("q.qna_count");
		} else {
			if (map.get("search").equals("all")) {
				res = sqlSession.selectOne("q.qna_all", map);
				System.out.println(res);
			} else if (map.get("search").equals("id")) {
				res = sqlSession.selectOne("q.qna_count_id", map);
				System.out.println(res);
			} else if (map.get("search").equals("title")) {
				res = sqlSession.selectOne("q.qna_count_title", map);
				System.out.println(res);
			}

		}

		return res;
	}

	public int getRowTotal_id(Map<String, Object> map) {

		int res;

		res = sqlSession.selectOne("q.qna_count_id", map);

		return res;
	}

	public int getRowTotal_title(Map<String, Object> map) {

		int res;

		res = sqlSession.selectOne("q.qna_count_title", map);

		return res;
	}

}