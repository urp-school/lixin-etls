/*
 * OpenURP, Agile University Resource Planning Solution.
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
import org.beangle.webmvc.api.view.View

import com.yushang.website.etls.model.ResourceType
import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.Message
import scala.collection.mutable.Buffer
import scala.collection.mutable.Map
import org.beangle.commons.collection.Collections
import org.beangle.data.dao.OqlBuilder
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.annotation.param
import java.time.Instant
import com.yushang.website.etls.model.MessageSwitch

class MessageAction extends RestfulAction[Message] {

  override def indexSetting(): Unit = {
    val switch = entityDao.getAll(classOf[MessageSwitch]).head
    put("switch", switch)
    val builder = OqlBuilder.from(classOf[Message], "message")
    builder.where("message.subject is null")
    builder.limit(getPageLimit)
    put("messages", entityDao.search(builder))
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
  }

  @mapping(value = "saveReply/{id}")
  def saveReply(@param("id") id: String): View = {
    var message = new Message()
    message.updatedAt = Instant.now()
    message.subject = entityDao.find(classOf[Message], id.toLong)
    get("reply.detail" + s"${id}").foreach(f => message.detail = f)
    saveOrUpdate(message)
    redirect("index", "info.save.success")
  }

  @mapping(value = "saveMessage")
  def saveMessage(): View = {
    saveAndRedirect(populateEntity())
    redirect("index", "info.save.success")
  }

}
