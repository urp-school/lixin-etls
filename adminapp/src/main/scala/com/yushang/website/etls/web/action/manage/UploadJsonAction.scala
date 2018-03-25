package com.yushang.website.etls.web.action.manage

import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.commons.collection.Properties
import org.beangle.webmvc.api.view.Stream

class UploadJsonAction extends ActionSupport{
  
   @mapping("{fileName}")
   def index(@param("fileName") fileName:String):View={
       var fileDir=SystemInfo.user.home+"/etls/upload/"+fileName
       Stream(new File(fileDir+fileName))
   }

   def upload:Properties={
       var fileDir=SystemInfo.user.home+"/etls/upload/"
       //保存文件
       val fileName="";

	new Properties("error"->0 ,"url"-> "/upload-json/"+fileName)
   }
}
