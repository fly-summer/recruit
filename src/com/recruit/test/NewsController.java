package com.recruit.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.recruit.mapper.NewsMapper;
import com.recruit.model.News;
import com.recruit.model.NewsExample;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@Controller
public class NewsController {
	@Resource
	NewsMapper newsMapper;
	private News ne;

	/**
	 * created by teemo 2018年9月6日 添加news
	 * 
	 * @return
	 */
	@RequestMapping("addNews")
	public String addNews() {
		return "addNews";
	}

	@RequestMapping("getIndexNewsList.do")
	@ResponseBody
	public String getIndexNewsList(ModelMap map) {
		List<News> list = new ArrayList<News>();
		NewsExample example = new NewsExample(); 
		example.setOrderByClause("newsTime desc, id desc limit 8");
		example.setDistinct(false);
		list = newsMapper.selectByExample(example);
		if (list.size() == 0) {
			return "[]";
		}
		JsonConfig config = new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonArray = JSONArray.fromObject(list, config);
		return jsonArray.toString();
	}
	
	
	@RequestMapping("doAddNews")
	public String doAddNews(String title, String content/* ,ModelMap map */) {
		News news = new News(title, content, new Date());
		System.out.println(news);
		int result = newsMapper.insert(news);
		System.out.println("result:" + result);
		if (result == 0) {
//			map.addAttribute("tips", "news插入失败了");
			return "addNews";
		}
		return "newsList";
	}

	/**
	 * created by teemo 2018年9月6日 查询所有news
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("newsList")
	public String newsList(ModelMap map) {
		List<News> list = new ArrayList<News>();
		list = newsMapper.selectByExample(null);
		System.out.println(list.size());
		if (list.size() == 0) {
			map.addAttribute("tips", "未查到news");
		}
		map.addAttribute("list", list);
		return "newsList";
	}

	@RequestMapping("getNewsList.do")
	@ResponseBody
	public String getNewsList(ModelMap map) {
		List<News> list = new ArrayList<News>();
		list = newsMapper.selectByExample(null);
		if (list.size() == 0) {
			return "[]";
		}
		JsonConfig config = new JsonConfig();
		JsonDateValueProcessor jsonValueProcessor = new JsonDateValueProcessor();
		config.registerJsonValueProcessor(Date.class, jsonValueProcessor);
		JSONArray jsonArray = JSONArray.fromObject(list, config);
		return jsonArray.toString();
	}

	@RequestMapping("getNewsById.do")
	public String getNewsById(ModelMap map, int rowId) {
		News ne = newsMapper.selectByPrimaryKey(rowId);
		map.addAttribute("id", ne.getId());
		map.addAttribute("title", ne.getTitle());
		map.addAttribute("content", ne.getContent());
		map.addAttribute("time", ne.getNewstime());
		return "newsDetail";
	}

	/**
	 * created by teemo 2018年9月6日 根据主键id删除news
	 * 
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteNews")
	public String deleteNews(ModelMap map, int id) {
		System.out.println("id" + id);
		int result = newsMapper.deleteByPrimaryKey(id);
		if (result == 0) {
			map.addAttribute("tips", "news删除出问题了");
		}
		return "newsList";
	}

	/**
	 * created by teemo 2018年9月6日 更新news的界面，准备更新news
	 * 
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("updateNews")
	public String updateNews(ModelMap map, int id) {
		News news = newsMapper.selectByPrimaryKey(id);
		System.out.println(news);
		if (news == null) {
			map.addAttribute("tips", "查询news出现错误！");
			return "newsList";
		}
		map.addAttribute("news", news);
		return "updateNews";
	}

	/**
	 * created by teemo 2018年9月6日 更新news操作
	 * 
	 * @param map
	 * @param news
	 * @return
	 */
	@RequestMapping("doUpdateNews")
	public String doUpdateNews(ModelMap map, News news) {
		System.out.println(news);
		int result = newsMapper.updateByPrimaryKey(news);
		if (result == 0) {
			map.addAttribute("tips", "news更新失败");
			return "updateNews";
		}
		return "newsList";
	}

	/**
	 * created by teemo 2018年9月9日 批量删除news
	 * 
	 * @param map
	 * @param id
	 * @return
	 */
	@RequestMapping("deleteManyNews")
	public String deleteManyNews(ModelMap map, int[] id) {
		System.out.println(id);
		if (id == null) {
			return "newsList";
		}
		int result = 0;
		try {
			result = newsMapper.deleteManyNews(id);
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (result == 0) {
			map.addAttribute("tips", "未删除任何内容或者出现了些问题");
		}
		return "newsList";
	}
}
