package com.coatardbul.mul_datasource.secondMapper;



import com.coatardbul.mul_datasource.model.entity.Areaitem;
import org.apache.ibatis.annotations.Param;

public interface AreaitemMapper {
    int deleteByPrimaryKey(@Param("code") String code, @Param("name") String name);

    int insert(Areaitem record);

    int insertSelective(Areaitem record);

    Areaitem selectByPrimaryKey(@Param("code") String code, @Param("name") String name);

    int updateByPrimaryKeySelective(Areaitem record);

    int updateByPrimaryKey(Areaitem record);
}