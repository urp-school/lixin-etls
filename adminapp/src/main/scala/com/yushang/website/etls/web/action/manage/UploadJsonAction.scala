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

import java.io.File
import java.io.FileOutputStream

import org.beangle.commons.collection.Properties
import org.beangle.commons.io.IOs
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.api.context.Params
import org.beangle.webmvc.api.view.Stream
import org.beangle.webmvc.api.view.View

import com.yushang.website.etls.Constants

import javax.servlet.http.Part
import org.beangle.webmvc.api.context.ActionContext
import org.beangle.webmvc.api.view.Status
import scala.reflect.macros.blackbox.Context
import org.beangle.commons.lang.Strings

class UploadJsonAction extends ActionSupport {

  def index(@param("fileName") fileName: String): View = {
    var fileDir = Constants.AttachmentBase + "resource/" + fileName
    Stream(new File(fileDir))
  }

  def upload: View = {
    var fileDir = Constants.AttachmentBase + "resource/"
    var fileName = ""
    val aParts = Params.getAll("imgFile").asInstanceOf[List[Part]]
    aParts foreach { part =>
      if (part.getSize.toInt > 0) {
        fileName = part.getSubmittedFileName
        IOs.copy(part.getInputStream, new FileOutputStream(fileDir + fileName))
      }
    }
    val res = ActionContext.current.response
    val req = ActionContext.current.request
    val json = "{\"error\":0,\"url\":\"/" + req.getContextPath + "/manage/upload-json?fileName=" + fileName + "\"}"
    res.getWriter.write(json)
    Status.Ok
  }
}
