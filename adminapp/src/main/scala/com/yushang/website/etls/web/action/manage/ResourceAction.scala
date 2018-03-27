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
package com.yushang.website.etls.web.action.manage

import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.Resource
import com.yushang.website.etls.model.ResourceType
import org.beangle.webmvc.api.view.Stream
import org.beangle.webmvc.api.annotation.mapping
import java.io.File
import com.yushang.website.etls.Constants
import org.beangle.webmvc.api.context.Params
import com.yushang.website.etls.model.Attachment
import org.beangle.webmvc.api.view.View
import javax.servlet.http.Part
import java.time.Instant
import java.io.FileOutputStream
import org.beangle.commons.lang.Strings
import org.beangle.commons.codec.digest.Digests
import org.beangle.commons.io.IOs
import org.beangle.data.dao.OqlBuilder

class ResourceAction extends RestfulAction[Resource] {

  override def indexSetting(): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.indexSetting()
  }

  override def editSetting(resource: Resource): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.editSetting(resource)
  }

  override def saveAndRedirect(resource: Resource): View = {
    val base = Constants.AttachmentBase + "resource/"
    val aParts = Params.getAll("attachment").asInstanceOf[List[Part]]
    aParts foreach { part =>
      if (part.getSize.toInt > 0) {
        val attachment = new Attachment()
        attachment.fileSize = part.getSize.toInt
        val ext = Strings.substringAfterLast(part.getSubmittedFileName, ".")
        attachment.path = Digests.md5Hex(part.getSubmittedFileName) + (if (Strings.isEmpty(ext)) "" else "." + ext)
        attachment.name = part.getSubmittedFileName
        attachment.updatedAt = Instant.now()
        IOs.copy(part.getInputStream, new FileOutputStream(base + attachment.path))
        entityDao.saveOrUpdate(attachment)
        resource.attachments += attachment
      }
    }

    super.saveAndRedirect(resource)
  }

  @mapping("attachment/{attachmentId}")
  def attachment(attachmentId: Long): View = {
    val attach = entityDao.get(classOf[Attachment], attachmentId);
    val base = Constants.AttachmentBase + "resource/"
    Stream(new File(base + attach.path), attach.name)
  }

  def deleteAttach(): View = {
    val base = Constants.AttachmentBase + "resource/"
    val resourceId = get("resourceId").orNull
    get("attachmentId").foreach { attachmentId =>
      val attachment = entityDao.get(classOf[Attachment], attachmentId.toLong)
      entityDao.remove(attachment)
      get("resourceId").foreach { resourceId =>
        val resource = entityDao.get(classOf[Resource], resourceId.toLong)
        resource.attachments -= attachment
        entityDao.saveOrUpdate(resource)
      }
      val file = new File(base + attachment.path)
      file.delete()
    }
    redirect("info", s"&id=${resourceId}", "info.save.success")
  }

}
