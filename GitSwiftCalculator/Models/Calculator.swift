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
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
        }
    }
    private var expression: ArithmeticExpression?
    private var result: Decimal?
    private var carryingNegative: Bool = false
    private var carryingDecimal: Bool = false
    private var carryingZeroCount: Int = 0
    
    
    // MARK: - COMPUTED PROPERTIES
    var displayText: String {
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    /// Current displaying number
    private var number: Decimal? {
        newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    
    // MARK: - OPERATIONS
    mutating func setDigit(_ digit: Digit) {
        if containsDecimal && digit == .zero {
            carryingZeroCount += 1
        } else if canAddDigit(digit) {
            let numberString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        }
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
        if let number = newNumber {
            newNumber = -number
            return
        }
        
        if let number = result {
            result = -number
            return
        }
        
        carryingNegative.toggle()
    }
    
    mutating func setPercent() {
        // 1. check if newNumber is currently used
        if let number = newNumber {
            // 2. divide by 100 and assign the new value
            newNumber = number / 100
            return
        }
        
        // 1. check if result is currently used
        if let number = result {
            // 2. divide by 100 and assign the new value
            result = number / 100
            return
        }
    }
    
    mutating func setDecimal() {
        // 1. Check if number already contains a decimal. If it does, return
        if containsDecimal { return }
        
        // 2. Make the carryingDecimal property true
        carryingDecimal = true
    }
    
    mutating func evaluate() {
        // 1. unwrap newNumber and expression (contains the previous number and operation)
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        
        // 2. evaluate expression with newNumber and assign to result
        result = expressionToEvaluate.evaluate(with: number)
        
        // 3. Reset expression and newNumber
        expression = nil
        newNumber = nil
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
        var numberString = (withCommas ? number?.formatted(.number) : number.map(String.init)) ?? "0"
        
        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        
        if carryingDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        
        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        
        return numberString
    }
    
    private func canAddDigit(_ digit: Digit) -> Bool {
        return number != nil || digit != .zero
    }
}
