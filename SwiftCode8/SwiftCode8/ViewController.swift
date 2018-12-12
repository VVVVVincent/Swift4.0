//
//  ViewController.swift
//  SwiftCode8
//
//  Created by 李慧娟 on 2018/12/11.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

/*
 // MARK: - 初始化
 ----------------------------------
 初始化：
 初始化是为准备要使用的类、结构或枚举的实例的过程，
 此过程中涉及到为该实例的每个属性设置初始值，并执行好在新实例准备使用前的所有设置和初始化，
 与OC不同，swift初始化器不返回值，主要是保证使用实例之前完成初始化
 */

class CustomeClass {
    var m: Int = 2018

    var text: String
    let cText: String

    // 可选属性类型（如果存储属性逻辑上允许“无值”，可能在初始化时无法设置值，或者允许在某一个时间点没有值的时候）
    var response: String?
    init(text: String) {
        self.text = text

        // 在初始化期间分配常量属性，即使它是常量属性，在初始化期间，也是可以被赋值的
        self.cText = text
    }

    func customeFunc() {
        print(text)
    }
}

class ViewController: UIViewController {
    /*
     // MARK: - 1.设置存储属性的初始化值
     ------------------------------
     在创建该类和结构的实例时，必须为存储属性设置初始值，存储属性不能被保留为不确定的状态；
     可以在初始值设定项中设置存储属性的初始值，也可以将默认属性值指定为属性的一部分来设置初始值
     */

    struct MyStruct1 {
        // 用初始化器进行存储属性的初始化
        var temperature: Double
        init() {
            temperature = 37.0
        }

        // 默认属性值直接赋值初始化
        var m: Double = 37.0
    }

    /*
     // MARK: - 2.自定义初始化
     ------------------------------
     可以使用输入参数和可选属性类型自定义初始化过程，即自定义初始化方法
     */
    // 初始化参数
    struct MyStruct2 {
        var myName: String
        init(name: String ) {
            myName = "My name is \(name)"
        }
    }

    // 参数名称和参数标签
    struct MyStruct3 {
        let red, green, blue: Double
        // 带参数标签
        init(red: Double, green: Double ,blue: Double) {
            self.red = red
            self.green = green
            self.blue = blue
        }

        // 不带参数标签
        init(_ white: Double) {
            red = white
            green = white
            blue = white
        }
    }


    /*
     // MARK: - 3.默认初始化器
     ------------------------------
     Swift为任何为其所有属性提供默认值的结构或类提供默认初始化程序
     默认初始值设定项只是创建一个新实例，其所有属性都设置为其默认值,即是属性都含有默认值的，而且没有自定义初始化方法的
     */
    // 类的默认初始化器
    class ShoppingList {
        var name: String?
        var quantity = 1
        var purchased = false
    }

    // 结构类型的成员初始化器
    struct Size {
        var width = 0.0, height = 0.0
    }

    /*
     // MARK: - 4.值类型的初始化程序委托
     ------------------------------
     初始化器可以调用其它初始化器来执行实例初始化的一部分，这个过程称为初始化程序委托
     如果为值类型定义了自定义的初始化设置项，将无法再访问该类型的默认初始化设置值
     */
    struct Point {
        var x = 0.0, y = 0.0
    }

    struct Rect {
        var size = Size()
        var origin = Point()
        // 提供了三种初始化方式
        init() {}

        init(size: Size, origin: Point) {
            self.size = size
            self.origin = origin
        }

        init(size: Size, center: Point) {
            let originX = center.x - (size.width / 2)
            let originY = center.y - (size.width / 2)
            self.init(size: size, origin: Point(x: originX, y: originY))
        }
    }

    /*
     // MARK: - 5.类的继承和初始化
     ------------------------------
     所有类的存储属性都必须在初始化期间分配初始值；
     Swift为类定义了两种初始化值设定项，分为指定的初始化项和便利的初始化项；
     指定的初始化项是类的主要初始值设定项，指定的初始化程序完全初始化该类引入的所有属性，并适当调用父类的初始化程序以完成父类的初始化工作；
     便利的初始化器是次要的，支持类的初始化器，可以从一个便利的初始化器中调用类的制定的初始化，如果类不需要，就不用提供便利的初始化器

     init(parameters) {
     // 指定初始化器
     }

     convenience init (parameters) {
     // 便利的初始化器
     }
     */

