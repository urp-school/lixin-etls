[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">

        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span>管理系统</div>
        <div class="m_t_30">
          <div class="row ziyuan_list">
           [#list menus?sort_by("indexNo") as menu]
                <div class="col-sm-6 padding_r_30">
                    <div class="media">
                      <div class="media-left">
                        <span class="span_idx">
                          <span>${menu.indexNo}</span>
                        </span>
                      </div>
                      <div class="media-body-title">
                        <a href="${base }${menu.href}" target="_blank">
                            <h4 class="media-heading">${menu.name}</h4>
                        </a>
                      </div>
                    </div>
                </div>
                [/#list]
            </div>
        </div>

    </div>

[#include "../foot.ftl"/]
