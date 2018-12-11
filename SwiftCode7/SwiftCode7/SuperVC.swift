//
//  SuperVC.swift
//  SwiftCode7
//
//  Created by 李慧娟 on 2018/12/4.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class SuperVC: UIViewController {

    /*
     // MARK: - <下标>
     -----------------------------------------------
     类、结构和枚举都可以定义下标，下标用于访问集合、列表或序列的成员元素的快捷方式，不需要再调用实例特定的赋值和访问方法；
     可以为单个类型定义多个下标，并根据传递给下标的索引值的类型来选择要使用的相应的下标重载；
     下标语法类似于实例方法和计算属性的混合;
     */

    // MARK: 定义下标
    // ----------------------
    var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "saturday"]

    // 类中定义下标
    subscript(index: Int) -> String {
        get {
            // 用于下标脚本值的声明
            return days[index]
        }

        set(newValue) {
            // 执行赋值操作
            days[index] = newValue

        }
    }

    // 结构中定义下标
    struct MyStruct {
        let rows: Int, columns: Int
        var array: [Double]

        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns

            // 定义一个值全为0.0，数量为rows*columns的数组
            array = Array(repeating: 0.0, count: rows * columns)
        }

        subscript (row: Int, column: Int) -> Double {
            get {
                return array[(row * columns) + column]
            }

            set {
                array[(row * columns) + column] = newValue
            }
        }
    }

    /*
     // MARK: - 定义基类中的属性
     -----------------------------------------------
     */
    var m = 2018// 存储属性
    var n: String {// 只读计算属性
        return "now is \(m)"
    }

    // 属性观察者
    var myProperty : String = "" {
        didSet {
            myProperty += "haha"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        // MARK: - 使用下标
        self[1] = "哈哈"
        print(self[1])

        var myStruct = MyStruct(rows: 10, columns: 5)
        myStruct[0,0] = 1.0
        myStruct[0,1] = 2.0
        print(myStruct[0,0])
        print(myStruct[0,1])
        print(myStruct[0,2])
        print(myStruct.array)

        /*
         // MARK: - <继承>
         -----------------------------------------------
         类可以从另一个类中继承方法、属性和其它特征；
         swift中的子类可以调用和访问父类中的方法、属性和下标，并可以提供重写；
         类还可以将属性观察器添加到子类中继承的属性中

         如果想把某个属性、方法或下标设置成不能被重写，可以用final关键字来标记，
         或者将整个类的声明前添加final，这样整个类都不能被重写
         */
        // SuperVC为父类，子类为SubVC

    }

    // 供子类访问,但不能被重写的方法
    final func makeNoise() {
        print("看这里看这里")
    }

    // 可以被重写的方法
    func superFunc() {
        print("快来重写我～")
    }

}

