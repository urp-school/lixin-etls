[#ftl]
[@b.head/]
[@b.toolbar title="修改首页显示项"]bar.addBack();[/@]
[@b.tabs]
  [#assign sa][#if reservationTime.persisted]!update?id=${reservationTime.id!}[#else]!save[/#if][/#assign]
  [@b.form action=sa theme="list"]
    [@b.datepicker label="选择时间" required="true" id="reservationTime.time" name="reservationTime.time"
    value="${(reservationTime.time?string('yyyy-MM-dd HH:mm'))?default('')}" style="width:200px"  format="yyyy-MM-dd HH:mm" /]
    [@b.formfoot]
    [@b.reset/]&nbsp;&nbsp;[@b.submit value="action.submit"/]
    [/@]
   [/@]
  [/@]
[@b.foot/]
