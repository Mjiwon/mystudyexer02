package beans;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class LoginDao {
	SqlSessionFactory factory;
	
	public LoginDao() throws IOException{
		SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
		InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
		factory = sfb.build(is);
	}
	
	public int addLogingMember(String id) {
		SqlSession sql = factory.openSession();
		Map m = new HashMap();
		m.put("actor", id);
		m.put("time", new Date(System.currentTimeMillis()));
		try {
			int r = sql.insert("login.addLoginMember", m);
			if(r==1) {
				sql.commit();
			}
			return r;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map> selLogData(String id){
		SqlSession sql = factory.openSession();
		try {
			List<Map> list = sql.selectList("login.selectLogData",id);
			
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
