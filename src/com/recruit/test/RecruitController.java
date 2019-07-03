package com.recruit.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.recruit.mapper.CompanyMapper;
import com.recruit.mapper.RecruitMapper;
import com.recruit.model.Recruit;
import com.recruit.model.RecruitExample;
import com.recruit.model.RecruitExample.Criteria;
import com.recruit.model.User;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
public class RecruitController {
	@Resource
	RecruitMapper recruitmapper;
	@Resource
	CompanyMapper companyMapper;

	/**
	 * 增加招聘信息
	 */
	@RequestMapping("addRecruit")
	public String addRecruit(HttpServletRequest request, Recruit recruit, ModelMap map) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		// 根据得到的公司用户名查询公司名称
		String name = companyMapper.selectByPrimaryKey(user.getUsername()).getName();
		recruit.setCname(user.getUsername());
		recruit.setRecruittime(new Date());
		try {
			recruitmapper.insertSelective(recruit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		map.addAttribute("name", name);
		map.addAttribute("recruit", recruit);
		return "recruitDetail";
	}

	/**
	 * 多个删除
	 * 
	 * @param id_arr
	 * @return
	 */

	@RequestMapping("deleteManyRecruit.do")
	@ResponseBody // 将返回结果写到response中
	public String deleteMany(@RequestParam("arr") String arr) {

		if (arr.equals("")) {
			return "error";
		}
		String[] strs = arr.split(",");
		if (strs.length == 0) {
			return "error";
		}
		int[] num = new int[strs.length];
		for (int i = 0; i < strs.length; i++) {
			num[i] = Integer.parseInt(strs[i]);
		}
		recruitmapper.deleteMany(num);
		return "success";
	}

	/**
	 * 部分更新
	 * 
	 * @param recruit
	 * @return
	 */
	@RequestMapping("updateRecruit")
	public String updateRecruit(Recruit recruit) {
		recruitmapper.updateByPrimaryKeySelective(recruit);
		return "index";
	}

	/**
	 * 查询本公司招聘信息（公司使用）
	 */
	@RequestMapping("selectRecruit")
	public String selectRecruit(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		RecruitExample example = new RecruitExample();
		Criteria criteria = example.createCriteria();
		// 根据公司用户名查询本公司发布的招聘信息
		criteria.andCnameEqualTo(user.getUsername());

		recruitmapper.selectByExample(example);
		return "index";
	}

	/**
	 * 查询所有招聘信息(页面数据呈现)
	 */
	@RequestMapping("selectAllRecruit.do")
	@ResponseBody // 将返回结果写到response中
	public String selectAllRecruit() {

		List<Recruit> list = new ArrayList<Recruit>();
		list = recruitmapper.selectByExample(null);
		for (int i = 0; i < list.size(); i++) {

			list.get(i).setCname(companyMapper.selectByPrimaryKey(list.get(i).getCname()).getName());
		}
		// 解决时间问题
		JsonConfig config = new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonObject = new JSONArray();
		jsonObject = jsonObject.fromObject(list, config);
		return jsonObject.toString();

	}

	/**
	 * 多条件查询(毕业生可用)
	 * 
	 * @param position
	 * @param start
	 * @param end
	 * @param number
	 * @param address
	 * @param degree
	 * @return
	 */
//  @RequestMapping(value = "selectiveRecruit.do",produces = "text/plain;charset=utf-8")
	@RequestMapping("selectiveRecruit.do")
	@ResponseBody // 将返回结果写到response中
	public String selectiveRecruit(int pageNumber, int pageSize, String position, int start, int end, int number,
			String address, String degree) {
		//System.out.println();
		RecruitExample example = new RecruitExample();
		Criteria criteria = example.createCriteria();
		// 设置求职意向
		if (position != null && position != "" && (!position.equals("不限"))) {
			criteria.andPositionEqualTo(position);
		}
		// 设置薪资范围
		if (end != 0) {
			criteria.andSalsryBetween(start, end);
		} else {
			criteria.andSalsryGreaterThanOrEqualTo(start);
		}
		// 设置招聘个数
		if (number != 0 && number != 100) {
			criteria.andNumberBetween(number, number + 10);
		} else {
			criteria.andNumberGreaterThan(number);
		}
		// 设置工作地点
		if (address != null && address != "") {
			criteria.andAddressEqualTo(address);
		}
		// 设置学历要求
		if (degree.equals("不限")) {

		} else {
			criteria.andDegreeEqualTo(degree);
		}
		List<Recruit> list = new ArrayList<Recruit>();
		// 招聘人数升序排序
		example.setOrderByClause("number ASC");
		list = recruitmapper.selectByExample(example);
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCname(companyMapper.selectByPrimaryKey(list.get(i).getCname()).getName());
		}
		// 解决时间问题
		JsonConfig config = new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonObject = JSONArray.fromObject(list, config);
		return jsonObject.toString();
	}

