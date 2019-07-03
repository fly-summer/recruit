package com.recruit.mapper;

import com.recruit.model.Request;
import com.recruit.model.RequestExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RequestMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int countByExample(RequestExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int deleteByExample(RequestExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int insert(Request record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int insertSelective(Request record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    List<Request> selectByExample(RequestExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    Request selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByExampleSelective(@Param("record") Request record, @Param("example") RequestExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByExample(@Param("record") Request record, @Param("example") RequestExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByPrimaryKeySelective(Request record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table request
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByPrimaryKey(Request record);
    int deleteManyRequest(int[] id);
    List<Request>selectRequestByStudent(String sname);
    List<Request>selectRequestByCompany(String cname);
    int countRequestByStudent(String sname);
    int countRequestByCompany(String cname);
    int deleteRequestBySname(String sname);
}