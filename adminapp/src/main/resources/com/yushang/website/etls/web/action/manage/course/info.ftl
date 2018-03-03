[#ftl]
[@b.head/]
[@b.toolbar title="首页显示项"]
  bar.addBack("${b.text("action.back")}");
[/@]
<table class="infoTable">
  <tr>
    <td class="title" width="20%">名称</td>
    <td class="content">${course.name!}</td>
  </tr>
  <tr>
    <td class="title" width="20%">联系电话</td>
    <td class="content">${course.tel!}</td>
  </tr>
  <tr>
    <td class="title" width="20%">教室分布</td>
    <td class="content">${course.classroom!}</td>
  </tr>
  <tr>
    <td class="title" width="20%">详细介绍</td>
    <td class="content" >${course.description!}</td>
  </tr>
  <tr>
    <td class="title" width="20%">显示图片</td>
    <td class="content" >[#if course.picture??]<img  style="height:370px" src="${b.url("!attachment?attachmentId="+course.picture.id)}"/>[/#if]</td>
  </tr>
  <tr>
    <td class="title" width="20%">申请表</td>
    <td class="content" >[#if course.attachment??]<a href="${b.url("!attachment?attachmentId="+course.attachment.id)}">${course.attachment.name}</a>[/#if]</td>
  </tr>
  <tr>
    <td class="title" width="20%">外部地址</td>
    <td class="content" >${course.href!}</td>
  </tr>
</table>

[@b.foot/]
