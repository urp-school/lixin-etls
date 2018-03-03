[#ftl]
[@b.head/]
[@b.toolbar title="修改首页显示项"]bar.addBack();[/@]
[@b.tabs]
  [#assign sa][#if course.persisted]!update?id=${course.id!}[#else]!save[/#if][/#assign]
  [@b.form action=sa theme="list" enctype="multipart/form-data"]
    [@b.textfield name="course.name" label="名称" value="${course.name!}" required="true" maxlength="20"/]
    [@b.textfield name="course.tel" label="联系电话" value="${course.tel!}" maxlength="100"/]
    [@b.textarea name="course.classroom" label="教室分布" value="${course.classroom!}" maxlength="1000"/]
    [@b.textarea name="course.description" label="详细介绍" value="${course.description!}" maxlength="10000" rows="5" cols="50"/]
    [@b.field label="显示图片" ]
      <td>
        <input name="picture" type="file" /><br>
        [#if course.picture??]<img  style="height:370px" src="${b.url("!attachment?attachmentId="+course.picture.id)}"/>[/#if]
      </td>
    [/@]
    [@b.field label="申请表" ]
      <td>
        <input name="attachment" type="file" />
        [#if course.attachment??]<a href="${b.url("!attachment?attachmentId="+course.attachment.id)}">${course.attachment.name}</a>[/#if]
      </td>
    [/@]
    [@b.textfield name="course.href" label="外部地址" value="${course.href!}" maxlength="200"/]
    [@b.formfoot]
    [@b.reset/]&nbsp;&nbsp;[@b.submit value="action.submit"/]
    [/@]
   [/@]
  [/@]
[@b.foot/]
