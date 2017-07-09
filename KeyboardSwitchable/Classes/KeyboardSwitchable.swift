//
//  KeyboardSwitchable.swift
//  ISEmojiViewExample
//
//  Created by 王小涛 on 2017/7/8.
//
//

import UIKit

public protocol KeyboardConvertible: class {
    var keyboardView: UIView {get}
    var textInput: UITextInput? {get set}
}

public protocol KeyboardSwitchable: UITextInput {
    /// inputView should be a weak refrence.
    var inputView: UIView? {get set}
    func reloadInputViews()
}

extension KeyboardSwitchable {
    
    /// nil for system default keyboard
    func switchToKeyboard(_ keyboard: KeyboardConvertible?) {
        keyboard?.textInput = self
        keyboard?.keyboardView.setNeedsLayout()
        keyboard?.keyboardView.layoutIfNeeded()
        UIView.animate(withDuration: 0.2) {
            self.inputView = keyboard?.keyboardView
            self.reloadInputViews()
        }
    }
}

extension UITextField: KeyboardSwitchable {}
extension UITextView: KeyboardSwitchable {}
