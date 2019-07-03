package com.recruit.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recruit.mapper.CompanyMapper;
import com.recruit.mapper.UserMapper;
import com.recruit.model.Company;
import com.recruit.model.User;

@Controller
public class CompanyController {
	@Resource
	CompanyMapper companyMapper;
	@Resource
	UserMapper userMapper;

	/**
	 * created by teemo 2018年9月6日 公司注册
	 * 
	 * @return
	 */
	@RequestMapping("companyReg.do")
	public String companyReg() {
		return "companyReg";
	}

	@RequestMapping("doCompanyRegister.do")
	public String doCompanyRegister(ModelMap map, User user, Company company) {
		user.setUsername(company.getCname());
		user.setType(2);
		System.out.println(user);
		int res = userMapper.insert(user);
		System.out.println("res:" + res);
		if (res == 0) {
			map.addAttribute("tips", "注册表中写入失败");
			return "companyReg";
		}
//		Company company=new Company(cname,name,tel,address,detail);
		int result = companyMapper.insert(company);
		System.out.println("result:" + result);
		if (result == 0) {
			map.addAttribute("tips", "公司表中写入失败");
			userMapper.deleteByPrimaryKey(user.getUsername());
			return "companyReg";
		}
		map.addAttribute("tips", "注册成功");
		return "index";
	}

	/**
	 * created by teemo 2018年9月6日 查询公司信息，进一步可修改
	 * 
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("companyInfo")
	public String companyInfo(HttpServletRequest request, ModelMap map) {
		User user = (User) request.getSession().getAttribute("user");
		System.out.println(user);
		Company company = companyMapper.selectByPrimaryKey(user.getUsername());
		System.out.println(company);
		if (company == null) {
			map.addAttribute("tips", "糟糕，出了点问题");
			return "login";
		}
		map.addAttribute("company", company);
		return "companyInfo";
	}

	/**
	 * created by teemo 2018年9月6日 更新公司信息
	 * 
	 * @param company
	 * @param map
	 * @return
	 */
	@RequestMapping("updateCompanyInfo")
	public String updateCompanyInfo(HttpServletRequest request, Company company, User user, ModelMap map) {
		System.out.println(company);
		user.setUsername(company.getCname());
		user.setType(2);
		System.out.println(user);
		int res = userMapper.updateByPrimaryKey(user);
		if (res == 0) {
			map.addAttribute("tips", "用户信息修改失败，请重试");
		}
		int result = companyMapper.updateByPrimaryKey(company);
		if (result == 0) {
			map.addAttribute("tips", "企业信息修改失败，请重试");
		}
		request.getSession().removeAttribute("user");
		return "login";
	}

	@ResponseBody
	@RequestMapping("checkCompanyPasswd")
	public String checkCompanyPasswd(HttpServletRequest request, Company company, User user, ModelMap map) {
		String passwd1 = request.getParameter("password1");
		User usr = userMapper.selectByPrimaryKey(company.getCname());
		System.out.println("原密码:"+passwd1);
		if (usr.getPassword().equals(passwd1)) {
				return "0";
		}
		return "1";
	}

	/**
	 * created by teemo 2018年9月9日 查询全部公司信息
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("companyList")
	public String companyList(ModelMap map) {
		List<Company> list = new ArrayList<Company>();
		System.out.println("companyList");
		list = companyMapper.selectByExample(null);
		if (list.size() == 0) {
			map.addAttribute("tips", "未查询到相关数据");
		}
		map.addAttribute("list", list);
		return "companyList";
	}

	/**
	 * created by teemo 2018年9月9日 根据公司名删除公司
	 * 
	 * @param map
	 * @param cname
	 * @return
	 */
	@RequestMapping("deleteCompanyByCname")
	public String deleteCompanyByCname(ModelMap map, String cname) {
		int result = 0;
		try {
			result = userMapper.deleteByPrimaryKey(cname);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result == 0) {
			map.addAttribute("tips", "删除失败，请重试！");
		}
		return "companyList";
	}
}
