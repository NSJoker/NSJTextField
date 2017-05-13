//
//  ViewController.swift
//  NSJTextField
//
//  Created by laughofnsjoker@gmail.com on 05/14/2017.
//  Copyright (c) 2017 laughofnsjoker@gmail.com. All rights reserved.
//

import UIKit
import NSJTextField

class ViewController: UIViewController {

    let txtTitle = NSJTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtTitle.frame = CGRect(x: 10, y: 100, width: view.bounds.width - 20, height: 40);
        
        let title = "Title Here"
        let range = NSRange.init(location: 0, length: title.characters.count)
        
        let attributedString = NSMutableAttributedString.init(string: "Title Here")
        attributedString.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 10), range: range)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: colorFromRGBA(fromHex: 0x3498db, alpha: 1.0), range: range)
        
        txtTitle.customTitleAttributedString = attributedString
        
        
        view.addSubview(txtTitle)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func colorFromRGBA(fromHex: Int, alpha: CGFloat) -> UIColor {
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

