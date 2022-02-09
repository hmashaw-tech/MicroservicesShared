import XCTest
@testable import MicroservicesShared

final class MicroservicesSharedTests: XCTestCase {
    
    func testDemoService() throws {
        XCTAssertEqual(DemoService.performServiceAction(), "\n🎁 DemoService action was performed 🎁\n")
    }
    
    func testGetRandomBytes() throws {
        XCTAssertEqual(Utils.getRandomBytes().count, 8)
    }
}

