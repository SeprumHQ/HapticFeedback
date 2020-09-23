//
//  HapticGenerator.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 9/23/20.
//

import Foundation

public struct HapticGenerator {

    public static var enabled = true

    public enum FeedbackType {
        case impact(UIImpactFeedbackGenerator.FeedbackStyle)
        case notification(UINotificationFeedbackGenerator.FeedbackType)
        case selection
    }

    public var type: FeedbackType

    public init(_ type: FeedbackType) {
        self.type = type
    }

    public static func perform(_ type: FeedbackType) {
        HapticGenerator(type).perform()
    }

    public func perform() {
        guard HapticGenerator.enabled else { return }

        switch self.type {
        case .impact(let style):
            let generator = UIImpactFeedbackGenerator(style: style)

            generator.prepare()
            generator.impactOccurred()
        case .notification(let type):
            let generator = UINotificationFeedbackGenerator()

            generator.prepare()
            generator.notificationOccurred(type)
        case .selection:
            let generator = UISelectionFeedbackGenerator()

            generator.prepare()
            generator.selectionChanged()
        }
    }

}
