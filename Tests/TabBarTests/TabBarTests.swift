import XCTest
@testable import TabBar

final class TabBarTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TabBar().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
