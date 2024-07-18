//
//  DividerConfigurationSnapshotTests.swift
//  SparkDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import UIKit
@testable import SparkDivider
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

struct DividerConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: DividerScenarioSnapshotTests

    let intent: DividerIntent
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)"
        ].joined(separator: "-")
    }
}
