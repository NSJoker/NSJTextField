//
//  NSJTextField.swift
//  NSJTextField
//
//  Created by NSJoker on 13/05/17.
//  Copyright © 2017 NSJoker. All rights reserved.
//

import UIKit

///A custom textfield with the placeholder displayed on top when text entered.
///   - **textField**: The UITextField where you can enter text. _Feel free to write your own delegates for this one_.
///
///   - **customTitleAttributedString**: In case you require custom attributes to your _title_.
///
///---
///ABOUT NSJTextField
///========
///**Created By** : _NSJoker_ [github](https://github.com/NSJoker)
///
///**Original Idea From** : [dribble.com](https://dribbble.com/shots/1254439--GIF-Float-Label-Form-Interaction)

public class NSJTextField: UIView {
    
    private let lblTitle = UILabel()
    private let animationDuration:Double = 0.25
    private let titleHeight:CGFloat = 10.0
    
    ///The UITextField where you can enter text. Feel free to write your own delegates for this one.
    public let textField = UITextField()
    
    ///In case you require custom attributes to your title.
    public var customTitleAttributedString:NSAttributedString?

    override public init(frame:CGRect) {
        super.init(frame: frame)
    }
    
    convenience public init(){
        self.init(frame:.zero)
        self.createViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented. Please try another way.\nYour's truely NSJoker!")
    }
    
    private func createViews() {
        lblTitle.text = ""
        lblTitle.textColor = UIColor.lightGray
        lblTitle.font = UIFont.systemFont(ofSize: 8)
        lblTitle.numberOfLines = 0
        lblTitle.textAlignment = .left
        lblTitle.isHidden = true
        lblTitle.frame = CGRect(x: 0, y: 0, width: bounds.width, height: titleHeight)
        lblTitle.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(lblTitle)
        
        textField.placeholder = "Enter text here"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .valueChanged)
        textField.backgroundColor = .clear
        addSubview(textField)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        textField.frame = CGRect(x: 0, y: titleHeight, width: bounds.width, height: bounds.height-titleHeight)
        textFieldDidChange()
    }
    
    @objc private func textFieldDidChange() {
        if textField.text?.characters.count == 0 {
            hideTitle()
        } else {
            showTitle()
        }
        
        if let attributedString = customTitleAttributedString {
            lblTitle.attributedText = attributedString
        }
        else {
            lblTitle.text = textField.placeholder
            
            if let attributedText = textField.attributedPlaceholder {
                lblTitle.text = attributedText.string
            }
        }
    }
    
    private func showTitle() {
        if lblTitle.isHidden == false {
            return
        }
        
        lblTitle.isHidden = false
        lblTitle.alpha = 0.0
        lblTitle.frame = CGRect(x: 0, y: titleHeight, width: bounds.width, height: titleHeight)
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseInOut, animations: {
            self.lblTitle.alpha = 1.0
            self.lblTitle.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.titleHeight)
        }) { (finished) in
            if self.textField.text?.characters.count == 0 {
                self.lblTitle.isHidden = true
                self.lblTitle.frame = CGRect(x: 0, y: self.titleHeight, width: self.bounds.width, height: self.titleHeight)
            }
        }
    }
    
    private func hideTitle() {
        if lblTitle.isHidden == true {
            return
        }
        
        lblTitle.frame = CGRect(x: 0, y: 0, width: bounds.width, height: titleHeight)
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseInOut, animations: {
            self.lblTitle.alpha = 0.0
            self.lblTitle.frame = CGRect(x: 0, y: self.titleHeight, width: self.bounds.width, height: self.titleHeight)
        }) { (finished) in
            self.lblTitle.isHidden = true
            self.lblTitle.alpha = 1.0
            if self.textField.text?.characters.count != 0 {
                self.lblTitle.isHidden = false
                self.lblTitle.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.titleHeight)
            }
        }
    }
}
