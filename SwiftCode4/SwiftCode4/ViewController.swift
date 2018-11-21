//
//  ViewController.swift
//  SwiftCode4
//
//  Created by 李慧娟 on 2018/11/19.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         // MARK: - 枚举
         ------------------------------------
         C的枚举，将相关名称分配给一组整数,Swift枚举更加灵活，并且不必为枚举的每个案例提供值；
         如果一个值被提供给每个枚举的情况下，该值可以是一个字符串、一个字符、或任何整数值或浮点型；
         与OC不同，他们的名称，都要以大写开头
         枚举语法如下：
         enum 大写开头的枚举名 {
         }
         */
        // ------------------定义指南针枚举(与OC不同，swift枚举类型在创建时未分配默认整数值，即在下面的例子中，这些枚举值并不隐式的等于0，1，2，3；相反不同的枚举案值本身就是完全成熟的值，具有显示定义的类型)
        enum CompassPoint {
            case north
            case south
            case east
            case west
        }

        // 也可以把多个枚举写在一行，以逗号隔开
        enum CompassPoint2 {
            case north, south, east, west
        }

        // ------------------使用枚举中的案例
        var direction = CompassPoint.east
        direction = .north;// 也可以使用较短的.语法
        print(direction)

        // ------------------使用switch语句匹配枚举值
        switch direction {
        case .north:
            print("this is north direction")
        case .south:
            print("this is south direction")
        case .east:
            print("this is east direction")
        case .west:
            print("this is west direction")
        default:
            print("no direction")
        }

        // ------------------遍历枚举(swift将枚举的所有值公开为一个属性供使用，但是想要访问这个属性，必须遵循CaseIterable协议)
        enum Beverages: CaseIterable {
            case coffee, tea, juice
        }
        let num = Beverages.allCases.count
        print("beverages has \(num)")

        for beverage in Beverages.allCases{
            print(beverage)
        }

        // ------------------相关值（设置枚举中每一个元素不同的数据类型，值的创建基于常量和变量，它的相关值在创建一个基于枚举中的元素的常量和变量时才会被设置，而且值可以是不同的）
        // 定义一个包含学生姓名和各科成绩的枚举
        enum Student {
            case name(String)
            case mark(Int, Int, Int, Int)
        }
        _ = Student.name("李雷")
        let studentMark = Student.mark(90, 85, 100, 0)
        switch studentMark {
        case .name(let student):
            print("学生姓名为\(student)")
        case .mark(let yuwen, let shuxue, let yingyu, let tiyu):
            print("语文成绩为-\(yuwen)\n数学成绩为-\(shuxue)\n英语成绩为-\(yingyu)\n体育成绩为-\(tiyu)")
        default:
            print("-----")
        }

        // ------------------原始值(枚举中的每一个元素都有相同的数据类型，预先填充好的值，原始值始终是相同的;原始值可以是字符串，字符或者任何整数或者浮点型，每个原始值在其枚举类型中必须是唯一的)
        enum ACIICharacter: Character {
            case tab = "\t"
            case linefeed = "\n"
            case carriageReturn = "\r"
        }
        // 利用rawValue属性来获取元素的值
        let charEnum = ACIICharacter.tab.rawValue
        print(charEnum)

        // ------------------隐式分配值（当使用整数或者字符串存储原始值的枚举时，不必为每个枚举元素分配原始值，swift会自动分配原始值，这叫做隐式分配）
        enum Count: Int {
            // 隐式自动递增
            case one = 1, two, three, four, five, six
        }
        print(Count.six.rawValue)// 6

        enum Direction: String {
            // Direction.north隐式的画具有值“north”,依次类推
            case north, south, east, west
        }
        print(Direction.east.rawValue.count)// 打印字符串长度

        // ------------------从原始值初始化（如果使用原始值类型定义枚举，则枚举会自动接收一个初始值设定项，该初始值设定项接受原始值类型的值，并返回枚举大小或者nil）
        let myCount = Count(rawValue: 5)
        print(myCount!)

        // 利用可选绑定
        if let someCount = Count(rawValue: 7) {
            // 如果不为nil
            switch someCount {
            case .six:
                print("value is \(someCount)")
            default:
                print("--------")
            }
        } else {
            print("-----------no value")
        }

        // ------------------递归枚举（是将枚举的另一个实例作为一个或多个枚举中元素的相关值，可以通过在枚举中的某个元素前写indirect来表示该枚举时递归的，或者在枚举的定义开始前编写indirect）
        // 在元素前编写indirect
        enum PersonEnum {
            case age(Int)
            indirect case other(PersonEnum, PersonEnum)
            indirect case anther(PersonEnum,PersonEnum)
        }

        // 在枚举的定义前编写indirect
