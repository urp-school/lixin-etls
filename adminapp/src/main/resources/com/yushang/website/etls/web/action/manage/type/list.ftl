[#ftl]
[@b.head/]
[@b.toolbar title="培训资源类型"/]
[@b.grid items=resourceTypes var="resourceType"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="name" title="主题名称"/]
    [/@]
  [/@]
[@b.foot/]
