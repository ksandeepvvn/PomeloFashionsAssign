//
//  PMResultTest.swift
//  Pomelo FashionsTests
//
//  Created by Kamarajugadda Veera vekata naga sandeep on 11/02/22.
//
import Foundation

@testable import Pomelo_Fashions
import XCTest

class NYTimesResultTest: XCTestCase {
    var result: NYTimesResult?
    override func setUp() {
        result = Bundle.helperBundle.mockNews.objectFromPath(object: NYTimesResult.self)
    }

    override func tearDown() {
        result = nil
    }

    func testObject() {
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.result.count, 10)

        let description = "Federal prosecutors say a Russian government official recruited a Mexican citizen to photograph a U.S. government source’s vehicle."
        let headline = "Mexican Citizen Is Accused of Spying for Russians in the U.S."
        let imageUrl = "images/2020/02/19/multimedia/19xp-spy/merlin_168923481_b9f549a6-0620-404f-b136-5f4c91943247-articleLarge.jpg"
        let webUrl = "https://www.nytimes.com/2020/02/19/us/hector-alejandro-cabrera-fuentes-spying-russia.html"

        let firstObject = result?.result.first
        XCTAssertNotNil(firstObject)
        XCTAssertEqual(firstObject?.description, description)
        XCTAssertEqual(firstObject?.headline, headline)
        XCTAssertEqual(firstObject?.webURL, webUrl)
        XCTAssertEqual(firstObject?.imageURL, imageUrl)
    }

    func testMapping_toNewsListItem() {
        let list = result?.toNewsListItem()
        XCTAssertNotNil(list)
        XCTAssertEqual(list?.count, result?.result.count)
    }
}

