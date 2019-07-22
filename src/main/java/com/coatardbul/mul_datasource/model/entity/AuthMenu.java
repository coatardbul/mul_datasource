package com.coatardbul.mul_datasource.model.entity;

import lombok.Data;

@Data
public class AuthMenu {
    /**
    * 主键ID
    */
    private String id;

    /**
    * 显示文本
    */
    private String text;

    /**
    * 访问路径
    */
    private String path;

    /**
    * 父ID
    */
    private String parentId;

    /**
    * 是否叶子节点
    */
    private Short leaf;

    /**
    * 显示顺序号
    */
    private Long ordinal;

    /**
    * 资源ID
    */
    private Long resourceId;

    /**
    * 0:没有权限，1有权限，2只有admin用户有权限
    */
    private Short isNeedMenu;

    /**
    * 目录对应的EXT.js文件
    */
    private String jsName;

    /**
    * 页面初始化参数(选填)
    */
    private String initParams;
}