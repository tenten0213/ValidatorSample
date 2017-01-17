//
//  ValidationErrorType.swift
//  ValidatorSample
//
import Foundation

struct ValidationError: Error {
    public let message: String
    public init(message errorMessage: String) {
        message = errorMessage
    }
}
