package com.yushang.website.etls.web.action

import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.ResourceType

class ContactAction extends RestfulAction {

  override protected def indexSetting(): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
  }

}