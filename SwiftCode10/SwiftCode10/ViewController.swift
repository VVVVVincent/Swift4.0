//
//  ViewController.swift
//  SwiftCode10
//
//  Created by 李慧娟 on 2018/12/13.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

/*
 // MARK: - 错误处理（Error Handling）
 -----------------------------------
 错误处理是响应程序中的错误条件并从中恢复的过程
 */
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //:MARK - 使用do...catchc捕获错误
        do {
            try VendingMachineError.insufficientFunds(coinsNeeded: 5)
        } catch  VendingMachineError.invalidSelection{
            print("----------")
        }

    }

    //:MARK -  只有抛出函数才能传播错误
    func erroeFunc() throws -> String {
        throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
    }

}

