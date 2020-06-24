//
//  MovieMasterDetailTests.swift
//  MovieMasterDetailTests
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest
@testable import MovieMasterDetail

class MovieMasterDetailTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchJsonFromLocalFile() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "movies", withExtension: "json") else {
            XCTFail("Missing file: movies.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        
        //XCTAssertEqual(user.age, 29)
    }
    
}
