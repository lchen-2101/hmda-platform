package hmda.validation.rules.lar.quality._2021

import hmda.model.filing.lar.LarGenerators._
import hmda.model.filing.lar.LoanApplicationRegister
import hmda.validation.rules.EditCheck
import hmda.validation.rules.lar.LarEditCheckSpec

class Q659_1Spec extends LarEditCheckSpec {
  override def check: EditCheck[LoanApplicationRegister] = Q659_1

  val exemptCodes = List("888", "88888")
  property("Exempt field should not have a value of 888, or 88888") {
    forAll(larGen) { lar =>
      exemptCodes.foreach(exemptCode => {
        val appLar = lar.copy(applicant = lar.applicant.copy(age = exemptCode.toInt))
        appLar.mustFail
      })
    }
  }
}
