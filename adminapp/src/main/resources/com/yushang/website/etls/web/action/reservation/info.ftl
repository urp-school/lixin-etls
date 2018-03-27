[#include "../head.ftl"/]
    <!-- Page Content -->
    <div class="container m_t_60 margin_t_30">
        <div class="location_title"><span class="glyphicon glyphicon-home m_lr_5" aria-hidden="true"></span><span>培训预约</span>--<span>预约界面</span></div>
        <div class="reservation_con">
          <div class="reservation_explain">
              <strong> 说明：</strong>
              <p>1.  请根据提示选择或输入您的信息进行预约，预约时请务必留下准确的联系方式。</p>
                <p>2.  您可输入自己的工号或学号查询预约信息，或取消预约。</p>
                <p>3.  如有问题或建议，请联系我们： 33935913（外线）  8512（内线）或留言给我们</p>
            </div>
            <div class="res_con  m_t_15 ">
              <div class="row">
                    <div class="col-sm-6 col-sm-push-3">
                       <form class="form-horizontal">
                          <div class="form-group">
                            <label class="col-sm-4 control-label">培训主题:</label>
                            <div class="col-sm-8">
                                <select class="form-control" disabled="disabled">
                                  <option>${(reservation.theme.name)! }</option>
                                </select>
                            </div>
                          </div>
                          [#if reservation.theme.id == 4]
                            <div class="form-group">
                              <label for="xuehao" class="col-sm-4 control-label"></label>
                              <div class="col-sm-8">
                                <input  type="text" class="form-control" id="customTheme" disabled="disabled" value="${reservation.customTheme}">
                              </div>
                            </div>
                          [/#if]
                          <div class="form-group">
                            <label  class="col-sm-4 control-label">时间:</label>
                            <div class="col-sm-8">
                                <select class="form-control" disabled="disabled">
                                  <option>${(reservation.time.time)?string('yyyy-MM-dd')}</option>
                                </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xuehao" class="col-sm-4 control-label">工号或学号:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="code" disabled="disabled" value="${reservation.code}">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xingming" class="col-sm-4 control-label">姓名:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="name" disabled="disabled" value="${reservation.name}">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="bumen" class="col-sm-4 control-label">学院或部门:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="department" disabled="disabled" value="${reservation.department}">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="dainhua" class="col-sm-4 control-label">联系方式:</label>
                            <div class="col-sm-8">
                              <input type="text" id="tel" class="form-control" disabled="disabled" value="${reservation.tel}">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xuehao" class="col-sm-4 control-label">预约状态:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="code" disabled="disabled" value="${reservation.state}">
                            </div>
                          </div>
                          <div class="text-center">
                                <a href="${base }/reservation/new"><button type="button">继续预约</button></a>
                          </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="res_jscon">
              <div class="res_jscon_title">各培训主题内容简介：</div>
                <div class="res_jscon_list">
                  [#list themes as theme]
                    <div>
                       <ul class="bs-docs-footer-links">
                          <td ><font style="font-weight:bold">${theme.name !}</font></td>
                          <td >[#if theme.description?? ]：[/#if]${theme.description! }</td>
                       </ul>
                     </div>
                   [/#list]
                </div>
            </div>
        </div>
    </div>

[#include "../foot.ftl"/]
