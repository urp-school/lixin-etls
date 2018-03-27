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
                        [@b.form action="!save" name="reservationForm" target="index" cssClass="form-horizontal"]
                          <div class="form-group">
                            <label class="col-sm-4 control-label">请选择培训主题:</label>
                            <div class="col-sm-8">
                               <select name="reservation.theme.id" class="form-control" onchange="onSelect(this.value)">
                                 <option value="">...</option>
                                 [#list themes as theme]
                                   <option value="${theme.id}">${theme.name}</option>
                                 [/#list]
                               </select>
                            </div>
                          </div>
                          <div class="form-group" id="customThemeDiv" style="display:none">
                            <label for="xuehao" class="col-sm-4 control-label"></label>
                            <div class="col-sm-8">
                              <textarea style="width:500px;height:100px;" placeholder="自定义主题" type="text" class="form-control" id="customTheme" name="reservation.customTheme" value="${ reservation.customTheme!}"></textarea>
                            </div>
                          </div>
                          <div class="form-group">
                            <label  class="col-sm-4 control-label">请选择时间:</label>
                             <div class="col-sm-8">
                                <select name="reservation.time.id" class="form-control">
                                  <option value="">...</option>
                                  [#list times as time]
                                    <option value="${time.id}">${time.time?string('yyyy-MM-dd')}</option>
                                  [/#list]
                                </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xuehao" class="col-sm-4 control-label">您的工号或学号:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="code" name="reservation.code" value="${reservation.code! }">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xingming" class="col-sm-4 control-label">您的姓名:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="name" name="reservation.name" value="${reservation.name! }">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="bumen" class="col-sm-4 control-label">您的学院或部门:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="department" name="reservation.department" value="${reservation.department! }">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="dainhua" class="col-sm-4 control-label">您的联系方式:</label>
                            <div class="col-sm-8">
                              <input type="text" id="tel" class="form-control" name="reservation.tel" value="${reservation.tel! }">
                            </div>
                          </div>
                          <div class="text-center col-sm-8 col-sm-push-4">
                              [@b.submit value="action.submit" class="btn btn-default"/]
                          </div>
                          [/@]
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
    <script>
      document.reservationForm.className="form-horizontal";

      function onSelect(obj){
          if(obj!="4"){
            $("#customThemeDiv").css("display", "none");
            $("#customTheme").val("");
          } else {
            $("#customThemeDiv").css("display", "block");
          }
      }
    </script>

[#include "../foot.ftl"/]
