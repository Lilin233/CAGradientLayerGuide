//
//  Extension.swift
//  LLSlider
//
//  Created by liuk on 16/1/28.
//  Copyright © 2016年 Liu Kai. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var width: CGFloat {
        return self.frame.size.width
    }
    
    var height: CGFloat {
        return self.frame.size.height
    }
    
    var right: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    var bottom: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    var top: CGFloat {
        return self.frame.origin.y
    }
    
    var left: CGFloat {
        return self.frame.origin.x
    }
    
    func setX(x: CGFloat) {
        self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height)
    }
    
    func setY(y: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height)
    }
    
    func setWidth(width: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height)
    }
    
    func setHeight(height: CGFloat) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height)
    }
    
    func setSize(size: CGSize) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)
    }
}

extension UIImage {
    var width : CGFloat{
        return self.size.width
    }
    var height : CGFloat{
        return self.size.height
    }
    
}
