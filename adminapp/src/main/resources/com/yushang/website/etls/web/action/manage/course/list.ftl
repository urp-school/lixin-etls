[#ftl]
[@b.head/]
[@b.toolbar title="首页显示项"/]
[@b.grid items=courses var="course"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="name" title="名称"][@b.a href="!info?id=${course.id}"]${course.name}[/@][/@]
    [@b.col width="15%" property="tel" title="联系电话"/]
    [/@]
  [/@]
[@b.foot/]
