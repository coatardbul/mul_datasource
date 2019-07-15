package com.coatardbul.mul_datasource.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BedcAreaitem {
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
     * 市编码
     */
    private String citycode;

    /**
     * 所属市名称
     */
    private String cityname;

    /**
     * 省编码
     */
    private String provincecode;

    /**
     * 所属省名称
     */
    private String province;

    /**
     * 行别
     */
    private String tyname;

    /**
     * 创建用户
     */
    private String createuser;
}