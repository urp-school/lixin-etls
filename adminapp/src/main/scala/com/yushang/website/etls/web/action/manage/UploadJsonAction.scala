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
