-- Create table
create table AUTH_MENU
(
  id           VARCHAR2(16) not null  primary key,
  text         VARCHAR2(64),
  path         VARCHAR2(255),
  parent_id    VARCHAR2(16),
  leaf         NUMBER(1),
  ordinal      NUMBER(11),
  resource_id  NUMBER(11),
  is_need_menu NUMBER(1),
  js_name      VARCHAR2(255),
  init_params  VARCHAR2(200)
); 
comment on table AUTH_MENU
  is '费后单位净值表';
-- Add comments to the columns 
comment on column AUTH_MENU.id
  is '主键ID';
comment on column AUTH_MENU.text
  is '显示文本';
comment on column AUTH_MENU.path
  is '访问路径';
comment on column AUTH_MENU.parent_id
  is '父ID';
comment on column AUTH_MENU.leaf
  is '是否叶子节点';
comment on column AUTH_MENU.ordinal
  is '显示顺序号';
comment on column AUTH_MENU.resource_id
  is '资源ID';
comment on column AUTH_MENU.is_need_menu
  is '0:没有权限，1有权限，2只有admin用户有权限';
comment on column AUTH_MENU.js_name
  is '目录对应的EXT.js文件';
comment on column AUTH_MENU.init_params
  is '页面初始化参数(选填)';

delete from AUTH_MENU;
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100100', '我的提醒', '100100', '100', 1, 5, 100100, 1, 'XIRJS.workbench.portal.remindList.RemindListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100101', '我的消息', '100101', '100', 1, 6, 100101, 1, 'XIRJS.workbench.portal.message.MessageListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100105', '待办事项', '100105', '100', 1, 10, 100105, 1, 'XIRJS.workbench.portal.toDoList.ToDoListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100115', '待审批任务', 'XCommon.ui.workflow.activiti.explorer.ShowUserTaskUI', '100', 1, 20, 100115, 1, 'xjs.app.wf.ui.workflow.activiti.explorer.custom.UserTaskMain', '{showType : "current", custom_id : "WMPS",needCustom:false, needApproveBtn: true}');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100120', '已审批任务', 'XCommon.ui.workflow.activiti.explorer.ShowUserTaskUI', '100', 1, 25, 100120, 1, 'xjs.app.wf.ui.workflow.activiti.explorer.custom.UserTaskMain', '{showType : "history", custom_id : "WMPS",needCustom:false, needApproveBtn: true}');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125', '转授权管理', '100125', '100', 0, 30, null, 1, null, null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125010', '转授权管理', '100125', '100125', 1, 1, 100125010, 1, 'XIRJS.product.xwms.auth.userDelegate.Main', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125020', '转授权信息', null, '100125', 1, 2, 100125020, 1, 'XIRJS.product.xwms.auth.userDelegate.QueryMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130', '信息总览', '100130', '100', 0, 35, null, 1, null, null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130100', '审批单总览', '10013010', '100130', 1, 10, 100130100, 1, 'XIRJS.platform.report.OrderOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130200', '交易单总览', '10013020', '100130', 1, 20, 100130200, 1, 'XIRJS.platform.report.TradeOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130300', '资金单总览', '10013030', '100130', 1, 20, 100130300, 1, 'XIRJS.platform.report.CashOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130400', '规模信息总览', '10013040', '100130', 1, 30, 100130400, 0, 'XIRJS.queryReport.charts.chart', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100135', '监控提醒', '100135', '100', 1, 40, 100135, 0, 'XIRJS.workbench.portal.limits.LimitRemind', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('105', '产品管理', '105', '0', 0, 10, null, 1, null, null);
commit;
