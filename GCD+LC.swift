//
//  GCD+IOT.swift
//  IOT-SmartController
//
//  Created by 梁亦明 on 2017/2/12.
//  Copyright © 2017年 EMA-Tech. All rights reserved.
//

import Foundation

typealias Task = (cancel : Bool) -> Void

/**
 延迟加载
 */
func delay(time:NSTimeInterval, task:(()->())?) ->  Task? {
    
    func dispatch_later(block:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC))),
            dispatch_get_main_queue(),
            block)
    }
    
    var closure: dispatch_block_t? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                dispatch_async(dispatch_get_main_queue(), internalClosure);
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(cancel: false)
        }
    }
    
    return result;
}

/**
 取消任务
 */
func cancel(task:Task?) {
    task?(cancel: true)
}
