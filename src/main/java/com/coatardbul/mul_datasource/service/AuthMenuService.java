package com.coatardbul.mul_datasource.service;

import com.coatardbul.mul_datasource.model.entity.AuthMenu;
public interface AuthMenuService{


    int deleteByPrimaryKey(String id);

    int insert(AuthMenu record);

    int insertSelective(AuthMenu record);

    AuthMenu selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AuthMenu record);

    int updateByPrimaryKey(AuthMenu record);

}
