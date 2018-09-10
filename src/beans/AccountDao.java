package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AccountDao {
	SqlSessionFactory factor;
	
	public AccountDao() throws IOException{
		SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factor = sfb.build(is);
	}
	
	public int addNewMember(Map p) { // 회원가입 시 회원정보 저장하기.
		SqlSession sql = factor.openSession();
		try {
			int r = sql.insert("account.addNewMember",p);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Map> getmember(String id) { // 멤버 정보 가져오기
		SqlSession sql = factor.openSession();
		try {
			List<Map> member = sql.selectList("account.getMemberFile",id);
			return member;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean updatePassword(Map p) { // 패스 워드 변경 시 사용할 메서드
		SqlSession sql = factor.openSession();
		try {
			int b = sql.update("account.updatePassword",p);
			boolean check;
			if(b>0) {
				check = true;
				sql.commit();
			}else {
				check = false;
			}
			return check;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean selectId(String id) { // 아이디 중복확인을 위한 메서드
		SqlSession sql = factor.openSession();
		try {
			String selId = sql.selectOne("account.getMemberId",id);
			if(selId==null) {
				return true;
			}else {
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
}
