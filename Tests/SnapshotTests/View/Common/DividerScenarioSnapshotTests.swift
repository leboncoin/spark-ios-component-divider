//
//  DividerScenarioSnapshotTestsTests.swift
//  SparkDividerSnapshotTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

@testable import SparkDivider
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting
import UIKit
import SwiftUI

enum DividerScenarioSnapshotTests: String, CaseIterable {
    case test1

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) -> [DividerConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1(isSwiftUIComponent: isSwiftUIComponent)
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: TODO:
    ///
    /// Content:
    ///  - TODO:
    private func test1(isSwiftUIComponent: Bool) -> [DividerConfigurationSnapshotTests] {
        let intents = DividerIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                modes: Constants.Modes.all,
                sizes: Constants.Sizes.default
            )
        }
    }
}
