//
//  SecondViewController.swift
//  ValidatorSample
//

import UIKit
import Validator

class SecondViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var userNameState: UILabel!
    @IBOutlet weak var phoneNumberState: UILabel!
    let userIdRule = ValidationRuleUserId(error: ValidationError(message: "💩"))
    let phoneNumberRule = ValidationRulePattern(pattern: "\\d{2,5}-\\d{1,4}-\\d{4}", error: ValidationError(message: "💩"))
    override func viewDidLoad() {
        super.viewDidLoad()
        enableUserIdValidation()
        enablePhoneNumberValidation()
    }
    private func enableUserIdValidation() {
        userName.validationRules = ValidationRuleSet()
        userName.validationRules?.add(rule: userIdRule)
        userName.validateOnInputChange(enabled: true)
        userName.validationHandler = { result in self.updateUserIdValidationState(result: result) }
    }
    private func enablePhoneNumberValidation() {
        phoneNumber.validationRules = ValidationRuleSet()
        phoneNumber.validationRules?.add(rule: phoneNumberRule)
        phoneNumber.validateOnInputChange(enabled: true)
        phoneNumber.validationHandler = { result in self.updatePhoneNumberValidationState(result: result) }
    }
    func updateUserIdValidationState(result: ValidationResult) {
        switch result {
        case .valid:
            userNameState.text = "😀"
        case .invalid(let failures):
            userNameState.text = (failures.first as? ValidationError)?.message
        }
    }
    func updatePhoneNumberValidationState(result: ValidationResult) {
        switch result {
        case .valid:
            phoneNumberState.text = "😀"
        case .invalid(let failures):
            phoneNumberState.text = (failures.first as? ValidationError)?.message
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}
