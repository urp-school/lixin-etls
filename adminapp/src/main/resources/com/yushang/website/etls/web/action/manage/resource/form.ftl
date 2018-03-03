[#ftl]
[@b.head/]
[@b.toolbar title="修改培训资源"]bar.addBack();[/@]
[@b.tabs]
  [#assign sa][#if resource.persisted]!update?id=${resource.id!}[#else]!save[/#if][/#assign]
  [@b.form action=sa theme="list" enctype="multipart/form-data"]
    [@b.textfield name="resource.name" label="名称" value="${resource.name!}" required="true" maxlength="20"/]
    [@b.select name="resource.resourceType.id" label="资源类型" value="${(resource.resourceType.id)!}" required="true"  style="width:100px;" items=resourceTypes option="id,name" empty="..."/]
    [@b.textarea name="resource.detail" label="详细介绍" value="${resource.detail!}" maxlength="10000" rows="5" cols="50" theme="kind"/]
    [@b.field label="附件" ]
      <td>
        <input name="attachment" type="file" />
        [#if resource.attachment??]
            <a href="${b.url("!attachment?attachmentId="+resource.attachment.id)}">${(resource.attachment.name)!}</a>
        [/#if]
      </td>
    [/@]
    [@b.formfoot]
    [@b.reset/]&nbsp;&nbsp;[@b.submit value="action.submit"/]
    [/@]
   [/@]
  [/@]
[@b.foot/]
