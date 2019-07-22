package com.coatardbul.mul_datasource.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.coatardbul.mul_datasource.model.entity.Areaitem;
import com.coatardbul.mul_datasource.mapper.AreaitemMapper;
import com.coatardbul.mul_datasource.service.AreaitemService;
@Service
public class AreaitemServiceImpl implements AreaitemService{

    @Resource
    private AreaitemMapper areaitemMapper;

    @Override
    public int deleteByPrimaryKey(String code,String name) {
        return areaitemMapper.deleteByPrimaryKey(code,name);
    }

    @Override
    public int insert(Areaitem record) {
        return areaitemMapper.insert(record);
    }

    @Override
    public int insertSelective(Areaitem record) {
        return areaitemMapper.insertSelective(record);
    }

    @Override
    public Areaitem selectByPrimaryKey(String code,String name) {
        return areaitemMapper.selectByPrimaryKey(code,name);
    }

    @Override
    public int updateByPrimaryKeySelective(Areaitem record) {
        return areaitemMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Areaitem record) {
        return areaitemMapper.updateByPrimaryKey(record);
    }

}
