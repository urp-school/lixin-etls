[#ftl]
[@b.head/]
[@b.toolbar title="培训时间"/]
[@b.grid items=reservationTimes var="reservationTime"]
  [@b.gridbar]
    bar.addItem("${b.text("action.new")}",action.add());
    bar.addItem("${b.text("action.modify")}",action.edit());
    bar.addItem("${b.text("action.delete")}",action.remove("确认删除?"));
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="time" title="培训时间"]${reservationTime.time?string('yyyy-MM-dd')!}[/@]
    [/@]
  [/@]
[@b.foot/]
