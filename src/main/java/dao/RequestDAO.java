package dao;

import org.apache.ibatis.session.SqlSession;

import vo.RequestVO;

public class RequestDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(RequestVO vo) {

		int res = sqlSession.insert("r.request_insert", vo);
		return res;
	}
}
