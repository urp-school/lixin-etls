[#ftl]
[@b.head/]
[@b.toolbar title="留言板开关"/]
[@b.grid items=messageSwitches var="messageSwitch"]
  [@b.gridbar]
    bar.addItem("${b.text("action.modify")}",action.edit());
  [/@]
  [@b.row]
    [@b.boxcol /]
    [@b.col width="15%" property="time" title="开关状态"]${messageSwitch.open?string(b.text('打开'),b.text('关闭'))}[/@]
    [/@]
  [/@]
[@b.foot/]