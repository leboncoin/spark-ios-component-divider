//
//  DividerGetColorsUseCaseTests.swift
//  SparkDividerTests
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
import Combine
import SparkTheming

@_spi(SI_SPI) import SparkDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkDivider

final class DividerGetColorsUseCaseTests: XCTestCase {

    func test_execute_outline() {
        // GIVEN
        let useCase = DividerGetColorsUseCase()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .outline)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.base.onSurface), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.base.outline), "Wrong separator color")
    }

    func test_execute_outlineHigh() {
        // GIVEN
        let useCase = DividerGetColorsUseCase()
        let colors = ColorsGeneratedMock.mocked()

        // WHEN
        let dividerColors = useCase.execute(colors: colors, intent: .outlineHigh)

        // THEN
        XCTAssertTrue(dividerColors.text.equals(colors.base.onSurface), "Wrong text color")
        XCTAssertTrue(dividerColors.separator.equals(colors.base.outlineHigh), "Wrong separator color")
    }

}
