//
//  Calculator.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/13/25.
//

import Foundation

struct Calculator {
    
    private struct ArithmeticExpression: Equatable {
        var number: Decimal
        var operation: ArithmeticOperation
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operation {
            case .addition:
                return number + secondNumber
            case .subtraction:
                return number - secondNumber
            case .multiplication:
                return number * secondNumber
            case .division:
                return number / secondNumber
            }
        }
    }
    
    
    // MARK: - PROPERTIES
    private var newNumber: Decimal?
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    
    
    // MARK: - COMPUTED PROPERTIES
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    /// Current displaying number
    private var number: Decimal? {
        newNumber ?? expression?.number ?? result
    }
    
    
    // MARK: - OPERATIONS
    mutating func setDigit(_ digit: Digit) {
        // 1. Check if you can add digit (01 should not be possible)
        guard canAddDigit(digit) else { return }
        
        // 2. Convert newNumber Decimal to a String
        let numberString = getNumberString(forNumber: newNumber)
        
        // 3. Append digit to end of string,
        //    convert string back to Decimal,
        //    assign its new value to newNumber
        newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        
    }
    
    mutating func setOperation(_ operation: ArithmeticOperation) {
        // 1. Check if there is usable number (newNumber or previous result),
        // and assign to new variable number
        guard var number = newNumber ?? result else { return }
        
        // 2. Check if there is already existingExpression.
        // If there is, evaluate using number number and assign result to number
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        
        // 3. Assign new ArithmeticExpression with number and operation to expression
        expression = ArithmeticExpression(number: number, operation: operation)
        
        // 4. Reset newNumber
        newNumber = nil
    }
    
    mutating func toggleSign() {
        
    }
    
    mutating func setPercent() {
        
    }
    
    mutating func setDecimal() {
        
    }
    
    mutating func evaluate() {
        
    }
    
    mutating func allClear() {
        
    }
    
    mutating func clear() {
        
    }
    
    
    // MARK: - HELPERS
    func operationIsHighlighted(_ operation: ArithmeticOperation) -> Bool {
        return expression?.operation == operation && newNumber == nil
    }
    
    private func getNumberString(forNumber number: Decimal?, withCommas: Bool = false) -> String {
        return (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
    }
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
}
