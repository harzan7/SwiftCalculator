//
//  CalculatorView.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/9/25.
//

import SwiftUI


// MARK: - BODY
struct CalculatorView: View {
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(Constants.padding)
        .background(Color.black)
    }
}


// MARK: - PREVIEWS
#Preview {
    CalculatorView()
}


// MARK: - COMPONENTS
extension CalculatorView {
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundStyle(Color.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: Constants.padding) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in
                        CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}
