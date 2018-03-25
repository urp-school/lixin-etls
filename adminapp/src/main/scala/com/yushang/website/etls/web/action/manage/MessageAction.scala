package com.yushang.website.etls.web.action.manage

import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.Message
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.view.View

class MessageAction extends RestfulAction[Message] {

  def visiable(): View = {
    longIds("message").foreach(id => {
      val message = entityDao.get(classOf[Message], id.toLong)
      message.visiable = true
      entityDao.saveOrUpdate(message)
    })
    redirect("search", "info.save.success")
  }

  def disable(): View = {
    longIds("message").foreach(id => {
      val message = entityDao.get(classOf[Message], id.toLong)
      message.visiable = false
      entityDao.saveOrUpdate(message)
    })
    redirect("search", "info.save.success")
  }

}