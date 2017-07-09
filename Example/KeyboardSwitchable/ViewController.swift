//
//  ViewController.swift
//  KeyboardSwithable
//
//  Created by wangxiaotao on 07/09/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import KeyboardSwitchable

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emojiView = ISEmojiView()
        //        emojiView.delegate = self
        textView.inputView = emojiView
        textView.keyboardGroups = [emojiView, nil]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
    }
    
    //MARK: <ISEmojiViewDelegate>
    
    func emojiViewDidSelectEmoji(emojiView: ISEmojiView, emoji: String) {
        textView.insertText(emoji)
    }
    
    func emojiViewDidPressDeleteButton(emojiView: ISEmojiView) {
        textView.deleteBackward()
    }
    
    @IBAction func clickButton(sender: Any) {
        
        textView.switchKeyboard()
        
        //        let view = ISEmojiView()
        //        view.setNeedsLayout()
        //        view.layoutIfNeeded()
        //        UIView.animate(withDuration: 0.2) {
        //            if self.textView.inputView == nil {
        //                self.textView.inputView = view
        //                self.textView.reloadInputViews()
        //            } else {
        //                self.textView.inputView = nil
        //                self.textView.reloadInputViews()
        //            }
        //        }
    }
}

