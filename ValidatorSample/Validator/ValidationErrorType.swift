//
//  ValidationErrorType.swift
//  ValidatorSample
//
import Foundation

struct ValidationError: Error {
    public let errorMessage: String
    public init(errorMessage message: String) {
        errorMessage = message
    }
}
