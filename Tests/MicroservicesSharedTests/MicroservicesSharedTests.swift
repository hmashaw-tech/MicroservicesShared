import XCTest
@testable import MicroservicesShared

final class MicroservicesSharedTests: XCTestCase {
    
    func testBannerService() throws {
        XCTAssertEqual(BannerService.performServiceAction("DemoService"), "\n🎁 DemoService action performed 🎁\n")
    }
    
    func testGetRandomBytes() throws {
        XCTAssertEqual(Utils.getRandomBytes().count, 8)
    }
}