	/**
	 * 查询单个招聘信息（点击查看详细页）
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("goRecruitDetail")
	public String selectByID(int rid, ModelMap map) {
		Recruit recruit = recruitmapper.selectByPrimaryKey(rid);
		map.addAttribute("rid", recruit.getId());
		//将公司用户名转为公司名称
		String name = companyMapper.selectByPrimaryKey(recruit.getCname()).getName();
		map.addAttribute("name", name);
		//加入公司用户名，下个界面有大用！
		map.addAttribute("cname", recruit.getCname());
		map.addAttribute("position", recruit.getPosition());
		map.addAttribute("salsry", recruit.getSalsry());
		map.addAttribute("number", recruit.getNumber());
		map.addAttribute("recruitTime", recruit.getRecruittime());
		map.addAttribute("address", recruit.getAddress());
		map.addAttribute("degree", recruit.getDegree());
		map.addAttribute("inf", recruit.getInf());
		return "recruitDetail";

	}
	
	@RequestMapping("goRecruitDetail.do")
	public String goRecruitDetail(int rid, ModelMap map) {
		Recruit recruit = recruitmapper.selectByPrimaryKey(rid);
		map.addAttribute("rid", recruit.getId());
		//将公司用户名转为公司名称
		String name = companyMapper.selectByPrimaryKey(recruit.getCname()).getName();
		map.addAttribute("name", name);
		//加入公司用户名，下个界面有大用！
		map.addAttribute("cname", recruit.getCname());
		map.addAttribute("position", recruit.getPosition());
		map.addAttribute("salsry", recruit.getSalsry());
		map.addAttribute("number", recruit.getNumber());
		map.addAttribute("recruitTime", recruit.getRecruittime());
		map.addAttribute("address", recruit.getAddress());
		map.addAttribute("degree", recruit.getDegree());
		map.addAttribute("inf", recruit.getInf());
		return "recruitDetail";

	}
	
	@RequestMapping("recruitIndexList.do")
	@ResponseBody // 将返回结果写到response中
	public String recruitIndexList() {
		List<Recruit> list = new ArrayList<Recruit>();
		RecruitExample example = new RecruitExample();
		example.setOrderByClause("recruitTime desc, id desc limit 8");
		example.setDistinct(false);
		list = recruitmapper.selectByExample(example);
		if (list.size() == 0) {
			return "[]";
		}
//		JsonConfig config = new JsonConfig();
//		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
//		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonArray = new JSONArray();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for (Recruit recruit : list) {
			JSONObject item = new JSONObject();
			item.put("name", companyMapper.selectByPrimaryKey(recruit.getCname()).getName());
			item.put("recruitTime", sdf.format(recruit.getRecruittime()));
			item.put("salary", recruit.getSalsry());
			item.put("id", recruit.getId());
			item.put("position", recruit.getPosition());
			jsonArray.add(item);
		}
		return jsonArray.toString();
	}
}
