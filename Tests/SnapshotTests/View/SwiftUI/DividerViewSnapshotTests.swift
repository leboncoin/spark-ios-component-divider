//
//  DividerViewSnapshotTests.swift
//  SparkDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@testable import SparkDivider

final class DividerViewSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: Theme = SparkTheme.shared

    // MARK: - Tests

    func test1() {
        self._test(.test1)
    }

    func test2() {
        self._test(.test2)
    }

    func test3() {
        self._test(.test3)
    }

    private func _test(_ scenario: DividerScenario) {
        for configuration in scenario.configurations {
            let view: DividerView
            if let textSize = configuration.textSize {
                view = DividerView(
                    theme: self.theme,
                    intent: configuration.intent,
                    axis: configuration.axis,
                    alignment: configuration.alignment,
                    text: {
                        Text(textSize.text)
                    }
                )
            } else {
                view = DividerView(
                    theme: self.theme,
                    intent: configuration.intent,
                    axis: configuration.axis,
                    alignment: configuration.alignment
                )
            }

            self.assertSnapshot(
                matching: self.viewWithFrame(
                    view,
                    axis: configuration.axis
                )
                .multilineTextAlignment(.center)
                .lineLimit(configuration.textSize == .longMultiline ? nil : 1)
                .padding(.all, 12)
                .background(self.theme.colors.base.background.color)
                .fixedSize(),
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }

    @ViewBuilder
    private func viewWithFrame(_ view: some View, axis: DividerAxis) -> some View {
        switch axis {
        case .horizontal:
                view
            .frame(width: 300)
        case .vertical:
                view
            .frame(maxWidth: 200)
            .frame(height: 300)
        }
    }
}
