[#ftl]
[@b.head/]
[@b.toolbar title="留言板消息"/]
<table class="indexpanel">
  <tr>
    <td class="index_view">
    [@b.form name="searchForm" action="!search" target="messagelist" title="ui.searchForm" theme="search"]
      [@b.textfields names="message.detail;消息内容"/]
      <input type="hidden" name="orderBy" value="message.updatedAt desc"/>
    [/@]
    </td>
    <td class="index_content">[@b.div id="messagelist" href="!search?orderBy=message.updatedAt desc"/]
    </td>
  </tr>
</table>
[@b.foot/]
