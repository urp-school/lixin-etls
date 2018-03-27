[#ftl]
[@b.head]
[/@]
[@b.toolbar title="修改培训资源"]bar.addBack();[/@]
[@b.tabs]
  [#assign sa][#if resource.persisted]!update?id=${resource.id!}[#else]!save[/#if][/#assign]
  [@b.form action=sa theme="list" enctype="multipart/form-data"]
    [@b.textfield name="resource.name" label="名称" value="${resource.name!}" required="true" maxlength="20"/]
    [@b.select name="resource.resourceType.id" label="资源类型" value="${(resource.resourceType.id)!}" required="true"  style="width:100px;" items=resourceTypes option="id,name" empty="..."/]
    [@b.textarea name="resource.detail" label="详细介绍" value="${resource.detail!}" maxlength="10000" style="width:700px;height:300px;" id="editor_id"/]
    <input name="resource.text" id="text_id" type="hidden"/>
    [@b.field label="附件" ]
      <td>
        <input name="attachment" type="file" />
        [#if resource.attachments??]
          [#list resource.attachments as attachment]
              <a href="${b.url("!attachment?attachmentId="+attachment.id)}">${(attachment.name)!}</a>[#if attachment_has_next]；[/#if]
          [/#list]
        [/#if]
      </td>
    [/@]
    [@b.formfoot]
    [@b.reset/]&nbsp;&nbsp;[@b.submit value="action.submit" id="submit_id"/]
    [/@]
   [/@]
  [/@]

  <link rel="stylesheet" href="${base}/static/kindeditor/themes/default/default.css"></link>
  <script charset="utf-8" src="${base}/static/kindeditor/kindeditor-all-min.js"></script>
  <script>
     KindEditor.remove('#editor_id');
     var edit_id=KindEditor.create('#editor_id', {
         uploadJson : "${base}/manage/upload-json/upload",
         allowFileManager : false,
         items:[
             'undo', 'redo', '|', 'preview','cut', 'copy', 'paste',
             'plainpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
             'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
             'superscript', 'quickformat', 'selectall', '|', 'fullscreen', '/',
             'formatblock', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
             'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
             'table', 'hr', 'emoticons', 'pagebreak',
             'link', 'unlink', '|', 'about'
         ],
        afterBlur: function(){this.sync();}
     });
     edit_id.focus();

     $("form").submit(function(){
       var text=edit_id.text();
       if(text.length>=60){
         text=text.substring(0,58)+"……"
       }
       $("#text_id").val(text);
     })
  </script>
[@b.foot/]
