package com.yushang.website.etls.model

import org.beangle.data.model.IntId
import org.beangle.data.model.pojo.Named

class Menu extends IntId with Named {

  var href: String = _

  var indexNo: Int = _

}