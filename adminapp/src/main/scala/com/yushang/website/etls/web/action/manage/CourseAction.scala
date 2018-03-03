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
package com.yushang.website.etls.web.action.manage

import java.io.FileOutputStream
import java.time.Instant

import org.beangle.commons.codec.digest.Digests
import org.beangle.commons.io.IOs
import org.beangle.commons.lang.Strings
import org.beangle.commons.lang.SystemInfo
import org.beangle.webmvc.api.context.Params
import org.beangle.webmvc.entity.action.RestfulAction

import com.yushang.website.etls.model.Attachment
import com.yushang.website.etls.model.Course

import javax.servlet.http.Part
import org.beangle.webmvc.api.view.View
import org.beangle.webmvc.api.view.Stream
import org.beangle.webmvc.api.annotation.mapping
import java.io.File
import com.yushang.website.etls.Constants

class CourseAction extends RestfulAction[Course] {

  override def saveAndRedirect(course: Course): View = {

    val base = Constants.AttachmentBase
    val aParts = Params.getAll("attachment").asInstanceOf[List[Part]]
    aParts foreach { part =>
      if (part.getSize.toInt > 0) {
        course.attachment.foreach(e=> entityDao.remove(e))
        val attachment = new Attachment()
        attachment.fileSize = part.getSize.toInt
        val ext = Strings.substringAfterLast(part.getSubmittedFileName, ".")
        attachment.path = Digests.md5Hex(part.getSubmittedFileName) + (if (Strings.isEmpty(ext)) "" else "." + ext)
        attachment.name = part.getSubmittedFileName
        attachment.updatedAt = Instant.now()
        IOs.copy(part.getInputStream, new FileOutputStream(base + attachment.path))
        entityDao.saveOrUpdate(attachment);
        course.attachment = Some(attachment)
      }
    }

    val pParts = Params.getAll("picture").asInstanceOf[List[Part]]
    pParts foreach { part =>
      if (part.getSize.toInt > 0) {
        course.picture.foreach(e=> entityDao.remove(e))
        val picture = new Attachment()
        picture.fileSize = part.getSize.toInt
        val ext = Strings.substringAfterLast(part.getSubmittedFileName, ".")
        picture.path = Digests.md5Hex(part.getSubmittedFileName) + (if (Strings.isEmpty(ext)) "" else "." + ext)
        picture.name = part.getSubmittedFileName
        picture.updatedAt = Instant.now()
        IOs.copy(part.getInputStream, new FileOutputStream(base + picture.path))

        entityDao.saveOrUpdate(picture);
        course.picture = Some(picture)
      }
    }
    super.saveAndRedirect(course)
  }

  @mapping("attachment/{attachmentId}")
  def attachment(attachmentId: Long): View = {
    val attach = entityDao.get(classOf[Attachment], attachmentId);
    val base = Constants.AttachmentBase
    Stream(new File(base + attach.path), attach.name)
  }

}
