//
//  ViewController.swift
//  SwiftCode2
//
//  Created by 李慧娟 on 2018/11/15.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         //MARK: - 6.函数定义及调用
         ---------------------------------------
         */
        // -----------调用标准函数greet
        let greeting = greet(person: "郑多多")
        print(greeting)

        // -----------调用没有参数的函数sayHello
        print(sayHello())

        // -----------调用带有多个参数的函数greetAgain
        print(greetAgain(person: "lhj", alreadyGreeted: false))

        // -----------调用没有返回值的函数noReturnFunc
        noReturnFunc(person: "二狗")

        // -----------调用函数时，可以忽略其返回值
        printAndCount(str: "123456")
        printWithoutCount(str: "7890")

        // -----------调用具有多个返回值的函数minAndMax
        let returnValue = minAndMax(array: [1,5,6,3,4,5,7,9])
        print("最小值为----\(returnValue.min)")
        print("最大值为----\(returnValue.max)")

        // -----------定义可选的元祖返回值类型--使用可选的远祖类型，整个元祖都是可选的，而不仅仅是元祖中的单个值
        let dic1:[String:Int] = ["lhj":25,
                                "zhy":25,
                                "lxj":18,
                                "郑多多":25
                                ]
        // 利用可选绑定检查是否有值
        if let value = searchPerson(dic: dic1) {// 把某个可选值赋给一个常量，如果这个常量存在值的话
            print("\(value.name)----\(value.age)")
        } else {
            print("没有值～～～")
        }

        // -----------指定参数标签（在参数名称先编写参数标签，相当于参数的别名）
        haveTagFunc(nameLabel: "lhj")

        // -----------省略参数标签（如果不想要显示参数，可以用_代替）
        ignoreTagFunc("郑老肥", greet: "你好")

        // -----------默认参考值（可以在参数类型之后为参数定义默认值，如果定义了默认值，调用时可以省略该参数）
        defaultFunc(name: "lhj")

        // -----------变量参数（向同一个参数传递多个可能的值，用...来编辑可变参数）
        let total = changeFunc(1.1,1.2,1.3,1.4,1.5)// 传入一个集合
        print(total)

        // -----------inout参数
        /*
         通常情况下，在函数体内参数是常量，修改会导致编译错误，如果想更改就定义inout参数，在参数类型钱用inout修饰；
         inout参数不能具有默认值，可变参数不能被标记为inout参数
         在调用带有inout参数的函数时，外部传入的必须是变量
         */
        var a = 1; var b = 2
        print(inoutFunc(&a, &b))

        // -----------函数类型（每一个函数都有一个特定的函数类型，由函数的参数类型和返回值类型组成）
        // 函数inoutFunc来讲，函数类型为（Int, Int） -> Int
        // 如果函数没有f参数也没有返回值，函数类型为() -> void

        // -----------使用函数类型
        let myFunc1: (String) -> String = greet
        print(myFunc1("joe"))

        // -----------函数类型作为参数传递
        funcMethod(paraFunc(a:b:), 10, 20)

        // -----------函数类型作为返回值
        print(returnFunc(bool: true))

        // -----------嵌套函数（在某一个函数体内定义函数，默认情况下嵌套函数是对外界隐藏的，但它的外层函数仍然可以调用他们，也可以返回嵌套函数，让外部调用）
        var currentValue = -4;
        let funcValue = nestFunc(true);
        while currentValue != 0 {
            print(currentValue)
            // 调用返回函数
            currentValue = funcValue(currentValue)
        }





    }

    //MARK: - 定义函数
    //-------------------------------------------------

    // 定义一个标准函数(greet为函数名，参数为person 返回一个字符串)
    func greet(person:String) -> String {
        let greeting = person + "你好"
        return greeting
    }

    // 定义没有参数的函数
    func sayHello() -> String {
        return "hello,world"
    }

    // 定义带有多个参数的函数
    func greetAgain(person: String, alreadyGreeted: Bool) -> String {
        if alreadyGreeted {
            return sayHello()
        } else {
            return greet(person: person)
        }
    }

    // 定义没有返回值的函数
    func noReturnFunc(person: String) {
        print("hi,\(person)")
    }


    func printAndCount(str: String) -> Int {
        print(str)
        return str.count
    }

    func printWithoutCount(str: String)  {
        let _ = printAndCount(str: str)
    }

    // 定义具有多个返回值的函数--使用元祖作为一个复合返回值类型
    func minAndMax(array: [Int]) -> (min: Int, max: Int) {
        // 循环遍历出数组中的最大最小值
        var minValue = array[0]; var maxValue = array[0];
        for value in array[1..<array.count] {
            if value < minValue {
                minValue = value
            }

            if value > maxValue {
                maxValue = value;
            }
        }
        return (minValue, maxValue)
    }

    // 定义可选的返回元祖值
    func searchPerson(dic: [String:Int]) -> (name: String, age: Int)? {
        for keyStr in dic.keys {
            if keyStr == "郑多多" {
                let ageValue:Int = dic[keyStr] ?? 0;
                return (keyStr, ageValue)
            }
        }

        return nil
    }

    // 定义带有参数标签的函数
    func haveTagFunc(nameLabel name: String) {
        print("my name is \(name)")
    }

    // 定义省略参数标签的函数
    func ignoreTagFunc(_ name: String, greet: String) {
        print(name + greet)
    }

    // 定义参数具有默认值的函数
    func defaultFunc(name: String, city:String = "河南") {
        print("\(name)来自\(city)")
    }

    // 定义可变参数函数
    func changeFunc (_ nums: Double...) -> Double {
        print("数字为--\(nums)")// 数字为--[1.1, 1.2, 1.3, 1.4, 1.5]
        var total: Double = 0
        for num in nums {
            total += num
        }
        return total
    }

    // 定义inout参数函数
    func inoutFunc(_ a: inout Int, _ b: inout Int) -> Int {
        let c: Int = a
        a = b
        b = c
        return b
    }

    // 定义函数类型作为参数的函数
    func funcMethod(_ funcPara:(Int, Int) -> Int, _ b: Int, _ c: Int) {
        print("result--\(funcPara(b, c))")
    }

    func paraFunc(a: Int, b: Int) -> Int {
        return a + b
    }

    // 定义函数类型作为返回值类型的函数
    func returnFunc(bool: Bool) -> (Int, Int) -> Int {
        return paraFunc
    }

    // 定义嵌套函数，并返回嵌套函数
    func nestFunc(_ boolValue: Bool) -> (Int) -> Int {
        func func1(a: Int) -> Int {
            return a + 1
        }

        func func2(a: Int) -> Int {
            return a - 1
        }
        return boolValue == true ? func1 : func2
    }

}

