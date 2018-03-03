[#ftl]
[@b.head/]
[@b.toolbar title="培训预约"/]
<table class="indexpanel">
  <tr>
    <td class="index_view">
    [@b.form name="searchForm" action="!search" target="reservationlist" title="ui.searchForm" theme="search"]
      [@b.select style="width:100px" name="reservation.theme.id" label="培训主题" items=themes option="id,name" empty="..." /]
      [@b.select style="width:100px" name="reservation.time.id" label="培训时间" items=times option=r"${item.time?string('yyyy-MM-dd')}" empty="..." /]
      [@b.textfields names="reservation.code;工号"/]
      [@b.textfields names="reservation.name;姓名"/]
      <input type="hidden" name="orderBy" value="reservation.updatedAt desc"/>
    [/@]
    </td>
    <td class="index_content">[@b.div id="reservationlist" href="!search?orderBy=reservation.updatedAt desc"/]
    </td>
  </tr>
</table>
[@b.foot/]
