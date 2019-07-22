package com.coatardbul.mul_datasource.service;

import com.coatardbul.mul_datasource.model.entity.Areaitem;
public interface AreaitemService{


    int deleteByPrimaryKey(String code,String name);

    int insert(Areaitem record);

    int insertSelective(Areaitem record);

    Areaitem selectByPrimaryKey(String code,String name);

    int updateByPrimaryKeySelective(Areaitem record);

    int updateByPrimaryKey(Areaitem record);

}
