//
//  HapticFeedbackControl.swift
//  HapticFeedback
//
//  Created by Egor Iskrenkov on 9/23/20.
//

import Foundation

extension UIControl {

    public func setFeedback(type: HapticGenerator.FeedbackType, for events: UIControl.Event = .touchDown) {
        let hapticResponder = HapticResponder(type)

        addTarget(hapticResponder, action: #selector(hapticResponder.respond), for: events)
        setAssociated(object: hapticResponder)
    }

    private func setAssociated(object: Any) {
        objc_setAssociatedObject(self, UUID().uuidString, object, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
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
