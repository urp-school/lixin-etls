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
        [#if resource.attachments??]
          [#list resource.attachments as attachment]
            <a href="${b.url("!attachment?attachmentId="+attachment.id)}" style="margin-left:auto">${attachment.name!}</a>
            <a href="${base}/manage/resource/deleteAttach?attachmentId=${attachment.id}&resourceId=${resource.id}">删除</a>[#if attachment_has_next]<br>[/#if]
          [/#list]
        [/#if]
    </td>
  </tr>
</table>

[@b.foot/]
