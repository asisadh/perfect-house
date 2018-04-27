//
//  NavigationSearchTextField.swift
//  Houseperfect
//
//  Created by Aashish Adhikari on 4/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit

class NavigationSearchTextField: UITextField{
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 38, 0, 16))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(0, 38, 0, 16))
    }
}
