//
//  Digit.swift
//  GitSwiftCalculator
//
//  Created by Harza on 6/10/25.
//

import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
