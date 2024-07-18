//
//  DividerUIViewSnapshotTests.swift
//  SparkDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import XCTest
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@testable import SparkDivider

final class DividerUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

//    func test() {
//        let scenarios = DividerScenarioSnapshotTests.allCases
//
//        for scenario in scenarios {
//            let configurations = scenario.configuration(isSwiftUIComponent: false)
//            for configuration in configurations {
//
//                let view = DividerUIView(
//                    theme: self.theme,
//                    intent: configuration.intent
//                )
//                view.translatesAutoresizingMaskIntoConstraints = false
//
//                self.assertSnapshot(
//                    matching: view,
//                    modes: configuration.modes,
//                    sizes: configuration.sizes,
//                    testName: configuration.testName()
//                )
//            }
//        }
//    }
}
