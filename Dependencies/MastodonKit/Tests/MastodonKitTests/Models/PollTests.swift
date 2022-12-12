//
//  PollTests.swift
//  MastodonKit
//
//  Created by Bruno Philipe on 03/05/19.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

import XCTest
@testable import MastodonKit

class PollTests: XCTestCase {
    func testPollFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Poll.json")
        let poll = try? Poll.decode(data: fixture)

        XCTAssertEqual(poll?.id, "6")
        XCTAssertEqual(poll?.expiresAt?.timeIntervalSince1970, 1552329217.947)
        XCTAssertEqual(poll?.expired, false)
        XCTAssertEqual(poll?.multiple, false)
        XCTAssertEqual(poll?.votesCount, 63)
        XCTAssertEqual(poll?.voted, false)
        XCTAssertEqual(poll?.options.count, 2)
        XCTAssertEqual(poll?.options.first?.title, "Alpha")
        XCTAssertEqual(poll?.options.first?.votesCount, 26)
        XCTAssertEqual(poll?.options.last?.title, "Beta")
        XCTAssertEqual(poll?.options.last?.votesCount, 37)
    }

    func testPollWithInvalidData() {
        let poll = try? Poll.decode(data: Data())

        XCTAssertNil(poll)
    }
}
