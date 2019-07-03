package com.recruit.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.recruit.mapper.CompanyMapper;
import com.recruit.mapper.RecruitMapper;
import com.recruit.mapper.RequestMapper;
import com.recruit.mapper.StudentMapper;
import com.recruit.model.Company;
import com.recruit.model.Recruit;
import com.recruit.model.Request;
import com.recruit.model.Student;
import com.recruit.model.User;

import net.sf.json.JSONArray;

@Controller
public class RequestController {
	@Resource
	RequestMapper requestMapper;
	@Resource
	StudentMapper studentMapper;
	@Resource
	CompanyMapper companyMapper;
	@Resource
	RecruitMapper recruitMapper;

	@RequestMapping("addRequest")
	@ResponseBody // 将返回结果写到response中
	public String addRequest(ModelMap map, int rid, String cname, HttpServletRequest req) {

		String sname = ((User) req.getSession().getAttribute("user")).getUsername();
		Request request = new Request(rid, cname, sname);
		System.out.println("rid:" + rid);
		int result = 0;
		try {
			result = requestMapper.insert(request);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result == 0) {
			map.addAttribute("tips", "申请过程中出现了问题，请重试！");
		}
		return "success";
	}

	/*
	 * created by teemo 2018年9月9日 查询所有申请表
	 */
	@RequestMapping("requestList")
	public String requestList(ModelMap map) {
		List<Request> list = new ArrayList<Request>();
		try {
			list = requestMapper.selectByExample(null);
			if (list.isEmpty()) {
				map.addAttribute("tips", "未查询到任何数据！");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		map.addAttribute("list", list);
		// 查询公司、学生用户名对应的名称
		List<String> companyNameList = new ArrayList<String>();
		List<String> studentNameList = new ArrayList<String>();
		for (int i = 0; i < list.size(); i++) {
			try {
				companyNameList.add(companyMapper.selectByPrimaryKey(list.get(i).getCname()).getName());
				studentNameList.add(studentMapper.selectByPrimaryKey(list.get(i).getSname()).getName());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("companyNameList.size:" + companyNameList.size());
		System.out.println("studentNameList.size:" + studentNameList.size());
		map.addAttribute("companyNameList", companyNameList);
		map.addAttribute("studentNameList", studentNameList);
		return "requestList";
	}

	/**
	 * created by teemo 2018年9月9日 查询某一个学生的request
	 * 
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping("selectRequestByStudent")
	@ResponseBody
	public String selectRequestByStudent(ModelMap map, HttpSession session) {
		List<Request> list = new ArrayList<Request>();
		String sname = ((User) session.getAttribute("user")).getUsername();
		try {
			list = requestMapper.selectRequestByStudent(sname);
			if (list.isEmpty()) {
				map.addAttribute("tips", "未查询到相关数据");
				return "selectRequestByStudent";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		// 查询公司用户名对应的名称 && 查询招聘信息表
		List<Company> companyList = new ArrayList<Company>();
		List<Recruit> recruitList = new ArrayList<Recruit>();
		for (Request req : list) {
			try {
				companyList.add(companyMapper.selectByPrimaryKey(req.getCname()));
				recruitList.add(recruitMapper.selectByPrimaryKey(req.getRecruitid()));
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

		JSONArray jsonObject = new JSONArray();
		for (int i = 0; i < list.size(); i++) {
			JSONObject item = new JSONObject();
			item.put("name", companyList.get(i).getName());

			item.put("id", recruitList.get(i).getId());
			item.put("position", recruitList.get(i).getPosition());
			item.put("degree", recruitList.get(i).getDegree());
			item.put("salary", recruitList.get(i).getSalsry());
			item.put("num", recruitList.get(i).getNumber());
			item.put("address", recruitList.get(i).getAddress());
			jsonObject.add(item);
		}
		System.out.println("jsonObject|Stu|recruitList:" + jsonObject.toString());
		return jsonObject.toString();
	}

	/**
	 * created by teemo 2018年9月9日 查询某个公司的申请表
	 * 
	 * @param map
	 * @param cname
	 * @return
	 */
	@RequestMapping("selectRequestByCompany")
	@ResponseBody
	public String selectRequestByCompany(ModelMap map, HttpServletRequest request) {
		List<Request> list = new ArrayList<Request>();// 申請list
		String cname = ((User) request.getSession().getAttribute("user")).getUsername();
		try {
			list = requestMapper.selectRequestByCompany(cname);// 查到的申請
			if (list.isEmpty()) {
				map.addAttribute("tips", "未查询到相关数据");
				return "requestList";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		// 查询对应用户名的学生
		List<Student> studentList = new ArrayList<Student>();
		List<Recruit> recruitList = new ArrayList<Recruit>();
		for (int i = 0; i < list.size(); i++) {
			try {
				studentList.add(studentMapper.selectByPrimaryKey(list.get(i).getSname()));// 學生的信息
				recruitList.add(recruitMapper.selectByPrimaryKey(list.get(i).getRecruitid()));// 招聘表的信息
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		JSONArray jsonObject = new JSONArray();

		for (int i = 0; i < list.size(); i++) {
			JSONObject item = new JSONObject();
			Map<String, String> mmap = new HashMap<String, String>();
			mmap.put("name", studentList.get(i).getName());
			mmap.put("sex", studentList.get(i).getSex());
			mmap.put("degree", studentList.get(i).getDegree());
			mmap.put("position", recruitList.get(i).getPosition());
			item.putAll(mmap);
			jsonObject.add(item);
		}
		return jsonObject.toString();
	}

	/**
	 * created by teemo 2018年9月9日 批量删除request
	 * 
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteManyRequest")
	public String deleteManyRequest(ModelMap map, int[] id) {
		System.out.println(id);
		if (id == null) {
			map.addAttribute("tips", "请重试，有问题了");
			return "requestList";
		}
		int result = 0;
		try {
			result = requestMapper.deleteManyRequest(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result == 0) {
			map.addAttribute("tips", "未删除任何内容或者出现了些问题");
		}
		return "requestList";
	}
}
