//
//  DividerConfigurationSnapshotTests.swift
//  SparkComponentDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentDivider
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

struct DividerScenarioConfiguration: CustomStringConvertible {

    enum TextSize: String, CaseIterable {
        case short
        case longSingleLine = "singleLine"
        case longMultiline = "multiline"

        var text: String {
            return switch self {
            case .short:
                "text"
            case .longSingleLine, .longMultiline:
                "This is a long text, it should probably be multilined"
            }
        }

    }

    let description: String
    let intent: DividerIntent
    let alignment: DividerAlignment
    let axis: DividerAxis
    let textSize: TextSize?
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    var testName: String {
        return "\(self)-\(self.intent)-\(self.alignment)-\(self.axis)-\(self.textSize?.rawValue ?? "empty")"
    }
}

enum DividerScenario: String {
    case test1
    case test2
    case test3
    case test4

    var configurations: [DividerScenarioConfiguration] {
        switch self {
        case .test1:
            return self.createTest1Configurations()
        case .test2:
            return self.createTest2Configurations()
        case .test3:
            return self.createTest3Configurations()
        case .test4:
            return self.createTest4Configurations()
        }
    }

    private func createTest1Configurations() -> [DividerScenarioConfiguration] {
        var configurations = [DividerScenarioConfiguration]()
        for axis in DividerAxis.allCases {
            configurations.append(
                .init(
                    description: self.rawValue,
                    intent: .outlineHigh,
                    alignment: .center,
                    axis: axis,
                    textSize: nil,
                    modes: [.light],
                    sizes: [.accessibilityMedium]
                )
            )
        }
        return configurations
    }

    private func createTest2Configurations() -> [DividerScenarioConfiguration] {
        var configurations = [DividerScenarioConfiguration]()
        for textSize in DividerScenarioConfiguration.TextSize.allCases {
            for alignment in DividerAlignment.allCases {
                for axis in DividerAxis.allCases {
                    if axis == .vertical && [.leading, .trailing].contains(alignment) ||
                        axis == .horizontal && [.top, .bottom].contains(alignment) {
                        continue
                    }
                    configurations.append(
                        .init(
                            description: "test2",
                            intent: .outlineHigh,
                            alignment: alignment,
                            axis: axis,
                            textSize: textSize,
                            modes: [.dark],
                            sizes: [.accessibilityMedium]
                        )
                    )
                }
            }
        }
        return configurations
    }

    private func createTest3Configurations() -> [DividerScenarioConfiguration] {
        var configurations = [DividerScenarioConfiguration]()
        for axis in DividerAxis.allCases {
            configurations.append(
                .init(
                    description: "test3",
                    intent: .outline,
                    alignment: .center,
                    axis: axis,
                    textSize: .longSingleLine,
                    modes: [.light],
                    sizes: [.accessibilityExtraExtraLarge]
                )
            )
        }
        return configurations
    }

    private func createTest4Configurations() -> [DividerScenarioConfiguration] {
        var configurations = [DividerScenarioConfiguration]()
        for intent in DividerIntent.allCases {
            configurations.append(
                .init(
                    description: "test4",
                    intent: intent,
                    alignment: .center,
                    axis: .horizontal,
                    textSize: .longSingleLine,
                    modes: [.light],
                    sizes: [.accessibilityMedium]
                )
            )
        }
        return configurations
    }
}
