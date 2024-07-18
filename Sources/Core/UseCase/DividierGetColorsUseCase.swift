//
//  DividerViewModel.swift
//  SparkDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
protocol DividierGetColorsUseCasable {
    func execute(
        colors: Colors,
        intent: DividerIntent
    ) -> DividerColors
}

struct DividerGetColorsUseCase: DividierGetColorsUseCasable {
    func execute(colors: any SparkTheming.Colors, intent: DividerIntent) -> DividerColors {
        let textColor = colors.base.onSurface
        let separatorColor: any ColorToken
        switch intent {
        case .outline:
            separatorColor = colors.base.outline
        case .outlineHigh:
            separatorColor = colors.base.outlineHigh
        }
        return .init(
            text: textColor,
            separator: separatorColor
        )
    }
}