    // 初始化器的继承和覆盖（与OC不同，swift子类默认不继承父类的初始化设定项）
    var myName: String = ""

    convenience init(name: String) {
        self.init()// 要先调用已有的指定初始化器
        self.myName = name
    }

    /*
     // MARK: - 6.可用的初始化程序
     ------------------------------
     定义初始化可能失败的类，结构或枚举
    */
    // 结构的可用s初始化程序
    struct IsFail {
        var name: String
        init?(name: String) {
            if name.isEmpty { return nil }
            self.name = name
        }
    }

    // 枚举可用的初始化程序
    enum FailEnum {
        case one, two, three
        init?(num: Int) {
            switch num {
            case 1:
                self = .one
            case 2:
                self = .two
            case 3:
                self = .three
            default:
                return nil
            }
        }
    }

    // 具有原始值的枚举可用的初始化程序
    enum WeekEnum: Int {
        case monday = 1, tuesday, wednesday
    }

    /*
     // MARK: - 7.必须的初始化程序
     ------------------------------
     required在类初始化程序的定义之前编写修饰符，以指示该类的每个子类都必须实现该初始化程序
     */
    class class1 {
        var name:String

        required init(str: String) {
            self.name = str
        }
    }

    class class2: class1 {
        required init(str: String) {
            super.init(str: str)
            self.name = "my name is " + str
        }
    }

    /*
     // MARK: - 8.使用闭包或函数设置默认属性值
     ------------------------------
     如果存储属性的默认值需要某些自定义或设置，则可以使用闭包或全局函数为该属性提供自定义的默认值。
     每当初始化属性所属类型的新实例时，将调用闭包或函数

     闭包的结束大括号后面是一对空括号。这告诉Swift立即执行关闭。
     如果省略这些括号，则试图将闭包本身分配给属性，而不是闭包的返回值
     */
    class someClass {
//        let array:[Int] = [1,4,5,6,8]
//
//        let closure = {(array) -> Int in
//            return
//        }
//
        let someStr: String = {return "哈哈"}()
    }





    override func viewDidLoad() {
        super.viewDidLoad()

        // 默认初始化方法
        let struct1 = MyStruct1()
        print(struct1.temperature)
        print("------------------------------")

        // 自定义初始化
        let struct2 = MyStruct2(name: "Jolin")
        print(struct2.myName)
        print("------------------------------")

        // 带参数标签的初始化
        let struct3 = MyStruct3(red: 1.0, green: 0.0, blue:1.0)
        print(struct3)
        print("------------------------------")

        // 不带参数标签的初始化
        let halfGray = MyStruct3(0.5)
        print(halfGray)
        print("------------------------------")

        // 可选属性类型初始化
        let customClass = CustomeClass(text: "你好")
        customClass.customeFunc()
        print("------------------------------")

        // 常量初始化被赋值
        print(customClass.cText)
        print("------------------------------")

        // 类的初始化器
        let item = ShoppingList()
        print(item.quantity)
        print("------------------------------")

        // 结构的初始化器
        let size = Size(width: 10.0, height: 10.0)
        print(size.width)
        print("------------------------------")

        // 值类型的初始化委托
        let rectStruct = Rect(size: Size(width: 10.0, height: 10.0), center: Point(x: 100, y: 100))
        print(rectStruct.origin)
        print("------------------------------")

        // 结构可用的初始化程序
        let isFailStruct = IsFail(name: "")
        if let s = isFailStruct {
            print("非nil\(s)")
        } else
        {
            print("nil")
        }
        print("------------------------------")

        // 枚举的可用初始化
        let failEnum = FailEnum(num: 3)
        if let a =  failEnum{
            print("非nil\(a)")
        } else
        {
            print("nil")
        }
        print("------------------------------")

        // 具有默认值的枚举可用初始化
        let weekEnum = WeekEnum.init(rawValue: 2)
        if weekEnum == nil {
            print("weekEnum为nil")
        } else
        {
             print(WeekEnum.monday.rawValue)
        }
        print("------------------------------")

        // 必需的初始化程序
        let myClass = class2.init(str: "lhj")
        print(myClass.name)
        print("------------------------------")

        // 使用闭包初始化
        let myClass2 = someClass.init()
        print(myClass2.someStr)

    }
}

