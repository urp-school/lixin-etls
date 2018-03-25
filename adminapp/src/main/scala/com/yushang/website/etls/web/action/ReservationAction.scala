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
package com.yushang.website.etls.web.action

import org.beangle.data.dao.EntityDao
import org.beangle.webmvc.api.action.ActionSupport
import org.beangle.webmvc.api.view.View

import com.yushang.website.etls.model.ResourceType
import org.beangle.webmvc.entity.action.RestfulAction
import com.yushang.website.etls.model.Reservation
import com.yushang.website.etls.model.ReservationTheme
import com.yushang.website.etls.model.ReservationTime
import java.time.Instant
import org.beangle.webmvc.api.annotation.param
import org.beangle.webmvc.execution.Handler
import org.beangle.data.dao.OqlBuilder
import java.time.LocalDate
import com.yushang.website.etls.model.States
import org.beangle.webmvc.api.annotation.mapping
import org.mockito.internal.matchers.Null


class ReservationAction extends RestfulAction[Reservation] {

  override protected def indexSetting(): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    super.indexSetting()
  }

  override def editSetting(reservation: Reservation): Unit = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    put("themes", entityDao.getAll(classOf[ReservationTheme]))
    put("times", entityDao.search(OqlBuilder.from(classOf[ReservationTime], "time").where("time.time >= :now", Instant.now)))
    super.editSetting(reservation)
  }

  def query(): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    forward("query")
  }
  def myinfo(): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    val query = OqlBuilder.from(classOf[Reservation], "reservation")
    query.where("reservation.time.time >= :now", Instant.now)
    populateConditions(query)
    put("reservations", entityDao.search(query))
    put("States", States)
    forward()
  }

  override def saveAndRedirect(reservation: Reservation): View = {
    try {
      reservation.updatedAt = Instant.now
      saveOrUpdate(reservation)
      redirect("info", s"&id=${reservation.id}", "info.save.success")
    } catch {
      case e: Exception => {
        val redirectTo = Handler.mapping.method.getName match {
          case "save" => "editNew"
          case "update" => "edit"
        }
        logger.info("saveAndRedirect failure", e)
        redirect(redirectTo, "info.save.failure")
      }
    }
  }

  override def info(id: String): View = {
    put("resourceTypes", entityDao.getAll(classOf[ResourceType]))
    put("themes", entityDao.getAll(classOf[ReservationTheme]))
    super.info(id)
  }

  @mapping("cancle/{id}")
  def cancle(@param("id") id: String): View = {
    entityDao.remove(classOf[Reservation], id.toLong)
    redirect("myinfo", "info.save.success")
  }
}
