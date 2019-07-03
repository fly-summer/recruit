package com.recruit.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.recruit.mapper.UserMapper;
import com.recruit.model.User;
import com.recruit.model.UserExample;
import com.recruit.model.UserExample.Criteria;

@Controller
//@RequestMapping("/user")
public class UserController {
	@Resource
	UserMapper userMapper;
	/**
	 * created by teemo 2018年9月6日
	 * 用户登录
	 * @return
	 */
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}
	@RequestMapping("doLogin.do")
	public String doLogin(HttpServletRequest request,ModelMap map, String username, String password, int type) {
		System.out.println(111);
		User user = new User(username, password, type);
		System.out.println("doLogin:"+user);
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(user.getUsername());
		criteria.andPasswordEqualTo(user.getPassword());
		criteria.andTypeEqualTo(user.getType());
		if (userMapper.selectByExample(example).size() != 1) {
			map.addAttribute("tips", "登录失败");
			return "login";
		}
		HttpSession session=request.getSession();
		session.setAttribute("user", user);
		return "index";
	}
	/**
	 * created by teemo 2018年9月10日
	 * 退出登录
	 * @param request
	 * @return
	 */
	@RequestMapping("doLogout")
	public String doLogout(HttpServletRequest request){
		HttpSession session =request.getSession();
		session.removeAttribute("user");
		return "login";
	}
	/**
	 * created by teemo 2018年9月6日
	 * 查询个人信息（账号、密码），下一步可以修改密码
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("userInfo")
	public String userInfo(HttpServletRequest request,ModelMap map){
		HttpSession session =request.getSession();
		User user=(User)session.getAttribute("user");
		System.out.println(user);
//		String username=user.getUsername();
//		String password=user.getPassword();
//		int type=user.getType();
		map.addAttribute("user", user);
		return "userInfo";
	}
	/**
	 * created by teemo 2018年9月6日
	 * 用户修改密码
	 * @param map
	 * @param user
	 * @return
	 */
	@RequestMapping("updateUserInfo")
	public String updateUserInfo(ModelMap map,User user){
		int  result=userMapper.updateByPrimaryKey(user);
		System.out.println(user);
		if(result==0){
			map.addAttribute("tips", "密码修改失败");
			return "userInfo";	
		}
		return "login";
	}
	/**
	 * created by teemo 2018年9月7日
	 * 查询所有user
	 * @param map
	 * @return
	 */
	@RequestMapping("userList")
	public String userList(ModelMap map){
		List<User> list=new ArrayList<User>();
		System.out.println("userList方法");
		list=userMapper.selectByExample(null);
		System.out.println(list.size());
		if(list.isEmpty()){
			map.addAttribute("tips", "未查到相关信息");
		}
		map.addAttribute("list", list);
		return "userList";
	}
}
