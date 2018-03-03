[#ftl]
[@b.head/]
[@b.toolbar title="管理系统菜单"/]
[@b.grid items=menus var="menu"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="indexNo" title="序号"/]
    [@b.col width="15%" property="name" title="菜单名称"/]
    [@b.col width="15%" property="href" title="地址"/]
    [/@]
  [/@]
[@b.foot/]
