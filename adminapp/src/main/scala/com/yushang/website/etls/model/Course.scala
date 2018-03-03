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
package com.yushang.website.etls.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Named
import scala.annotation.varargs

/*
 * 首页图片显示类别
 */
class Course extends LongId with Named {

  var picture: Option[Attachment] = None

  var description: Option[String] = None

  var classroom: Option[String] = None

  var tel: Option[String] = None

  var attachment: Option[Attachment] = None

  var href: Option[String] = None

}
