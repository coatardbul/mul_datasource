
package com.coatardbul.mul_datasource.service.job.impl;



import com.coatardbul.mul_datasource.mapper.BedcAreaitemMapper;
import com.coatardbul.mul_datasource.model.entity.Areaitem;
import com.coatardbul.mul_datasource.model.entity.BedcAreaitem;
import com.coatardbul.mul_datasource.secondMapper.AreaitemMapper;
import com.coatardbul.mul_datasource.service.job.EntryAccountRecordProcessStatusService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author: suxiaolei
 * @date: 2019/6/27
 */
@Service
@Slf4j
@Transactional
public class EntryAccountRecordProcessStatusServiceImpl implements EntryAccountRecordProcessStatusService {


    @Autowired
    AreaitemMapper areaitemMapper;

    @Autowired
    BedcAreaitemMapper bedcAreaitemMapper;

    /**
     * 定时查询CMS入账记录处理状态
     */
    @Override
    public void entryAccountRecordProcessStatusQuery() {
        //查询自动入账记录表处理状态为未入账的记录

        BedcAreaitem bedcAreaitem1ss = bedcAreaitemMapper.selectByPrimaryKey("7952", "三原县");


        Areaitem bedcAreaitemss = areaitemMapper.selectByPrimaryKey("7952", "三原县");



    }


}
