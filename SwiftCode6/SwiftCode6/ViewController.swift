//
//  ViewController.swift
//  SwiftCode6
//
//  Created by 李慧娟 on 2018/12/4.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         MARK: - <方法>
         -----------------------------------------------------
         方法是与特定类型相关联的函数，类、结构、枚举都可以定义实例方法，也可以定义类方法；
         而OC则不能在结构和枚举中定义方法；
         */


        /*
         MARK: - 实例方法
         -----------------------------------------------------
         1.定义实例方法：
         要在所属类型的开始和结束括号内编写实例方法，
         实例方法可以隐式访问该类型中的其它实例方法和属性，
         实例方法只能在所属类型的实例中调用

         2.在实例方法中修改值类型：
         结构和枚举是值类型，默认情况下，无法在实例方法中修改值类型的属性，
         但是如果在特定方法中修改结构或枚举的属性，可以选择对该方法进行突变行为
         注意：不能在常量类型的结构或枚举实例中调用突变方法，因为常量结构实例中的属性不能更改
         */

        // ------------------定义实例方法
        increment1()
        print("count = \(count)")
        increment2(by: 5)
        print("count = \(count)")
        reset()
        print("count = \(count)")
        print("************************************")

        // 调用方法或属性时，可以用self属性
        self.increment1()
        print(self.count)
        print("************************************")

        // ------------------在实例方法中修改值类型
        struct Point {
            var x = 0.0, y = 0.0

            // 将mutating关键字放在方法前来进行突变行为
            mutating func moveBy(deltaX: Double, deltaY: Double) {
//                x += deltaX
//                y += deltaY

                // 也可以用这种方法修改结构属性值
                self = Point(x: x + deltaX, y: y + deltaY)
            }
        }
        var somePoint = Point(x: 10.0, y: 10.0)
        somePoint.moveBy(deltaX: 5.0, deltaY: 5.0)
        print("x=\(somePoint.x)\ny=\(somePoint.y)")


//        let cPoint = Point(x: 1.0, y: 1.0)
//        cPoint.moveBy(deltaX: 2.0, deltaY: 2.0)// 报错
        print("************************************")

        // 枚举的突变方法，可以用self设置同一枚举的不同值
        enum SwitchT {
            case off, low, high

            mutating func next() {
                switch self {
                case .off:
                    self = .low
                case .low:
                    self = .high
                case .high:
                    self = .off
                }
            }
        }

        var switchT = SwitchT.high
        switchT.next();
        switchT.next()
        print("switchT = \(switchT)")//low
        print("************************************")


        /*
         // MARK: - 类方法
         -----------------------------------------------------
         类方法是用某个类型本身去调用方法，不需要去创建实例变量进行调用；
         通过static关键字在表示该方法为类方法，也可以使用class关键字来允许子类重写父类的该方法；
         OC中只能为类来定义类方法，但在swift中，可以为结构、枚举和类来定义类方法；
         */
        // ------------------调用类方法
        ViewController.classFunc1()
        ViewController.classFunc2()

    }



    // MARK: - 定义实例方法
    func increment1()  {
        count += 1
    }

    func increment2(by amount: Int)  {
        count += amount
    }

    func reset() {
        count = 0
    }

    // MARK: - 定义类方法
    class func classFunc1() {
        // 该方法，子类可以重写
        print("快来重写我～")
    }

    @discardableResult// 该关键字作用是如果有返回值的时候，可以允许调用该方法没有接收对象
    static func classFunc2() -> String {
        print("我是类方法哦～")
        return "😂😄😁"
    }
}


