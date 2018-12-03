//
//  ViewController.swift
//  SwiftCode5
//
//  Created by 李慧娟 on 2018/11/21.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

// MARK: -  定义结构MyStruct
struct MyStruct {
    let myName: String
    var myAge: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         // MARK: - 属性
         -------------------------------------
         存储属性：
         是一个常量或变量，它存储为特定类和实例的一部分，存储的属性可以是变量属性(var修饰)或者是常量属性(let修饰)；
         可以为存储属性提供默认值作为其定义的一部分
         */

        // ------------------------定义存储属性
        // 1.定义结构结构中有一个常量和一个变量，其中常量属性在赋初始值之后不能再被改变，变量属性可以被多次修改
        var structV1 = MyStruct.init(myName: "Joe", myAge: 18)
        structV1.myAge = 20
        print(structV1.myAge)

        // 2.变量属性在一个常量实例中（如果定义了一个结构，并把它赋给了一个常量，则这个结构中的变量属性就不能被修改了）
        let structC1 = MyStruct(myName: "bob", myAge: 20)
//        structC1.myAge = 25 // 修改变量属性会报错
        print(structC1)

        // 3.惰性存储属性（惰性存储属性是在第一次使用他时才开始计算初始值，通过在定义属性前编写lazy关键字来表示它是一个惰性存储属性，且必须用var修饰，当属性的初始值依赖于外部因素时，延时性非常重要）
        class DataImporter {
            var fileName = "data.text"

        }

        class DataManager {
            lazy var importer = DataImporter()
            var data = [String]()
        }

        let manager = DataManager()
        manager.data.append("some data")
        manager.data.append("some mmore data")// 此时manager实例中的DataImporter类型实例还没有被初始化
        // 因为importer使用lazy修饰符标记，所以只有在首次访问该属性时才会创建该DataImporter实例，
        print(manager.importer.fileName)// 首次访问被初始化

        // 4.存储的属性和实例变量（像OC一样，除了用属性来存储值，还有全局变量来存储，但是swift将这些概念统一到属性声明中，没有相应的实例变量）

        // ------------------------定义计算属性（类，结构和枚举还可以定义计算属性，这种属性实际上不存储值，相反他们提供了一个getter和一个可选的setter来间接检索和设置其他属性和值，计算属性都要用var修饰）
        struct Point {
            var x = 0.0, y = 0.0
        }

        struct Size {
            var width = 0.0, height = 0.0

        }

        struct Rect {
            // 定义结构存储属性实例
            var origin = Point()
            var size = Size()

            // 1.定义计算属性
            var center: Point {
                get {
                    let centerX = origin.x + (size.width / 2)
                    let centerY = origin.x + (size.height / 2)
                    return Point(x: centerX, y: centerY)
                }
                set(newCenter) {
                    origin.x = newCenter.x - (size.width / 2)
                    origin.y = newCenter.y - (size.height / 2)
                }
            }
        }

        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        // 调用getter
        let center1 = square.center
        print("center1----\(center1)")

        // 调用setter
        square.center = Point(x:20, y: 20)
        print(square.center)

        // 2.速记setter声明（如果计算属性的setter没有为要设置的新值定义，则使用newValue为默认名称。这是Rect结构的另一个版本）
        struct NewRect {
            var newOrigin = Point()
            var newSize = Size()
            // 定义简写计算属性
            var newCenter: Point {
                get {
                    let centerX = newOrigin.x + (newSize.width / 2)
                    let centerY = newOrigin.y + (newSize.height / 2)
                    return Point(x: centerX, y: centerY)
                }

                set {
                    newOrigin.x = newValue.x - (newSize.width)
                    newOrigin.x = newValue.y - (newSize.height)
                }
            }
        }

        var newRect = NewRect(newOrigin: Point(x: 10, y: 10), newSize: Size(width: 50, height: 50))
        print(newRect.newCenter)// 调用getter
        newRect.newCenter = Point(x: 5, y: 5)
        print(newRect.newCenter)

        // 3.只读的计算属性（只有getter，没有setter方法的，称为只读计算属性，可以通过点语法进行访问，但不能设置其他值）
        struct Lstruct {
            var width = 0, height = 0, depth = 0
            // 定义只读计算属性
            var area: Int {
                // 标准形式
//                get {
//                    return width * height * depth
//                }

                // 简写形式
                return width * height * depth
            }
        }

        let lstruct = Lstruct(width: 10, height: 10, depth: 10)
        print("只读计算属性area值为---\(lstruct.area)")

        // ------------------------属性观察者
        /*
         属性观察者一直观察着属性的变化，不管设置的值与原来的值是否相同，每次设置属性值时都会调用属性观察者；
         可以将属性观察者添加到定义的任何存储属性，但惰性存储属性除外；
         还可以通过重写子类中的属性向任何继承的属性添加属性观察者，不管是存储的还是计算的；
         不需要为未重写的计算属性添加观察者，因此可以在计算属性的setter方法中观察并响应对其值的更改；
         属性中可定义的观察者：
         willSet:在存储值之前调用，并会传递新属性值，新属性值默认为newValue
         didSet:在存储新值之后立即调用，并会传递旧属性值，旧属性值默认为oldValue
         */
        // 定义一个属性，并设置观察者
        var totalSteps: Int = 0 {
            willSet (newTotalSteps) {
                print("将要被设置的新值为-----\(newTotalSteps)")
            }
            didSet {
                if totalSteps > oldValue {
                    print("增加的步数为---\(totalSteps - oldValue)\n旧值为\(oldValue)")
                }
            }
        }

        totalSteps = 200
        print("-----------------------------")
        totalSteps = 300

        // ------------------------全局和局部变量或常量
        /*
         全局变量或常量是在任何函数、方法、闭包或类的上下文之外定义的变量，局部变量是在这些z结构体内定义的变量
         全局变量或常量总是惰性的计算，即在未被赋值之前都是nil，但是与延迟的存储属性不同，不需要用lazy修饰
         局部变量和常量，永远不会被惰性的计算，因为它在一个函数、方法、闭包或类里，在被声明的时候就已经被分配好了存储空间
         */

        // ------------------------类型属性（存储类型属性可以是常量或变量，计算类型属性只能是变量，与存储的实例属性不同，必须始终为存储的类型属性提供默认值，存储类型在首次访问时会被初始化，它们只保证初始化一次，即使多个线程访问时也是如此，并且不需要lazy来修饰）

        // 1.定义类型属性
        struct SomeStruct {
            // 可以使用static关键字定义存储类型属性
            static var m = "hello"

            // 定义计算类型属性
            static var n : Int {
                return 1
            }
        }

        // 用class关键字来实现子类重写父类中的属性
        class SomeClass {
            class var overrideV : Int {
                return 10
            }
        }

        // 2.查询和设置类型属性（查询类型属性并使用点语法,但是不需要用它所在的类的实例中去设置，只需要通过类去查询）
        SomeStruct.m = "你好"
        print(SomeStruct.m)
        print(SomeStruct.n)// 只读计算类型属性
        print(SomeClass.overrideV)// 只读计算类型属性

    }
}


