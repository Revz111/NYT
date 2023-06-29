//
//  NYT_SampleTests.swift
//  NYT_SampleTests
//
//  Created by Revathy Vinod on 27/06/2023.
//

import XCTest
@testable import NYT_Sample

final class NYT_SampleTests: XCTestCase {
    
    var manager: NetworkManager!
    
    override func setUpWithError() throws {
        manager = NetworkManager.shared
    }

    override func tearDownWithError() throws {
    }

    func testFetchpopularNewsSuccess() async throws {
        manager.apiKey = "iTa359tg35Xg63H2D0b2D50limIBpI9o"
        manager.fetchPopularNews { (response, error) in
            if let news =  response as? [News] {
                XCTAssertEqual(news.count, 20)
            } else {
                XCTFail("Error happens")
            }
        }
    }
    
    func testFetchpopularNewsInvalidApiKey() async throws {
        manager.apiKey = "iTa359tg35Xg63H2D0b2D50limIBpI9ott"
        manager.fetchPopularNews { (response, error) in
            if let news =  response as? [News] {
                XCTFail("Returns success when it should be error.")
            } else {
                XCTAssert(true)
            }
        }
    }

}