//        indirect enum PersonEnum {
//            case age(Int)
//            case other(PersonEnum, PersonEnum)
//            case anther(PersonEnum,PersonEnum)
//        }

        let age1 = PersonEnum.age(15)
        let age2 = PersonEnum.age(20)

        let other1 = PersonEnum.other(age1, age2)
        let anther1 = PersonEnum.anther(other1, PersonEnum.age(10))

        // 利用函数递归
        func evaluateFunc (_ enumPara: PersonEnum) -> Int {
            switch enumPara {
            case let .age(value):// 值绑定
                return value
            case let .other(left, right):
                return evaluateFunc(left) + evaluateFunc(right)
            case let .anther(left, right):
                return evaluateFunc(left) * evaluateFunc(right)
            }
        }

        print(evaluateFunc(anther1))

        /*
         // MARK: - 结构和类
         ------------------------------------
         结构和类是通用的、灵活的构造，通过定义属性和方法，向结构和类添加功能；
         与其它语言不同，swift不需要为结构和类定制单独的声明和实现文件，既没有像OC把.h和.m文件拆分开；
         类具有结构不具备的功能：
         1.类具有继承性，子类继承父类的特性
         2.类型转换能够在运行时检查和解释类实例的类型。
         3.Deinitializers允许一个类的实例释放它分配的任何资源。
         4.引用计数允许对一个类实例的多个引用。
         */

        // -------------------结构和类的定义
        // 创建结构
        struct SomeStructure {
            var year = 2018
            var month = 11
        }

        // 创建类
        class SomeClass {
            var myName:String?
            var structure = SomeStructure()

            func myFun(_ str: String) {
                myName = str
                print("我在SomeClass类里，我被调用啦～")
            }
        }

        // 定义和访问结构的实例
        let someStruct = SomeStructure()
        print(someStruct.year)


        // 定义和访问类的实例
        let someClass = SomeClass()
        someClass.myFun("郑多多")// 访问方法
        print(someClass.myName!)// 访问属性
        print(someClass.structure.year + 1)// 访问属性中的属性
        someClass.myName = "李多多"// 点语法修改属性值
        print(someClass.myName!)

        // ------------------结构类型的成员初始化器（所有结构都有一个自动生成的初始化器，可以用它来初始化新的结构实例中的属性，该实例的属性初始值可以通过名称传给结构成员初始化器）
        let newStruct = SomeStructure(year: 2019, month: 10)
        print("year---\(newStruct.year)\nmonth---\(newStruct.month)")

        // ------------------结构和枚举都是值类型（值类型是将值赋给常量、变量、或传递给函数时复制的类型，实际上swift中的整数、浮点型、布尔值、字符串、数组和字典的所有基本类型都是值类型，即赋值给另一个实例时，都会开辟新的存储空间，互不影响）
        var myStruct = newStruct
        myStruct.year = 2020// newStruct中属性值不变，myStruct中属性值改变
        print("year属性在newStruct为---\(newStruct.year)\nyear属性在myStruct为---\(myStruct.year)")

        // ------------------类是引用类型（引用类型在分配给常量、变量、或者函数时不会被复制，使用时都是对同一现有实例的引用,使用的同一个存储空间）
        let newClass = SomeClass()
        let myClass = newClass
        myClass.structure = SomeStructure(year: 2030, month: 12)
        print(newClass.structure.year)// 2030

        // ------------------标识符（因为类是引用类型，所以可能会出现多个常量或变量在后台引用同一个类，对于结构和枚举，则不会出现这样的情况）
        // 验证两个常量或者变量是否指向完全相同的类实例
        if newClass === myClass {
            // ===(表示相同)
            print("newClass和myClass引用的同一个类实例")
        }

        if self !== newClass {
            // !==(表示不相同)
            print("self和newClass不引用同一个类实例")
        }
    }

}


