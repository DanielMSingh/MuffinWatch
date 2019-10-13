//
//  MuffinTests.swift
//  MuffinTests
//
//  Created by Daniel Singh on 10/1/19.
//  Copyright © 2019 Daniel Singh. All rights reserved.
//

import XCTest
@testable import Muffin

class MuffinTests: XCTestCase {

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
    //pastry initialisation tests:
    func testPastryInitFail(){
        let namelessPastry = Pastry.init(Item_name:"", Item_quantity:0, Item_description:"Nameless", Item_pic:nil,Bake_time:5.00)
        XCTAssertNil(namelessPastry)
        let noDescriptionPastry = Pastry.init(Item_name:"noDescription", Item_quantity:0, Item_description:"", Item_pic:nil, Bake_time:5.00)
        XCTAssertNil(noDescriptionPastry)
        let negativeQuantity = Pastry.init(Item_name:"negativeQ", Item_quantity:-1,Item_description: "less than 0", Item_pic:nil, Bake_time:5.00)
        XCTAssertNil(negativeQuantity)
        let negativeTime = Pastry.init(Item_name: "-Time", Item_quantity: 0, Item_description: "-Time", Item_pic: nil, Bake_time:-0.1)
        XCTAssertNil(negativeTime)
    }
    func testPastryInitSucceed(){
        let goodPastry = Pastry.init(Item_name:"Goodone", Item_quantity:0, Item_description:"the good one", Item_pic: nil, Bake_time:5.00)
        XCTAssertNotNil(goodPastry)
    }

}
