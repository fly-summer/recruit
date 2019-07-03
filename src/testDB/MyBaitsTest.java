package testDB;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.recruit.mapper.RecruitMapper;
import com.recruit.mapper.UserMapper;
import com.recruit.model.Recruit;
import com.recruit.model.User;
import com.recruit.model.UserExample;
import com.recruit.model.UserExample.Criteria;
import com.recruit.test.RecruitController;



public class MyBaitsTest {
	public static void main(String[] args) {

//		SqlSession sqlsession = DBTools.getSession();
//		RecruitMapper recruitmapper = sqlsession.getMapper(RecruitMapper.class);
//		jXList(recruitmapper.selectByExample(null));
//		sqlsession.commit();
//		Recruit recruit = new Recruit();
//		recruit.setPosition("java工程师");
//		recruit.setSalsry(5000);
//		recruit.setNumber(5);
//		RecruitController a = new RecruitController();
//		a.selectiveRecruit(recruit);
		
//		User user = new User();
//		user.setUsername("xiaoming5");
//		user.setPassword("123");
//		user.setType(1);
		
		//全插入式
//		System.out.println(mapper.insert(user));
		//仅插入有的部分
		//System.out.println(mapper.insertSelective(user));
		
		//用用户名修改部分
		//System.out.println(mapper.updateByPrimaryKeySelective(user));
		
		//删除
		//mapper.deleteByPrimaryKey("2");
		
		
		
		//查询所有
		//jXList(mapper.selectByExample(null));
		
		
//		UserExample example = new UserExample();
//		
//		Criteria criteria = example.createCriteria();
//		criteria.andUsernameEqualTo("xiaoming");
//		criteria.andPasswordEqualTo("123456");
//		criteria.andTypeEqualTo(2);
//		//条件查询
//		//criteria.andUsernameEqualTo("xiaoming");
//		//根据type倒叙排序并抓取？？？没听懂
//		//example.setOrderByClause(" type desc limit 2,4 ");
//		
//		jXList(mapper.selectByExample(example));
		

		
	}

	private static void jXList(List<Recruit> list) {
		// TODO Auto-generated method stub
		
	}
}
