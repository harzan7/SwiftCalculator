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
                        size: getButtonSize(),
                        backgroundColor: buttonType.backgroundColor,
                        foregroundColor: buttonType.foregroundColor))
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
    }
}

#Preview {
    CalculatorView.CalculatorButton(
        buttonType: .digit(.five))
}
