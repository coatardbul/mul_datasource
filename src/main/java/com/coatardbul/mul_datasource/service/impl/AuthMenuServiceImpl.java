package com.coatardbul.mul_datasource.service.impl;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import com.coatardbul.mul_datasource.secondMapper.AuthMenuMapper;
import com.coatardbul.mul_datasource.model.entity.AuthMenu;
import com.coatardbul.mul_datasource.service.AuthMenuService;
@Service
public class AuthMenuServiceImpl implements AuthMenuService{

    @Resource
    private AuthMenuMapper authMenuMapper;

    @Override
    public int deleteByPrimaryKey(String id) {
        return authMenuMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(AuthMenu record) {
        return authMenuMapper.insert(record);
    }

    @Override
    public int insertSelective(AuthMenu record) {
        return authMenuMapper.insertSelective(record);
    }

    @Override
    public AuthMenu selectByPrimaryKey(String id) {
        return authMenuMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(AuthMenu record) {
        return authMenuMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(AuthMenu record) {
        return authMenuMapper.updateByPrimaryKey(record);
    }

}
