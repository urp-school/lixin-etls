[#include "../head.ftl"/]

[#macro message messages]
          [#list messages?sort_by("updatedAt")?reverse as message]
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
                        <form action="saveReply/${message.id}">
                            <a href="javascript:;">我也说一句</a>
                            <div class="publish_con">
                                <textarea placeholder="回复：" name="reply.detail${message.id}"></textarea>
                                <button class="btn btn-default" type="submit">发表</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            [/#list]
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
                                        <form action="saveReply/${reply.id}" >
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
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">

        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span>留言板</div>

        <div class="massages_con">
          <div class="message_prompt">各位老师在使用智慧教室环境、课程中心等过程中若遇到任何疑问或者有任何建议可在下方留言，我们会尽快回复并解决问题。（留言可选择实名制或匿名。）</div>
          [@message messages/]
          [#assign pageIndex = messages.pageIndex]
          [#assign totalPages = messages.totalPages]
          [#if pageIndex-2>0]
            [#assign start = pageIndex-2]
          [#else]
            [#assign start = pageIndex]
          [/#if]

          [#if pageIndex+2 < totalPages]
            [#assign end = pageIndex+2]
          [#else]
            [#assign end = totalPages]
          [/#if]
            <div class="text-right">
              <nav aria-label="Page navigation">
                  <ul class="pagination">
                   [#if pageIndex>1]
                    <li>
                      <a href="${base}/message?pageIndex=${pageIndex-1}&pageSize=5" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                      </a>
                    </li>
                    [/#if]
                    [#list start..end as i]
                    <li><a href="${base}/message?pageIndex=${i}&pageSize=5">${i}</a></li>
                    [/#list]
                    [#if pageIndex!=totalPages]
                    <li>
                      <a href="${base}/message?pageIndex=${pageIndex+1}&pageSize=5" aria-label="Next">
                        <span aria-hidden="true">»</span>
                      </a>
                    </li>
                    [/#if]
                  </ul>
                </nav>
            </div>

            <div class="message_question">
              <div class="m_question_title"><i></i>如有问题，快快留言吧</div>
                <div class="m_question_con">
                  <form action="saveMessage">
                      <textarea name="message.detail"></textarea>
                        <div class="checkbox text-left">
                            <label>
                              <input type="checkbox"> 是否匿名
                            </label>
                        </div>
                        <button class="btn btn-default" type="submit">提交</button>
                    </form>
                </div>
            </div>

        </div>

    </div>
   <script>
    $(".question_answer > a").click(function(){
      $(this).parents(".maessage_artical").children(".answer_con").toggle();
    });
    $(".answer_con li .comment_ans > a , .answer_initiator a").click(function(){
      $(this).siblings(".publish_con").toggle();
    });
    /*$(".answer_initiator a").click(function(){
      $(this).siblings(".publish_con").toggle();
    });*/
  </script>
    [#include "../foot.ftl"/]
