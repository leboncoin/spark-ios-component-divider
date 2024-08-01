//
//  DividerView.swift
//  SparkDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Adevinta. All rights reserved.
//

import SwiftUI
import Combine
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// The SwiftUI version of the divider.
public struct DividerView: View {

    @ObservedObject private var viewModel: DividerViewModel

    private let axis: DividerAxis
    private let alignment: DividerAlignment

    private let text: Text?

    @ScaledMetric var scaleFactor = 1.0
    private var scaledHeight: CGFloat {
        return DividerConstants.height * self.scaleFactor
    }

    /// Initialize a new divider view without text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    public init(
        theme: Theme,
        intent: DividerIntent,
        axis: DividerAxis = .horizontal,
        alignment: DividerAlignment = .center
    ) {
        let viewModel = DividerViewModel(theme: theme, intent: intent)
        self.viewModel = viewModel
        self.axis = axis
        self.alignment = alignment
        self.text = nil
    }

    /// Initialize a new divider view with a text.
    /// - Parameters:
    ///   - theme: The spark theme of the divider.
    ///   - intent: The intent of the divider.
    ///   - axis: The axis of the divider. The default is ``.horizontal``.
    ///   - alignment: The alignment of the divider. The default is ``.center``.
    ///   - text: Text to show inbetween separators. Its `.foregroudColor` and `.font` will be overriden by Spark.
    public init(
        theme: Theme,
        intent: DividerIntent,
        axis: DividerAxis,
        alignment: DividerAlignment,
        text: Text
    ) {
        let viewModel = DividerViewModel(theme: theme, intent: intent)
        self.viewModel = viewModel
        self.axis = axis
        self.alignment = alignment
        self.text = text
    }

    public var body: some View {
        if axis == .horizontal {
            horizontalDivider()
        } else {
            verticalDivider()
        }
    }

    @ViewBuilder
    private func styledText() -> some View {
        text
            .foregroundColor(viewModel.textColor.color)
            .font(viewModel.textFont.font)
            .layoutPriority(2)
    }

    // MARK: - Horizontal
    @ViewBuilder
    private func horizontalDivider() -> some View {
        HStack(spacing: viewModel.spacing) {
            let firstSeparator = horizontalSeparator()

            if text != nil {
                firstSeparator
                    .frame(maxWidth: alignment == .leading ? DividerConstants.minimumWidth : .infinity)

                styledText()

                horizontalSeparator()
                    .frame(maxWidth: alignment == .trailing ? DividerConstants.minimumWidth : .infinity)
            } else {
                firstSeparator
            }
        }
    }

    @ViewBuilder
    private func horizontalSeparator() -> some View {
        viewModel.separatorColor.color
            .frame(height: scaledHeight)
            .frame(minWidth: DividerConstants.minimumWidth)
    }

    // MARK: - Vertical
    @ViewBuilder
    private func verticalDivider() -> some View {
        VStack(spacing: viewModel.spacing) {
            let firstSeparator = verticalSeparator()

            if let text {
                firstSeparator
                    .frame(maxHeight: alignment == .top ? DividerConstants.minimumWidth : .infinity)

                styledText()

                verticalSeparator()
                    .frame(maxHeight: alignment == .bottom ? DividerConstants.minimumWidth : .infinity)
            } else {
                firstSeparator
            }
        }
    }

    @ViewBuilder
    private func verticalSeparator() -> some View {
        viewModel.separatorColor.color
            .frame(width: scaledHeight)
            .frame(minHeight: DividerConstants.minimumWidth)
    }
}
