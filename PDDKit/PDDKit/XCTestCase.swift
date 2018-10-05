//
//  XCTestCase.swift
//  Support
//
//  Created by Henrik on 2017-09-11.
//

#if arch(i386) || arch(x86_64)
import XCTest

public extension XCTestCase {
    /**
     Runs a test case defined in a playground
     
          class TestCase: XCTestCase {
              func testCase() {
                  XCTFail()
              }
          }
          TestCase.run()
     */
    public class func run() {
        defaultTestSuite.run()
    }
}
#else
#endif
