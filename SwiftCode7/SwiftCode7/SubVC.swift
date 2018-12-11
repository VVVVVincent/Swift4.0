//
//  SubVC.swift
//  SwiftCode7
//
//  Created by 李慧娟 on 2018/12/4.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class SubVC: SuperVC {
    // 重写父类中的属性
    override var n: String {
        return super.n + " year"
    }

    // 重写属性观察者
    override var myProperty: String {
        didSet {
            m = 11111
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 子类可以调用父类中的方法
        makeNoise()

        // 子类拥有父类中的属性
        self.m = 100
        print(self.n)

        // 子类本身也可以拥有子类，且他们都可以访问基类中的属性和方法
    }

    // 重写父类中的方法
    override func superFunc() {
        print("我现在在子类中～")
    }

//    override func makeNoise() {
//         重写报错
//    }


}
