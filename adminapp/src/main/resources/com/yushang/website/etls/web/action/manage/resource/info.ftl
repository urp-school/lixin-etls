[#ftl]
[@b.head/]
[@b.toolbar title="培训资源"]
  bar.addBack("${b.text("action.back")}");
[/@]
<table class="infoTable">
  <tr>
    <td class="title" width="20%">名称</td>
    <td class="content">${resource.name}</td>
  </tr>
  <tr>
    <td class="title" width="20%">资源类型</td>
    <td class="content">${resource.resourceType.name}</td>
  </tr>
  <tr>
    <td class="title" width="20%">修改时间</td>
    <td class="content" >${resource.updatedAt?string("yyyy-MM-dd")}</td>
  </tr>
  <tr>
    <td class="title" width="20%">详细介绍</td>
    <td class="content" >${resource.detail!}</td>
  </tr>
  <tr>
    <td class="title" width="20%">附件</td>
    <td class="content" >
        [#if resource.attachment??]
            <a href="${b.url("!attachment?attachmentId="+resource.attachment.id)}" style="margin-left:auto">${resource.attachment.name!}</a>
        [/#if]
    </td>
  </tr>
</table>

[@b.foot/]
