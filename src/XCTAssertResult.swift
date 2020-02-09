//
//  XCTAssertResult.swift
//  XCTAssertResult
//
//  Created by Alex Apriamashvili on 09/02/2020.
//

import XCTest

// MARK: - Custom Assertions

/// assert result to be successful
/// - parameter expression: an expression that is asserted to be successful
/// - parameter message: additional failure message
/// - parameter file: assertion test file
/// - parameter line: assertion line number
public func XCTAssertResultSuccess<Success, Failure>(_ expression: @autoclosure () -> Result<Success, Failure>,
                                                     _ message: @autoclosure () -> String = "",
                                                     file: StaticString = #file,
                                                     line: UInt = #line) {
  XCTAssertNotNil(expression().success(), message(), file: file, line: line)
}

/// assert result to be faulty
/// - parameter expression: an expression that is asserted to be faulty
/// - parameter message: additional failure message
/// - parameter file: assertion test file
/// - parameter line: assertion line number
public func XCTAssertResultFailure<Success, Failure>(_ expression: @autoclosure () -> Result<Success, Failure>,
                                                     _ message: @autoclosure () -> String = "",
                                                     file: StaticString = #file,
                                                     line: UInt = #line) {
  XCTAssertNotNil(expression().failure(), message(), file: file, line: line)
}

/// assert result to be successful and equal to the value specified
/// - parameter expectedValue: expected contents of the `.success(T)` case
/// - parameter expression: an expression that is asserted to be successful
/// - parameter message: additional failure message
/// - parameter file: assertion test file
/// - parameter line: assertion line number
public func XCTAssertResultEqual<Success: Equatable, Failure>(_ expectedValue: @autoclosure () -> Success,
                                                              _ expression: @autoclosure () -> Result<Success, Failure>,
                                                              _ message: @autoclosure () -> String = "",
                                                              file: StaticString = #file,
                                                              line: UInt = #line) {
  guard let value = expression().success() else { return XCTAssert(false, message(), file: file, line: line) }
  XCTAssertEqual(expectedValue(), value, message(), file: file, line: line)
}

/// assert result to be faulty and equal to a specific error
/// - parameter expectedFailure: expected contents of the `.failure(T)` case
/// - parameter expression: an expression that is asserted to be faulty
/// - parameter message: additional failure message
/// - parameter file: assertion test file
/// - parameter line: assertion line number
public func XCTAssertResultEqual<Success, Failure: Equatable>(_ expectedFailure: @autoclosure () -> Failure,
                                                              _ expression: @autoclosure () -> Result<Success, Failure>,
                                                              _ message: @autoclosure () -> String = "",
                                                              file: StaticString = #file,
                                                              line: UInt = #line) {
  guard let failure = expression().failure() else { return XCTAssert(false, message(), file: file, line: line) }
  XCTAssertEqual(expectedFailure(), failure, message(), file: file, line: line)
}

// MARK: - Result<Success, Failure> Categories

private extension Result {

  func success() -> Success? {
    guard case let .success(value) = self else { return nil }
    return value
  }

  func failure() -> Failure? {
    guard case let .failure(value) = self else { return nil }
    return value
  }
}
