//
//  ViewController.swift
//  ValidatorSample
//
//

import UIKit
import Validator

class ViewController: UIViewController {
    @IBOutlet weak var userIdInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var errorForUserId: UILabel!
    @IBOutlet weak var errorForPassword: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func goSecondView(_ sender: UIButton) {
        performSegue(withIdentifier: "goSeccondView", sender: nil)
    }

    @IBAction func login(_ sender: UIButton) {
        let userIdValidateResult = userIdInput.validate(rule: ValidationRuleUserId(error: ValidationError(message: "💩")))
        switch userIdValidateResult {
        case .valid:
            errorForUserId.text = "😎"
        case .invalid(let errors):
            let error = errors.first as? ValidationError
            errorForUserId.text = error?.message ?? "😱"
        }
        let passwordValidateResult = passwordInput.validate(rule: ValidationRuleLength(min: 1, max: 64, error: ValidationError(message: "💩")))
        switch passwordValidateResult {
        case .valid:
            errorForPassword.text = "😎"
        case .invalid(let errors):
            let error = errors.first as? ValidationError
            errorForPassword.text = error?.message ?? "😱"
        }
    }
}
