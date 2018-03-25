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
import org.beangle.data.model.pojo.Updated

class Reservation extends LongId with Updated {

  var theme: ReservationTheme = _

  var customTheme: Option[String] = _

  var time: ReservationTime = _

  var code: String = _

  var name: String = _

  var department: String = _

  var tel: String = _

  var state: States.State = States.Submited

}
