package com.recruit.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Student {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.sname
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String sname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.name
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.sex
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.birth
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.tel
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String tel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.email
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.degree
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String degree;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.position
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String position;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.experience
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String experience;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column student.status
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    private String status;
	/**
	 * created by teemo 2018��9��6��
	 * @param sname
	 * @param name
	 * @param sex
	 * @param birth
	 * @param tel
	 * @param email
	 * @param degree
	 * @param position
	 * @param experience
	 * @param status
	 */
    public Student(String sname, String name, String sex, Date birth, String tel, String email, String degree,
			String position, String experience, String status) {
		super();
		this.sname = sname;
		this.name = name;
		this.sex = sex;
		this.birth = birth;
		this.tel = tel;
		this.email = email;
		this.degree = degree;
		this.position = position;
		this.experience = experience;
		this.status = status;
	}
	public Student() {
		super();
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.sname
     *
     * @return the value of student.sname
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getSname() {
        return sname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.sname
     *
     * @param sname the value for student.sname
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setSname(String sname) {
        this.sname = sname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.name
     *
     * @return the value of student.name
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.name
     *
     * @param name the value for student.name
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.sex
     *
     * @return the value of student.sex
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.sex
     *
     * @param sex the value for student.sex
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setSex(String sex) {
        this.sex = sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.birth
     *
     * @return the value of student.birth
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public Date getBirth() {
        return birth;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.birth
     *
     * @param birth the value for student.birth
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setBirth(Date birth) {
        this.birth = birth;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.tel
     *
     * @return the value of student.tel
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getTel() {
        return tel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.tel
     *
     * @param tel the value for student.tel
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.email
     *
     * @return the value of student.email
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.email
     *
     * @param email the value for student.email
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.degree
     *
     * @return the value of student.degree
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getDegree() {
        return degree;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.degree
     *
     * @param degree the value for student.degree
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setDegree(String degree) {
        this.degree = degree;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.position
     *
     * @return the value of student.position
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getPosition() {
        return position;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.position
     *
     * @param position the value for student.position
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setPosition(String position) {
        this.position = position;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.experience
     *
     * @return the value of student.experience
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getExperience() {
        return experience;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.experience
     *
     * @param experience the value for student.experience
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setExperience(String experience) {
        this.experience = experience;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column student.status
     *
     * @return the value of student.status
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column student.status
     *
     * @param status the value for student.status
     *
     * @mbggenerated Tue Sep 04 16:15:47 CST 2018
     */
    public void setStatus(String status) {
        this.status = status;
    }
	@Override
	public String toString() {
		return "Student [sname=" + sname + ", name=" + name + ", sex=" + sex + ", birth=" + birth + ", tel=" + tel
				+ ", email=" + email + ", degree=" + degree + ", position=" + position + ", experience=" + experience
				+ ", status=" + status + "]";
	}
}