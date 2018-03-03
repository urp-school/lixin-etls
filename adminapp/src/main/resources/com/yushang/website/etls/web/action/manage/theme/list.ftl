[#ftl]
[@b.head/]
[@b.toolbar title="培训主题"/]
[@b.grid items=reservationThemes var="reservationTheme"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="30%" property="name" title="主题名称"/]
    [@b.col width="40%" property="description" title="内容简介"]${reservationTheme.description!}[/@]
    [/@]
  [/@]
[@b.foot/]
