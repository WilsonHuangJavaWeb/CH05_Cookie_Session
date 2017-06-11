package com.bean;

import java.util.Date;

/**
 * Created by WilsonHuang on 2017/6/11.
 */
public class Person {

    private String name;
    private String password;
    private int age;
    private Date birthday;

    public Person(String name, String password, int age, Date birthday) {
        this.name = name;
        this.password = password;
        this.age = age;
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
