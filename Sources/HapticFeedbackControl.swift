//
//  HapticFeedbackControl.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 9/23/20.
//

import Foundation

private var registryKey: Void?

extension UIControl {

    public func setFeedback(type: HapticGenerator.FeedbackType, for event: UIControl.Event = .touchDown) {
        guard !self.hapticEventsRegistry.keys.contains(event) else { return }

        let hapticResponder = HapticResponder(type)

        self.hapticEventsRegistry[event] = hapticResponder
        addTarget(hapticResponder, action: #selector(hapticResponder.respond), for: event)
    }

    public func removeFeedback(type: HapticGenerator.FeedbackType, from event: UIControl.Event = .touchDown) {
        guard let hapticResponder = hapticEventsRegistry[event] else { return }

        hapticEventsRegistry[event] = nil
        removeTarget(hapticResponder, action: #selector(hapticResponder.respond), for: event)
    }

    // Stores haptic responders for each registered haptic event
    private var hapticEventsRegistry: [UIControl.Event: HapticResponder] {
        get { return getAssociatedObject(&registryKey) ?? [:] }
        set { setAssociatedObject(&registryKey, newValue) }
    }

}

private class HapticResponder {

    let haptic: HapticGenerator

    init(_ type: HapticGenerator.FeedbackType) {
        self.haptic = HapticGenerator(type)
    }

    @objc func respond(_ sender: Any) {
        haptic.perform()
    }

}
