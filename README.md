# XCTAssertResult

A tiny helper-library that serves as an addition to the `XCTest` framework and provides a handy way to create assertions for `Result<Success, Failure>` types in your swift test-cases.   

## Available assertions

#### Assert your result to be successful:
```swift
public func XCTAssertResultSuccess<Success, Failure>(_ expression: @autoclosure () -> Result<Success, Failure>,
                                                     _ message: @autoclosure () -> String = "",
                                                     file: StaticString = #file,
                                                     line: UInt = #line)
```
* **expression** – an expression that is asserted to be successful;
* **message** – message: additional failure message, shall the assertion fail;
* **file** – a file that contains a test-case with the assertion;
* **line** – a line number where the assertion was invocate;

#### Assert your result to be faulty:
```swift
public func XCTAssertResultFailure<Success, Failure>(_ expression: @autoclosure () -> Result<Success, Failure>,
                                                     _ message: @autoclosure () -> String = "",
                                                     file: StaticString = #file,
                                                     line: UInt = #line)
```
* **expression** – an expression that is asserted to be faulty;
* **message** – message: additional failure message, shall the assertion fail;
* **file** – a file that contains a test-case with the assertion;
* **line** – a line number where the assertion was invocate;

#### Assert your result to be equal to:
Depending on the expected value, one of the following functions will be chosen:
```swift
public func XCTAssertResultEqual<Success: Equatable, Failure>(_ expectedValue: @autoclosure () -> Success,
                                                              _ expression: @autoclosure () -> Result<Success, Failure>,
                                                              _ message: @autoclosure () -> String = "",
                                                              file: StaticString = #file,
                                                              line: UInt = #line)
```
– to assert successful results to be equal, or:
```swift
public func XCTAssertResultEqual<Success, Failure: Equatable>(_ expectedFailure: @autoclosure () -> Failure,
                                                              _ expression: @autoclosure () -> Result<Success, Failure>,
                                                              _ message: @autoclosure () -> String = "",
                                                              file: StaticString = #file,
                                                              line: UInt = #line)
```
, where:  
* **expectedValue** – contents of `.success(Success)` or `.failure(Failure)` case of your `Result<Success, Failure>` type;
* **expression** – an expression that is asserted to be faulty or successful;
* **message** – message: additional failure message, shall the assertion fail;
* **file** – a file that contains a test-case with the assertion;
* **line** – a line number where the assertion was invocate;

## Installation
### Swift Package Manager (SPM)
{To be defined}
### Bazel
{To be defined}
