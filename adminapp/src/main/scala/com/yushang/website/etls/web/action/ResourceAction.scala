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

import org.beangle.data.dao.EntityDao
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View

import com.yushang.website.etls.model.ResourceType
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.annotation.param
import com.yushang.website.etls.model.Resource
import org.beangle.data.dao.OqlBuilder
import com.yushang.website.etls.model.Resource
import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.Constants
import com.yushang.website.etls.model.Attachment
import java.io.File
import org.beangle.webmvc.api.view.Stream


class ResourceAction extends RestfulAction[Resource] {

  @mapping("resource/{id}")
  def resource(@param("id") id: String): View = {
    put("resourceType", entityDao.get(classOf[ResourceType], id.toInt))
    val builder = OqlBuilder.from(classOf[Resource], "resource")
    builder.where("resource.resourceType.id=:id", id.toInt)
    builder.orderBy("resource.updatedAt desc").limit(1, 8)
    put("resources", entityDao.search(builder))
    indexSetting()
    forward()
  }

  @mapping("all/{id}")
  def all(@param("id") id: String): View = {
    put("resourceType", entityDao.get(classOf[ResourceType], id.toInt))
    val builder = OqlBuilder.from(classOf[Resource], "resource")
    builder.where("resource.resourceType.id=:id", id.toInt)
    builder.orderBy("resource.updatedAt desc")
    put("resources", entityDao.search(builder))
    indexSetting()
    forward()
  }

  override protected def indexSetting(): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
  }

  override def info(id: String): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.info(id)

  }
}
