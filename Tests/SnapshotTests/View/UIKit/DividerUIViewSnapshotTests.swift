//
//  DividerUIViewSnapshotTests.swift
//  SparkComponentDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkTheme
@testable import SparkTheming
@_spi(SI_SPI) @testable import SparkCommon
@_spi(SI_SPI) @testable import SparkCommonTesting
@_spi(SI_SPI) @testable import SparkCommonSnapshotTesting

@testable import SparkComponentDivider

final class DividerUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    private let theme: any Theme = SparkTheme.shared

    func test1() {
        self._test(.test1)
    }

    func test2() {
        self._test(.test2)
    }

    func test3() {
        self._test(.test3)
    }

    func test4() {
        self._test(.test4)
    }

    private func _test(_ scenario: DividerScenario) {
        for configuration in scenario.configurations {
            let view = DividerUIView(
                theme: self.theme,
                intent: configuration.intent
            )
            view.translatesAutoresizingMaskIntoConstraints = false

            view.alignment = configuration.alignment
            view.axis = configuration.axis

            if let textSize = configuration.textSize {
                view.showLabel = true
                view.label.text = textSize.text
                view.label.numberOfLines = textSize == .longMultiline ? 0 : 1
            }

            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.backgroundColor = self.theme.colors.base.background.uiColor
            containerView.addSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
                view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
                view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            ])

            if view.axis == .vertical {
                view.heightAnchor.constraint(equalToConstant: 300).isActive = true
                view.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
            } else {
                view.widthAnchor.constraint(equalToConstant: 300).isActive = true
            }

            self.assertSnapshot(
                matching: containerView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }

    }
}
