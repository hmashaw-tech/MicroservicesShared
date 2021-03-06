import XCTest
@testable import MicroservicesShared

final class MicroservicesSharedTests: XCTestCase {
    
    func testBannerService() throws {
        XCTAssertEqual(BannerService.performServiceAction("DemoService"), "\nš DemoService :: action performed š\n")
    }
    
    func testGetRandomBytes() throws {
        print("Random bytes :: \(Utils.getRandomBytes())")
        XCTAssertEqual(Utils.getRandomBytes().count, 8)
    }
    
    func testGetRandomBytesLinux() throws {
        print("Random bytes Linux :: \(Utils.getRandomBytes())")
        XCTAssertEqual(Utils.getRandomBytes().count, 8)
    }
}

