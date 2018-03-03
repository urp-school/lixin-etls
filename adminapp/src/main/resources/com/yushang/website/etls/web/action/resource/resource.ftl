[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">

        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span>${resourceType.name}</div>
        <div class="m_t_30">
          <div class="row ziyuan_list">
           [#list resources as resource]
                <div class="col-sm-6 padding_r_30">
                    <div class="media">
                      <div class="media-left">
                        <span class="span_riqi">
                          <span>${resource.updatedAt?string('dd')}</span>
                          <span>${resource.updatedAt?string('YYYY-MM')}</span>
                        </span>
                      </div>
                      <div class="media-body">
                        <a href="${base }/resource/${resource.id }">
                            <h4 class="media-heading m_t_10">${resource.name}</h4>
                            <p>
                              [#if resource.detail?length gt 60]
                                ${(resource.detail)?substring(0,58)}……
                              [#else] ${resource.detail}
                              [/#if]
                            </p>
                        </a>
                      </div>
                    </div>
                </div>
                [/#list]
            </div>
        </div>

      <div class="see_more"><a href="${base }/resource/all/${resourceType.id}" target="_blank">查看更多</a></div>

    </div>

[#include "../foot.ftl"/]
