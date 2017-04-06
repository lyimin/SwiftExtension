//
//  Reusable+IOT.swift
//  IOT-SmartController
//
//  Created by 梁亦明 on 2017/2/16.
//  Copyright © 2017年 EMA-Tech. All rights reserved.
//

import Foundation

public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier : String {
        return String(self)
    }
}

public extension UICollectionView {
    public func dequeueReusableCell<T: Reusable> (indexPath: NSIndexPath) -> T {
        return self.dequeueReusableCellWithReuseIdentifier(T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
    
    public func registerClass<T: UICollectionViewCell where T: Reusable>(_: T.Type ) {
        
        self.registerClass(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    public func registerClass<T: UICollectionReusableView where T: Reusable>(_: T.Type, forSupplementaryViewOfKind: String)  {
        return self.registerClass(T.self, forSupplementaryViewOfKind: forSupplementaryViewOfKind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    public func dequeueReusableSupplementaryViewOfKind<T: UICollectionReusableView where T: Reusable>(elementKind: String, indexPath: NSIndexPath) -> T {
        return self.dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: T.reuseIdentifier, forIndexPath: indexPath) as! T
    }
}

public extension UITableView {
    func dequeueReusableCell<T: Reusable>() -> T? {
        return self.dequeueReusableCellWithIdentifier(T.reuseIdentifier) as! T?
    }
}

public extension UIStoryboard {
    public func instantiateViewController<T: UIViewController where T: Reusable>() -> T {
        return self.instantiateViewControllerWithIdentifier(T.reuseIdentifier) as! T
    }
}
