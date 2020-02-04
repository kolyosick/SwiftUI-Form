//
//  Extensions.swift
//  SwiftUI-Form
//
//  Created by Nikolay Alexeyev on 04.02.2020.
//  Copyright © 2020 kolyosick. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = try? NSRegularExpression(pattern: #".+@.+\..+"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
	
	func isValidPhone() -> Bool {
        let regex = try? NSRegularExpression(pattern: #"(([8]|\+7)(\d){10})"#, options: .caseInsensitive)
        return regex?.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
}
