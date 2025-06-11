//
//  ButtonType.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/10/25.
//

import Foundation

enum ButtonType {
    case digit(_ digit: Digit)
    case operation(_ operation: ArithmeticOperation)
    case negative
    case percent
    case decimal
    case equals
    case allClear
    case clear
}
