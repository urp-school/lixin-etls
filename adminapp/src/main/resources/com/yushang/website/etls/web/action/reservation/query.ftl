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
                        [@b.form action="!myinfo" name="reservationForm" target="index"]
                          <div class="form-group">
                            <label for="xuehao" class="col-sm-4 control-label">您的工号或学号:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="code" name="reservation.code">
                            </div>
                          </div>
                          <div class="form-group">
                            <label for="xingming" class="col-sm-4 control-label">您的姓名:</label>
                            <div class="col-sm-8">
                              <input type="text" class="form-control" id="name" name="reservation.name">
                            </div>
                          </div>
                          <div class="text-center col-sm-8 col-sm-push-4">
                              [@b.submit value="action.submit" class="btn btn-default"/]
                          </div>
                          [/@]
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
      document.reservationForm.className="form-horizontal";
    </script>

[#include "../foot.ftl"/]
