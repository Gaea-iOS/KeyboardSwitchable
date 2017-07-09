//
//  KeyboardGroupSwitchable.swift
//  ISEmojiViewExample
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

public protocol KeyboardGroupSwitchable: KeyboardSwitchable {
    var keyboardGroups: [KeyboardConvertible?] {get set}
    func switchKeyboard()
}

private struct AssociatedObjectKey {
    static var keyboardGroups = "AssociatedObjectKey_keyboardGroups"
    static var selectedKeyboardIndex = "AssociatedObjectKey_selectedKeyboardIndex"
}

extension KeyboardGroupSwitchable {
    
    public var keyboardGroups: [KeyboardConvertible?] {
        get {
            if let group = objc_getAssociatedObject(self, &AssociatedObjectKey.keyboardGroups) as? [KeyboardConvertible?] {
                return group
            } else {
                return []
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.keyboardGroups, newValue, .OBJC_ASSOCIATION_RETAIN)
            switchToKeyboard(atIndex: 0)
        }
    }
    
    private var selectedKeyboardIndex: Int {
        get {
            if let index = objc_getAssociatedObject(self, &AssociatedObjectKey.selectedKeyboardIndex) as? Int {
                return index
            } else {
                return 0
            }
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectKey.selectedKeyboardIndex, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    public func switchKeyboard() {
        guard keyboardGroups.count > 0 else {return}
        let nextIndex: Int = {
            if selectedKeyboardIndex < keyboardGroups.count - 1 {
                return selectedKeyboardIndex + 1
            } else {
                return 0
            }
        }()
        switchToKeyboard(atIndex: nextIndex)
        selectedKeyboardIndex = nextIndex
    }
    
    private func switchToKeyboard(atIndex index: Int) {
        guard index >= 0 && index < keyboardGroups.count else {return}
        let keyboard = keyboardGroups[index]
        switchToKeyboard(keyboard)
    }
}

extension UITextField: KeyboardGroupSwitchable {}
extension UITextView: KeyboardGroupSwitchable {}

