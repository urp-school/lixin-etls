[#ftl]
[@b.head/]
[@b.toolbar title="培训资源"/]
[@b.grid items=resources var="resource"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="name" title="名称"][@b.a href="!info?id=${resource.id}"]${resource.name}[/@][/@]
    [@b.col width="15%" property="updatedAt" title="修改时间"]${resource.updatedAt?string("yyyy-MM-dd")}[/@]
    [@b.col width="15%" property="resourceType.name" title="培训资源类型"/]
    [/@]
  [/@]
[@b.foot/]
