//
//  DividierGetColorsUseCasableGeneratedMock+ExtensionTests.swift
//  SparkComponentDividerTests
//
//  Created by louis.borlee on 18/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import SparkTheming
@testable @_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentDivider

public extension DividierGetColorsUseCasableGeneratedMock {
    static func mocked(
        textColor: any ColorToken = ColorTokenGeneratedMock.blue(),
        separatorColor: any ColorToken = ColorTokenGeneratedMock.red()
    ) -> DividierGetColorsUseCasableGeneratedMock {
        let mock = DividierGetColorsUseCasableGeneratedMock()
        mock.executeWithColorsAndIntentReturnValue = .init(text: textColor, separator: separatorColor)
        return mock
    }
}
