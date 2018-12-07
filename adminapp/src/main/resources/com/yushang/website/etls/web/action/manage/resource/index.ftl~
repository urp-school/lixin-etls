[#ftl]
[@b.head/]
[@b.toolbar title="培训资源"/]
<table class="indexpanel">
  <tr>
    <td class="index_view">
    [@b.form name="searchForm" action="!search" target="resourcelist" title="ui.searchForm" theme="search"]
      [@b.textfields names="resource.name;资源名称"/]
      [@b.select style="width:100px" name="resource.resourceType.id" label="资源类型" items=resourceTypes option="id,name" empty="..." /]
      <input type="hidden" name="orderBy" value="resource.updatedAt desc"/>
    [/@]
    </td>
    <td class="index_content">[@b.div id="resourcelist" href="!search?orderBy=resource.updatedAt desc"/]
    </td>
  </tr>
</table>
[@b.foot/]
