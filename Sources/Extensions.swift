//
//  Extensions.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 9/26/20.
//

import Foundation

extension UIControl.Event: Hashable {
    
    public var hashValue: Int {
        return Int(rawValue)
    }

}
