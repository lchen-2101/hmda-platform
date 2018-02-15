package hmda.http.model.common

import java.net.InetAddress
import java.time.Instant

import akka.actor.ActorSystem
import akka.event.LoggingAdapter
import akka.http.scaladsl.marshalling.ToResponseMarshallable
import akka.stream.ActorMaterializer
import hmda.http.model.directives.HmdaTimeDirectives
import de.heikoseeberger.akkahttpcirce.FailFastCirceSupport._
import akka.http.scaladsl.server.Directives._
import io.circe.generic.auto._

trait BaseHttpApi extends HmdaTimeDirectives {

  implicit val system: ActorSystem
  implicit val materializer: ActorMaterializer
  val log: LoggingAdapter

  def rootPath(name: String) =
    pathSingleSlash {
      timedGet { _ =>
        complete {
          val now = Instant.now.toString
          val host = InetAddress.getLocalHost.getHostName
          val status = HmdaServiceStatus("OK", name, now, host)
          log.debug(status.toString)
          ToResponseMarshallable(status)
        }
      }
    }

  def routes(apiName: String) = encodeResponse { rootPath(apiName) }
}