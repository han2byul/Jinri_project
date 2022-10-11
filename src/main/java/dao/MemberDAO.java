package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class MemberDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 회원가입 시 아이디 중복체크
	public MemberVO selectOne(String id) {

		MemberVO vo = sqlSession.selectOne("member.member_selectOne", id);

		return vo;
	}

	// 회원가입
	public int insert(String name, String id, String pwd, String email, String tel, String addr) {
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setAddr(addr);
		int res = sqlSession.insert("member.member_insert", vo);

		return res;
	}

	// 로그인
	public MemberVO select(MemberVO vo) {
		MemberVO baseVO = sqlSession.selectOne("member.id_check", vo);
		return baseVO;
	}
}
