//
//  ViewController.swift
//  SwiftCode3
//
//  Created by 李慧娟 on 2018/11/16.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // MARK:- 闭包
         ---------------------------------
         相当于OC中的block块，可以在函数中传递和使用；
         全局和嵌套函数，是特殊的闭包形式；
         将闭包活内联闭包表达式传递给函数或方法时，始终可以推断出参数类型或者返回值类型；
         因此当闭包作为参数传递时。并不需要最完整的形式来编写闭包；
         */

        // 系统提供sorted(by:)函数,传入一个自定义的排序函数或闭包，完成排序后，返回一个数组，不会修改原始数组
        let array: [Int] = [1, 2, 6, 3, 0, 5, 8];
        // -------------传入函数降序排序
        let newArray1 = array.sorted(by: sort)
        print(newArray1)

        // -------------传入闭包升序排序
        /*闭包表达式的格式:
        { (<#parameters#>) -> <#return type#> in
            <#statements#>
        }
         */
        let closure = { (a: Int, b: Int) -> Bool in
            return a < b
        }
        let result = closure(10,20)
        print("调用闭包----\(result)")

        let newArray2 = array.sorted(by: closure)
        print(newArray2)

        // -------------可以从上下文中推断类型，定义闭包时不用声明参数类型
        print("上下文推断类型-----\(array.sorted(by: {a, b in return a > b}))")

        // -------------单表达式闭包的隐式返回（通过从声明中省略关键字return来隐式返回）
        print("单表达式闭包的隐式返回------\(array.sorted(by: {a, b in a > b}))")

        // -------------速记参数名称
        print("速记参数名称闭包返回-----\(array.sorted(by: {$0 < $1}))")

        // -------------运算符闭包方式
        print("更简便的操作员编写方法----\(array.sorted(by: >))")

        // -------------尾随闭包（如果需要将闭包表达式作为最终参数传递给函数，并且闭包表达式很长，则可使用尾随闭包）
        // 如果提供闭包表达式作为函数或方法的唯一参数，并且将表达式作为尾随闭包提供，则()在调用函数时，不需要在函数名称写()
        funcWithclosure(closure: { (myStr) in
            // 正常写法
            print("正常闭包调用-----\(myStr)")

        })

        funcWithclosure { (myStr) in
            // 尾随闭包写法
            print("尾随闭包调用-----\(myStr)")
        }


        // 使用尾随闭包将数组中的元素转化为字符串
        let dic:[Int:String] = [0:"zero",
                                1:"one",
                                2:"two",
                                3:"three",
                                4:"four",
                                5:"five",
                                6:"six",
        ]

        let numers:[Int] = [16,58,510]
        let str = numers.map { (num) -> String in
            var number = num
            var output:String = ""
            repeat {
                output = dic[number % 6]! + output
                number /= 6
            } while number > 6

            return output
        }
        print(str)

         // -------------捕获值（闭包可以在其上下文中捕获常量或变量，即使定义常量或变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值）
        let func1 = myFunc(parameter: 10)
        // 多次调用就会多次累加
        print("捕获值1为----\(func1())")// 10
        print("捕获值2为----\(func1())")// 20
        print("捕获值3为----\(func1())")// 30

        // 如果创建新的，就会生成新的累加器
        let func2 = myFunc(parameter: 7)
        print("新的捕获值----\(func2())")

        // -------------闭包是引用类型(函数和闭包都是引用类型，无论将函数或闭包赋值给常量或变量，实际上都是在引用闭包或函数，如果为两个不同的变量或者常量分配同一个闭包，则会引用相同的闭包)
        let alsoFunc1 = func1
        print("alsoFunc1--\(alsoFunc1())")// 接着累加至40

        // -------------转义闭包Escaping Closures(当闭包作为参数传递时，闭包被称为转义函数，但在函数返回后才会被调用，当声明一个闭包作为参数的函数时，可以在参数类型前写关键字@escaping，以指示允许闭包进行转义；闭包可以转移的一种方法是储存在函数外部的变量中，多用于异步执行)

        var completionHandler: [() -> Void] = []
        func EscapFunc (handler: @escaping () -> Void) {
            handler()
            completionHandler.append(handler)
        }

        EscapFunc {
            print("Escaping闭包")
        }

    }

    // 排序函数
    func sort(a: Int, b: Int) -> Bool {
        return a > b;
    }

    // 闭包作为参数的函数
    func funcWithclosure(closure: (String) -> Void) {
        closure("你好👋")
    }

    // 嵌套函数
    func myFunc(parameter a: Int) -> () -> Int {
        // 该函数有一个Int型的参数别名为parameter，返回值是一个函数类型() -> Int
        var total = 0
        func myFunc2 () -> Int {
            // 在该函数体内访问了它函数体外的total和参数a
            total += a
            return total
        }
        return myFunc2
    }

}

