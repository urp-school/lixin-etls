  <div class="container top_h">
      <div class="row"><div class="col-xs-12 text-right"><a href="http://www.sfu.edu.cn" target="_blank">学校主页</a><span class="f_main_color m_lr_5"> | </span><a href="${base}/manage/search" target="_blank">管理系统</a></div></div>
      <div class="row p_b_35">
            <div class="col-sm-6"><img class="logo" src="${base}/static/images/logo.png"></div>
            <div class="col-sm-6">
              <div class="row">
                    <div class="col-xs-12 m_t_15">
                        <div class="input-group col-sm-7 pull-right">
                            <input type="text" class="form-control" placeholder="请输入关键字...">
                            <span class="input-group-btn">
                            <button class="btn btn-default" type="button">查询</button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
      </div>
  </div>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse  nav_bg" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${base }/index">教育技术培训系统</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="${base }/index">首页</a>
                    </li>
                    <li class="hidden-xs">
                      <span>/</span>
                    </li>
                    <li>
                        <a href="${base }/reservation">培训预约</a>
                    </li>
                    <li class="hidden-xs">
                      <span>/</span>
                    </li>
                    <li class="dropdown">
                        <a href="#"  class="dropdown-toggle" data-toggle="dropdown">培训资源 <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            [#list resourceTypes as resourceType]
                              <li>
                                  <a href="${base }/resource/resource/${resourceType.id} ">${resourceType.name}</a>
                              </li>
                            [/#list]
                        </ul>
                    </li>
                    <li class="hidden-xs">
                      <span>/</span>
                    </li>
                    <li>
                        <a href="${base }/message?pageSize=5">留言板</a>
                    </li>
                    <li class="hidden-xs">
                      <span>/</span>
                    </li>
                    <li>
                        <a href="${base }/index/contact">联系我们</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
