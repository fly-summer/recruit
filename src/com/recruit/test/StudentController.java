package com.recruit.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.mapper.RequestMapper;
import com.recruit.mapper.StudentMapper;
import com.recruit.mapper.UserMapper;
import com.recruit.model.Student;
import com.recruit.model.User;

@Controller
public class StudentController {
	@Resource
	UserMapper userMapper;
	@Resource
	StudentMapper studentMapper;
	@Resource
	RequestMapper requestMapper;

	
	/**
	 * created by teemo 2018年9月6日
	 * 学生注册账号
	 * @return
	 */
	@RequestMapping("graduateReg.do")
	public String graduateReg(){
		return "graduateReg";
	}
	@RequestMapping("doGraduateReg.do")
	public String  doGraduateReg(ModelMap map,User user,Student student){
		System.out.println(111);
		user.setUsername(student.getSname());
		user.setType(1);
		System.out.println(user);
		int res=userMapper.insert(user);
		System.out.println("res:"+res);
		if(res==0){
			map.addAttribute("tips", "注册表中写入失败");
			return "graduateReg";
		}
//		Student student = new Student(sname,name,sex,birth,tel,email,degree,position,status,experience);
		int result=studentMapper.insert(student);
		System.out.println("result:"+result);
		if(result==0){
			map.addAttribute("tips", "学生表中写入失败");
			userMapper.deleteByPrimaryKey(user.getUsername());
			return "graduateReg";
		}
		map.addAttribute("tips", "注册成功");
		return "login";
	}
	/**
	 * created by teemo 2018年9月6日
	 * 查询学生个人信息，接下来可以修改
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("stuPersonalInfo")
	public String stuPersonalInfo(HttpServletRequest request,ModelMap map){
		User user = (User)request.getSession().getAttribute("user");
		System.out.println(user);
		Student student =studentMapper.selectByPrimaryKey(user.getUsername());
		if(student==null){
			map.addAttribute("tips", "糟糕，出了点问题");
			return "login";
		}
		map.addAttribute("student", student);
		return "stuPersonalInfo";
	}
	/**
	 * created by teemo 2018年9月6日
	 * 更新学生个人信息
	 * @param student
	 * @param map
	 * @return
	 */
	@RequestMapping("updateStudentInfo")
	public String updateStudentInfo(HttpServletRequest request,Student student,User user,ModelMap map){
		user.setUsername(student.getSname());
		user.setType(1);
		int result=studentMapper.updateByPrimaryKeySelective(student);
		int result2=userMapper.updateByPrimaryKeySelective(user);
		if(result==0||result2==0){
			map.addAttribute("tips", "信息修改失败，请重试");
		}
		request.getSession().removeAttribute("user");
		return "login";
	}
	/**
	 * created by teemo 2018年9月9日
	 * 查询所有学生
	 * @param map
	 * @return
	 */
	@RequestMapping("studentList")
	public String studentList(ModelMap map){
		List<Student> list=new ArrayList<Student>();
		System.out.print("studentList:");
		list=studentMapper.selectByExample(null);
		System.out.println("list.size:"+list.size());
		if(list.size()==0){
			map.addAttribute("tips", "未查到相关信息");
		}
		map.addAttribute("list", list);
		return "studentList";
	}
	/**
	 * created by teemo 2018年9月9日
	 * 根据学生用户名删除学生
	 * @param map
	 * @param sname
	 * @return
	 */
	@RequestMapping("deleteStudentBySname")
	@Transactional				//sql异常则回滚
	public String deleteStudentBySname(ModelMap map,String sname){
		int result=0;
		try{
			result=userMapper.deleteByPrimaryKey(sname);
		}catch (Exception e) {
			// TODO: handle exception
		}
		if(result==0){
			map.addAttribute("tips", "删除失败，请重试！");
		}
		return "studentList";
	}
	
//	public String deleteStudentBySname(ModelMap map,String sname){
//		int result=0;
//		int res=0;
//		try{
//			int requestCount=requestMapper.countRequestByStudent(sname);
//			if(requestCount!=0){
//				requestMapper.deleteRequestBySname(sname);
//			}
//			result=studentMapper.deleteByPrimaryKey(sname);
//			res=userMapper.deleteByPrimaryKey(sname);
//		}catch (Exception e) {
//			// TODO: handle exception
//		}
//		if(result==0||res==0){
//			map.addAttribute("tips", "删除失败！	");
//		}
//		return "studentList";
//	}
}
