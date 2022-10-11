package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.CheckoutVO;

public class CheckoutDAO {
	SqlSession sqlSession;
		
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체조회 
	public List<CheckoutVO> selectList() {
			
		List<CheckoutVO> list;
		
		list = sqlSession.selectList("c.chkout_list");
	
		return list;
	}
	
	// 반납 연장 
	public int update(Map<String, String> map) {
		int res = sqlSession.update("c.chkout_update", map);
		return res;
	}
	
}
