package hmda.validation.rules.lar.quality._2021

import hmda.model.filing.lar.LarGenerators._
import hmda.model.filing.lar.LoanApplicationRegister
import hmda.validation.rules.EditCheck
import hmda.validation.rules.lar.LarEditCheckSpec

class Q659_2Spec extends LarEditCheckSpec {
  override def check: EditCheck[LoanApplicationRegister] = Q659_2

  val exemptCodes = List("999", "99999")
  property("Exempt field should not have a value of 999, or 99999") {
    forAll(larGen) { lar =>
      exemptCodes.foreach(exemptCode => {
        val appLar = lar.copy(applicant = lar.applicant.copy(age = exemptCode.toInt))
        appLar.mustFail
      })
    }
  }
}
