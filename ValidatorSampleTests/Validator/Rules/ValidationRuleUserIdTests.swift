//
//  ValidationRuleUserId.swift
//  ValidatorSample
//

import Quick
import Nimble

@testable import ValidatorSample

class ValidationRuleUserIdTests: QuickSpec {
    var subject: ValidationRuleUserId?
    override func spec() {
        describe("ユーザIdの精査ルールのテスト") {
            beforeEach {
                let error = ValidationError(message: "エラーだよ")
                self.subject = ValidationRuleUserId(error: error)
            }
            it("ユーザIDが16桁以下の英数字だったらtrueが返却されること") {
                expect(self.subject!.validate(input: "1234567890AbCdEf")).to(beTrue())
            }
            it("ユーザIDに英数字以外の値が含まれていた場合falseが返却されること") {
                expect(self.subject!.validate(input: "?234567890AbCdEf")).to(beFalse())
                expect(self.subject!.validate(input: "あ34567890AbCdEf")).to(beFalse())
            }
            it("ユーザIDが英数字17桁以上だった場合falseが返却されること") {
                expect(self.subject!.validate(input: "1234567890AbCdEfG")).to(beFalse())
            }
            it("ユーザIDがnilだったらfalseが返却されること") {
                expect(self.subject!.validate(input: nil)).to(beFalse())
            }
        }
    }
}
