package com.recruit.mapper;

import com.recruit.model.Company;
import com.recruit.model.CompanyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CompanyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int countByExample(CompanyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int deleteByExample(CompanyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int deleteByPrimaryKey(String cname);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int insert(Company record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int insertSelective(Company record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    List<Company> selectByExample(CompanyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    Company selectByPrimaryKey(String cname);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByExampleSelective(@Param("record") Company record, @Param("example") CompanyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByExample(@Param("record") Company record, @Param("example") CompanyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByPrimaryKeySelective(Company record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table company
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    int updateByPrimaryKey(Company record);
    int deleteManyCompany(String[] cname);
	int deleteCompanyByCname(String cname);
}