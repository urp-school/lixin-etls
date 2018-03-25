[#ftl]

[#macro message message]
    <div class="maessage_artical">
      <div class="maessage_louzhu">
          <div class="question_sign"><i class="glyphicon glyphicon-question-sign" aria-hidden="true"></i></div>
            <div class="question_con">
              ${message.detail }
            </div>
        </div>
        <div class="question_answer text-right">
          <span>${(message.name)!"匿名"}</span>
            <span>${message.updatedAt }</span>
            <a href="javascript:;">回复</a>
        </div>
        <div class="answer_con">
        [@listReply message.replies/]

            <div class="answer_initiator text-right">
                <form action="${b.url('!saveReply?id='+message.id)}">
                    <a href="javascript:;">我说一句</a>
                    <div class="publish_con">
                        <textarea placeholder="回复：" name="reply.detail${message.id}"></textarea>
                        <button class="btn btn-default" type="submit">发表</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
[/#macro]
[#macro listReply messages]
    [#list messages?sort_by("updatedAt") as reply]
      <div class="answer_list">
            <ul class="list-unstyled">
                <li>
                    <div>
                        <strong>${(reply.name)!"匿名"}：<span>回复${(reply.subject.name)!"匿名"}：${(reply.subject.id)!"匿名"}</span></strong>
                        <span>
                          ${reply.detail }
                        </span>
                    </div>
                    <div class="comment_ans text-right m_t_10 m_b_5">
                        <span>${reply.updatedAt }</span>
                        <a href="javascript:;">回复</a>
                        <div class="publish_con">
                            <form action="${b.url('!saveReply?id='+reply.id)}">
                                <textarea placeholder="回复${(reply.subject.name)!"匿名"}：" name="reply.detail${reply.id}"></textarea>
                                <button class="btn btn-default" type="submit">发表</button>
                            </form>
                        </div>
                    </div>
                </li>
               [@listReply reply.replies/]
            </ul>
        </div>
      [/#list]
[/#macro]

[@b.head/]
[@b.toolbar title="消息详情"]bar.addBack();[/@]
${message.id }
[@b.tabs]
  [#assign sa][#if message.persisted]!update?id=${message.id!}[#else]!save[/#if][/#assign]
  [@b.form action=sa theme="list" ]
    <div class="massages_con">
      [@message message/]
    </div>
    [@b.formfoot]
    [@b.reset/]&nbsp;&nbsp;[@b.submit value="action.submit" /]
    [/@]
   [/@]
  [/@]

[@b.foot/]
