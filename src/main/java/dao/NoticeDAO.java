package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.NoticeVO;

public class NoticeDAO {
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 방명록 전체조회
	public List<NoticeVO> selectList(Map<String, Object> map) {

		List<NoticeVO> list;
		System.out.println("search1 : " + map.get("search"));
		if (map.get("search").equals("all")) {
			System.out.println("search2 : " + map.get("search"));
			list = sqlSession.selectList("n.notice_list", map);
		} else {
			list = sqlSession.selectList("n.notice_select", map);
		}

		return list;
	}

	// 메인조회
	public List<NoticeVO> list_main() {

		List<NoticeVO> list = sqlSession.selectList("n.notice_main");
		return list;
	}

	// 게시글 삭제
	public int delete(int idx) {
		int res = sqlSession.delete("n.notice_delete", idx); // 잘 지워지면 1, 아니라면 0
		return res;
	}

	// 새 글 쓰기
	public int insert(NoticeVO vo) {
		int res = sqlSession.insert("n.notice_insert", vo);
		return res;

	}

	// 상세보기를 위한 게시물 한 건 조회
	public NoticeVO selectOne(int idx) {

		NoticeVO vo = sqlSession.selectOne("n.notice_view", idx);
		return vo;

	}

	// 수정 시작
	public int update(NoticeVO vo) {
		int res = sqlSession.update("n.notice_update", vo);
		return res;
	}

	// 조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("n.update_readhit", idx);
		return res;
	}

	// 전체 게시물 수
	public int getRowTotal(Map<String, Object> map) { // 전체 행의 개수를 반환하는 메서드 생성
		int res;

		if (map.get("search").equals("all")) {
			res = sqlSession.selectOne("n.notice_count", map);
		} else {
			res = sqlSession.selectOne("n.notice_search_count", map);
		}

		return res;
	}

}
