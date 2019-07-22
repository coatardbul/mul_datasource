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
  is '�Ѻ�λ��ֵ��';
-- Add comments to the columns 
comment on column AUTH_MENU.id
  is '����ID';
comment on column AUTH_MENU.text
  is '��ʾ�ı�';
comment on column AUTH_MENU.path
  is '����·��';
comment on column AUTH_MENU.parent_id
  is '��ID';
comment on column AUTH_MENU.leaf
  is '�Ƿ�Ҷ�ӽڵ�';
comment on column AUTH_MENU.ordinal
  is '��ʾ˳���';
comment on column AUTH_MENU.resource_id
  is '��ԴID';
comment on column AUTH_MENU.is_need_menu
  is '0:û��Ȩ�ޣ�1��Ȩ�ޣ�2ֻ��admin�û���Ȩ��';
comment on column AUTH_MENU.js_name
  is 'Ŀ¼��Ӧ��EXT.js�ļ�';
comment on column AUTH_MENU.init_params
  is 'ҳ���ʼ������(ѡ��)';

delete from AUTH_MENU;
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100100', '�ҵ�����', '100100', '100', 1, 5, 100100, 1, 'XIRJS.workbench.portal.remindList.RemindListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100101', '�ҵ���Ϣ', '100101', '100', 1, 6, 100101, 1, 'XIRJS.workbench.portal.message.MessageListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100105', '��������', '100105', '100', 1, 10, 100105, 1, 'XIRJS.workbench.portal.toDoList.ToDoListMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100115', '����������', 'XCommon.ui.workflow.activiti.explorer.ShowUserTaskUI', '100', 1, 20, 100115, 1, 'xjs.app.wf.ui.workflow.activiti.explorer.custom.UserTaskMain', '{showType : "current", custom_id : "WMPS",needCustom:false, needApproveBtn: true}');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100120', '����������', 'XCommon.ui.workflow.activiti.explorer.ShowUserTaskUI', '100', 1, 25, 100120, 1, 'xjs.app.wf.ui.workflow.activiti.explorer.custom.UserTaskMain', '{showType : "history", custom_id : "WMPS",needCustom:false, needApproveBtn: true}');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125', 'ת��Ȩ����', '100125', '100', 0, 30, null, 1, null, null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125010', 'ת��Ȩ����', '100125', '100125', 1, 1, 100125010, 1, 'XIRJS.product.xwms.auth.userDelegate.Main', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100125020', 'ת��Ȩ��Ϣ', null, '100125', 1, 2, 100125020, 1, 'XIRJS.product.xwms.auth.userDelegate.QueryMain', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130', '��Ϣ����', '100130', '100', 0, 35, null, 1, null, null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130100', '����������', '10013010', '100130', 1, 10, 100130100, 1, 'XIRJS.platform.report.OrderOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130200', '���׵�����', '10013020', '100130', 1, 20, 100130200, 1, 'XIRJS.platform.report.TradeOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130300', '�ʽ�����', '10013030', '100130', 1, 20, 100130300, 1, 'XIRJS.platform.report.CashOverviewMain', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100130400', '��ģ��Ϣ����', '10013040', '100130', 1, 30, 100130400, 0, 'XIRJS.queryReport.charts.chart', null);
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('100135', '�������', '100135', '100', 1, 40, 100135, 0, 'XIRJS.workbench.portal.limits.LimitRemind', '0');
insert into AUTH_MENU (id, text, path, parent_id, leaf, ordinal, resource_id, is_need_menu, js_name, init_params)
values ('105', '��Ʒ����', '105', '0', 0, 10, null, 1, null, null);
commit;
