[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">

        <div class="row">
            <div class="col-md-9">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">

                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>

                    <div class="carousel-inner" role="listbox">
                      [#list courses as course]
                        <div class=[#if course_index+1 == 1]"item active"[#else]"item"[/#if]>
                            <a href="${base }/index/${course.id }">
                            [#if course.picture??]
                            <img src="${base }/manage/course/attachment/${course.picture.id}" alt="course_index+1">
                            [/#if]
                            </a>
                            <div class="carousel-caption">
                                ${course.description }
                            </div>
                        </div>
                      [/#list]
                    </div>

                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <div class="row m_t_15">
                  [#list courses as course]
                    <div class="col-sm-3 m_b_10">
                        <a class="block ban_list" href="${course.href?default('${base}/index/${course.id}')}" [#if course.href??] target="_blank"[/#if]>
                            <img src="${base}/static/images/${course.id }.png" />
                            <span>${course.name }</span>
                        </a>
                    </div>
                  [/#list]
                </div>
            </div>
            <div class="col-md-3">
                <div class="wxgzh">
                  <img class="img_title" src="${base}/static/images/wxgzh.png" />
                    <img class="img_ewm" src="${base}/static/images/wxewm.png" />
                </div>
                <div class="xcx">
                  <img class="xcx_title" src="${base}/static/images/xcx.png" />
                    <img class="xcx_ewm" src="${base}/static/images/xcxewm.png" />
                </div>
                <div class="sys_img">
                  <img src="${base}/static/images/sys.png" />
                </div>
            </div>
        </div>


    </div>
    [#include "../foot.ftl"/]
