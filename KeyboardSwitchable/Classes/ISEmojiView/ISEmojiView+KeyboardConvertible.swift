//
//  ISEmojiView+KeyboardConvertible.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/9.
//
//

import Foundation

extension ISEmojiView: KeyboardConvertible {
    public var keyboardView: UIView {
        return self
    }
}
