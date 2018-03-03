[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">
        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span><span>培训资源</span>--<span>详情页</span></div>
        <div class="artical_con">
          <div class="artical_title"><span>${resource.name }</span><i></i></div>
            <div class="articalt_text">
                <p>
                ${resource.detail }
                </p>
            </div>
            <div class="attachment_download">
              <h4><i class="glyphicon glyphicon-link" aria-hidden="true"></i>附件下载</h4>
                <div class="download_list">
                  <ul class="list-unstyled">
                    [#if resource.attachment??]
                        <li><a href="${base }/manage/resource/attachment/${resource.attachment.id }">${resource.attachment.name}</a></li>
                    [/#if]
                  </ul>
                </div>
            </div>
        </div>
    </div>

[#include "../foot.ftl"/]
