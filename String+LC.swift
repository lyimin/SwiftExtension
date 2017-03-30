//
//  String.swift
//  EmaTechProject
//
//  Created by 梁亦明 on 2017/2/10.
//  Copyright © 2017年 xiaoming.com. All rights reserved.
//

import Foundation


extension String {
    /// 获取字符串长度
    var length: Int {
        return characters.count
    }
    
    
    /// 获取子字符串索引
    func indexOfString(target: String) -> Int {
        let range = self.rangeOfString(target)
        if let range = range {
            return self.startIndex.distanceTo(range.startIndex)
        } else {
            return self.length
        }
    }
    
    /// 判断字符串是否为空
    var isEmpty: Bool {
        if self == "" {
            return true
        }
        
        return false
    }
    
    // 计算文字宽高
    func size(withFont font: UIFont, maxSize size: CGSize) -> CGSize {
        let attrs = [NSFontAttributeName: font]
        return (self as NSString).boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: attrs, context: nil).size
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex)
        
            return self[startIndex..<endIndex]
        }
    }
}

