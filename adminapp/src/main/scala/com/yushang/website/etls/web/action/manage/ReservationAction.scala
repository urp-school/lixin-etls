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
import com.yushang.website.etls.model.Reservation
import com.yushang.website.etls.model.ReservationTime
import com.yushang.website.etls.model.ReservationTheme
import sun.font.TrueTypeFont
import com.yushang.website.etls.model.States
import org.beangle.webmvc.api.annotation.mapping
import org.beangle.webmvc.api.view.View

class ReservationAction extends RestfulAction[Reservation] {

  override protected def indexSetting(): Unit = {
    put("themes", entityDao.getAll(classOf[ReservationTheme]))
    put("times", entityDao.getAll(classOf[ReservationTime]))
  }

  def approve(): View = {
    longIds("reservation").foreach(id => {
      val reservation = entityDao.get(classOf[Reservation], id.toLong)
      reservation.state = States.Accepted
      entityDao.saveOrUpdate(reservation)
    })
    redirect("search", "info.save.success")
  }

  def disapprove(): View = {
    longIds("reservation").foreach(id => {
      val reservation = entityDao.get(classOf[Reservation], id.toLong)
      reservation.state = States.UnAccepted
      entityDao.saveOrUpdate(reservation)
    })
    redirect("search", "info.save.success")
  }
}
