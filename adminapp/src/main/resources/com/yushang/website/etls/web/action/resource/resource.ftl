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
                                ${resource.text!}
                            </p>
                        </a>
                      </div>
                    </div>
                </div>
                [/#list]
            </div>
        </div>

      [#assign pageIndex = resources.pageIndex]
      [#assign totalPages = resources.totalPages]
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
                  <a href="${base}/resource/resource/${resourceType.id}?pageIndex=${pageIndex-1}&pageSize=8" aria-label="Previous">
                    <span aria-hidden="true">«</span>
                  </a>
                </li>
                [/#if]
                [#list start..end as i]
                <li><a href="${base}/resource/resource/${resourceType.id}?pageIndex=${i}&pageSize=8">${i}</a></li>
                [/#list]
                [#if pageIndex!=totalPages]
                <li>
                  <a href="${base}/resource/resource/${resourceType.id}?pageIndex=${pageIndex+1}&pageSize=8" aria-label="Next">
                    <span aria-hidden="true">»</span>
                  </a>
                </li>
                [/#if]
              </ul>
            </nav>
       </div>

    </div>

[#include "../foot.ftl"/]
