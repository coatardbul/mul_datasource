
package com.coatardbul.mul_datasource.controller;



import com.coatardbul.mul_datasource.service.job.EntryAccountRecordProcessStatusService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author: suxiaolei
 * @date: 2019/6/24
 */
@Api(value = "CSystem")
@Slf4j
@RestController
@RequestMapping(value = "/transaction")
public class TestController {


    @Autowired
    EntryAccountRecordProcessStatusService entryAccountRecordProcessStatusService;
    @ApiOperation(value = "测试", notes = "")
    @RequestMapping(value = "/test", method = RequestMethod.POST)
    public Object directFundPay(@RequestBody String str) {

       // fundPayResultService.fundPayPush();
        entryAccountRecordProcessStatusService.entryAccountRecordProcessStatusQuery();;
        return entryAccountRecordProcessStatusService;
    }
}
