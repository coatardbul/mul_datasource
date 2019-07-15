package com.coatardbul.mul_datasource.mapper;


import com.coatardbul.mul_datasource.model.entity.BedcAreaitem;
import org.apache.ibatis.annotations.Param;

public interface BedcAreaitemMapper {
    int deleteByPrimaryKey(@Param("code") String code, @Param("name") String name);

    int insert(BedcAreaitem record);

    int insertSelective(BedcAreaitem record);

    BedcAreaitem selectByPrimaryKey(@Param("code") String code, @Param("name") String name);

    int updateByPrimaryKeySelective(BedcAreaitem record);

    int updateByPrimaryKey(BedcAreaitem record);
}