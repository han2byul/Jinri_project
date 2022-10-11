package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.WishVO;


public class WishDAO {
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 전체조회 
	public List<WishVO> selectList(String id) {
			
		List<WishVO> list;
		
		list = sqlSession.selectList("w.wish_list", id);
	
		return list;
	}
	
	// 취소
	public int delete(Map<String, String> map) {
		int res = sqlSession.delete("w.wish_delete", map);  // 잘 지워지면 1, 아니라면 0
		return res;
	}
}
