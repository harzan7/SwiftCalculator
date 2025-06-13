//
//  CalculatorButton.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/12/25.
//

import SwiftUI

extension CalculatorView {
    struct CalculatorButton: View {
        let buttonType: ButtonType
        
        var body: some View {
            Button(buttonType.description) { }
                .buttonStyle(
                    CalculatorButtonStyle(
                        size: 80,
                        backgroundColor: buttonType.backgroundColor,
                        foregroundColor: buttonType.foregroundColor))
        }
    }
}

#Preview {
    CalculatorView.CalculatorButton(
        buttonType: .digit(.five))
}
