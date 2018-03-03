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
package com.yushang.website.etls.model

import org.beangle.data.model.LongId
import org.beangle.data.model.pojo.Updated
import org.beangle.commons.collection.Collections
import scala.collection.mutable.Buffer

class Message extends LongId with Updated {

  var name: Option[String] = None

  var detail: String = _

  var subject: Option[Message] = None

  var replies: Buffer[Message] = Collections.newBuffer[Message]

  var anonymous: Boolean = true

}
