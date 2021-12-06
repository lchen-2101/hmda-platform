package hmda.model.processing.state

import hmda.messages.submission.HmdaRawDataEvents.{ HmdaRawDataEvent, LineAdded, LinesAdded }

case class HmdaRawDataState(size: Int = 0) {
  def update(event: HmdaRawDataEvent): HmdaRawDataState = event match {
    case LineAdded(_, _) =>
      HmdaRawDataState(size + 1)
    case LinesAdded(_, data) =>
      HmdaRawDataState(size + data.size)
    case _ => this
  }
}
