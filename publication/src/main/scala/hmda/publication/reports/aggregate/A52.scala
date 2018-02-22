package hmda.publication.reports.aggregate

import akka.NotUsed
import akka.stream.scaladsl.Source
import hmda.model.fi.lar.LoanApplicationRegister
import hmda.publication.reports._

import scala.concurrent.Future

object A52 extends A5XReportCreator {

  def filters(lar: LoanApplicationRegister): Boolean = {
    (lar.loan.loanType == 1) &&
      (lar.loan.propertyType == 1 || lar.loan.propertyType == 2) &&
      (lar.loan.purpose == 1)
  }

  def generate[ec: EC, mat: MAT, as: AS](
    larSource: Source[LoanApplicationRegister, NotUsed],
    fipsCode: Int
  ): Future[A5X] = A5X.generateA5X("A52", larSource, fipsCode, filters)
}