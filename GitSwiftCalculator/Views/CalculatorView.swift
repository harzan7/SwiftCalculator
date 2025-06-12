//
//  CalculatorView.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/9/25.
//

import SwiftUI


// MARK: - BODY
struct CalculatorView: View {
    var buttonTypes: [[ButtonType]] {
        [
            [.allClear, .negative, .percent, .operation(.division)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operation(.multiplication)],
            [.digit(.four), .digit(.five), .digit(.six), .operation(.subtraction)],
            [.digit(.one), .digit(.two), .digit(.three), .operation(.addition)],
            [.digit(.zero), .decimal, .equals],
        ]
    }
    
    var body: some View {
        VStack {
            // Spacer
            Spacer()
            
            // DisplayText
            Text("0")
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .font(.system(size: 88, weight: .light))
                .lineLimit(1)
                .minimumScaleFactor(0.2)
                .padding()
            
            // ButtonPad
            VStack {
                ForEach(buttonTypes, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { buttonType in
                            Button(buttonType.description) { }
                        }
                    }
                }
            }
        }
        .background(Color.black)
    }
}


// MARK: - PREVIEWS
#Preview {
    CalculatorView()
}


// MARK: - COMPONENTS
