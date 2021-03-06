package com.coatardbul.mul_datasource.model.entity;

import lombok.Data;

@Data
public class Areaitem {
    /**
    * 地区名称主键
    */
    private String code;

    /**
    * 地区名称唯一索引
    */
    private String name;

    /**
    * 级别
    */
    private String levelname;

    /**
    * 所属市名称
    */
    private String cityname;

    /**
    * 所属省名称
    */
    private String province;

    /**
    * 行别
    */
    private String tyname;
}