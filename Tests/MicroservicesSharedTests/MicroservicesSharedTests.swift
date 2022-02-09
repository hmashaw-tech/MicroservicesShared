import XCTest
@testable import MicroservicesShared

final class MicroservicesSharedTests: XCTestCase {
    
    func testDemoService() throws {
        XCTAssertEqual(DemoService.performServiceAction(), "🎁 Service action was performed 🎁")
    }
}

