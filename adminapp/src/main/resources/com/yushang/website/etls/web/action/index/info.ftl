[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">
        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span><span>首页</span>--<span>详情页</span></div>
        <div class="artical_con">
          <div class="artical_title"><span>${course.name}</span><i></i></div>
            <div class="articalt_text">
              <h4>智慧教室介绍</h4>
                <p>
                  ${course.description}
                </p>
              <h4>教室分布</h4>
                <p>
                  ${course.classroom }
                </p>
               <h4>联系电话</h4>
                 <p>
                   ${course.tel}
                 </p>
            </div>
            <div class="attachment_download">
              <h4><i class="glyphicon glyphicon-link" aria-hidden="true"></i>申请表下载</h4>
                <div class="download_list">
                  <ul class="list-unstyled">
                      <li>[#if course.attachment??]<a href="${base }/manage/course/attachment/${course.attachment.id}">${course.attachment.name}</a>[/#if]</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
  [#include "../foot.ftl"/]
