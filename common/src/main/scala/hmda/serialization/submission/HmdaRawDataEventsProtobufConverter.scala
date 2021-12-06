package hmda.serialization.submission

import hmda.messages.submission.HmdaRawDataEvents.{ LineAdded, LinesAdded }
import hmda.model.processing.state.HmdaRawDataState
import hmda.persistence.serialization.raw.data.events.{ HmdaRawDataStateMessage, LineAddedMessage, LinesAddedMessage }

object HmdaRawDataEventsProtobufConverter {

  def lineAddedToProtobuf(evt: LineAdded): LineAddedMessage =
    LineAddedMessage(
      evt.timestamp,
      evt.data
    )

  def linesAddedToProtobuf(evt: LinesAdded): LinesAddedMessage =
    LinesAddedMessage(
      evt.timestamp,
      evt.data
    )

  def lineAddedFromProtobuf(msg: LineAddedMessage): LineAdded =
    LineAdded(
      msg.timestamp,
      msg.data
    )

  def linesAddedFromProtobuf(msg: LinesAddedMessage): LinesAdded =
    LinesAdded(
      msg.timestamp,
      msg.data
    )

  def rawDataStateToProtobuf(evt: HmdaRawDataState): HmdaRawDataStateMessage =
    HmdaRawDataStateMessage(
      evt.size
    )

  def rawDataStateFromProtobuf(msg: HmdaRawDataStateMessage): HmdaRawDataState =
    HmdaRawDataState(
      msg.size
    )

}
