//
//  CalculatorButtonStyle.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/11/25.
//

import SwiftUI

struct CalculatorButtonStyle: ButtonStyle {
    var size: CGFloat
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(
                .system(
                    size: 32,
                    weight: .medium))
            .frame(
                width: size,
                height: size)
            .background(backgroundColor)
            .foregroundStyle(foregroundColor)
            .overlay {
                if configuration.isPressed {
                    Color(
                        white: 1.0,
                        opacity: 0.2)
                }
            }
            .clipShape(Capsule())
    }
}

#Preview {
    let buttonType: ButtonType = .digit(.four)
    
    Button(buttonType.description) { }
        .buttonStyle(
            CalculatorButtonStyle(
                size: 80,
                backgroundColor: buttonType.backgroundColor,
                foregroundColor: buttonType.foregroundColor)
            )
}
