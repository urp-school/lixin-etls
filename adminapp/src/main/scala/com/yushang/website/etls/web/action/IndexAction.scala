/*
 * Beangle, Agile Development Scaffold and Toolkits.
 *
 * Copyright © 2005, The OpenURP Software.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package com.yushang.website.etls.web.action

import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.entity.action.RestfulAction

import com.yushang.website.etls.model.Course
import com.yushang.website.etls.model.ResourceType
import org.beangle.data.dao.OqlBuilder

class IndexAction extends RestfulAction[Course] {

  override protected def indexSetting(): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    put("courses", entityDao.search(OqlBuilder.from(classOf[Course],"course").orderBy("course.id")))
  }

  def contact(): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    forward()
  }

  override def info(id:String):View={
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.info(id)

  }

}
