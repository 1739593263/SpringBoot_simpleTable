package com.ssm.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer id;

    //define check rule by self
    //in java, every'\'in regular expression should become '\\' because the different mean between JQuery and JAVA.
    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message = "username must be characters with a-z,A-Z,0-9,_,- and length of 3-16 OR chinese with length between 2-5")
    private String name;

    private String gender;

    //for email checking, we can also use '@Email'
    @Pattern(regexp = "^([a-zA-Z0-9_\\.-]+)@([\\da-zA-Z\\.-]+)\\.([a-z\\.]{2,6})$"
            ,message = "email formation is wrong")
    private String email;

    private Integer depId;

    private Department department;

    public Employee(){
        super();
    }

    public Employee(Integer id, String name, String gender, String email, Integer depId) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.depId = depId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", depId=" + depId +
                ", department=" + department +
                '}';
    }
}