package com.yushang.website.etls.web.action

import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.Menu
import org.beangle.webmvc.api.annotation.view
import com.yushang.website.etls.model.ResourceType
import org.beangle.webmvc.api.view.View

class ManageAction extends RestfulAction[Menu] {

  override def search(): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.search()
  }

}