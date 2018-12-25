//
//  ViewController.swift
//  SwiftCode9
//
//  Created by 李慧娟 on 2018/12/12.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

/*
 // MARK: - 可选链（Optional Chaining）
 ------------------------------------
 可选链是一个查询和调用当前可选项的属性、方法和下标的过程;
 如果可选项有值，则调用成功,返回该值，如果可选项为nil，调用失败，则返回nil;
 多次请求或调用会被链接成一个链，任意一个节点调用失败将导致整条链失效
 */

import UIKit

/*
 // MARK: - 1.可选链可替代强制解析
 通过在属性、方法和小下标的可选值后边加?,即可定义一个可选链
 */
class Residence {
    var numberOfRooms = 1
}

class Person {
    var residence: Residence?
}

/*
 // MARK: - 2.为可选链定义模型类
 您可以使用可选链接来调用超过一级深度的属性，方法和下标。
 这使您可以深入查看相互关联类型的复杂模型中的子属性，并检查是否可以访问这些子属性上的属性，方法和下标
 */
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Residence2 {
    var address: Address?

    // 定义存储属性
    var rooms = [Room]()
    // 定义计算属性
    var numberOfRooms: Int {
        return rooms.count
    }
    // 定义下标
    subscript(i: Int) -> Room {
        return rooms[i]
    }

    // 定义函数
    func printNum() {
        print("房号为---\(numberOfRooms)")
    }

}

class Person2 {
    var residence: Residence2?
}


class Address {
    var buildName: String?
    var buildNum: String?
    var street:String?

    func buildIdentifier() -> String? {
        if buildName != nil {
            return buildName
        }
        else if buildNum != nil {
            return buildNum
        }
        else if street != nil {
            return street
        }
        else
        {
            return nil
        }
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 可选链替代强制解析
        let john = Person()// 当被初始化时，Person里的residence属性为nil,因为它是可选的
//        print(john.residence!.numberOfRooms)// 会报错，因为没有值可供解析
        john.residence = Residence()// 这时有值了
        print(john.residence!.numberOfRooms)// 不会报错

        if let m = john.residence?.numberOfRooms {
            print("有值--\(m)")
        } else {
            print("没值")
        }
        print("----------------------------")

        // 通过可选链访问属性
        let lili = Person2()
        if let n = lili.residence?.numberOfRooms {
            print("有值---\(n)")
        } else {
            print("没值")
        }

        let someAddress = Address()
        someAddress.buildName = "联合大厦"
        someAddress.buildNum = "20号"
        someAddress.street = "朝外大街"
        lili.residence?.address = someAddress// 尝试设置会失败，因为此时lili.residence为nil
        print("----------------------------")

        // 通过可选链接调研方法
        lili.residence?.printNum()// 调用失败，因为lili.residence为nil
        print("----------------------------")


        // 下面会调用属性和方法成功
        let residence2 = Residence2()
        residence2.rooms = [Room.init(name:"丰联"), Room.init(name:"悠唐")]
        lili.residence = residence2
        lili.residence?.printNum()
        lili.residence?.address = someAddress
        let myStr: String? = lili.residence?.address?.buildIdentifier()
        print("myStr----\(myStr!)")
        print(lili.residence?.numberOfRooms ?? "1")
        print("----------------------------")

        // 通过可选链访问下标
        print(lili.residence?[1].name ?? "")
        print("----------------------------")

        // 链接多级链接
        if let s = lili.residence?.address?.buildName {
            print("s==\(s)")
        } else {
            print("s无值")
        }
        print("----------------------------")

        // 使用可选返回值链接方法
        if let buildId = lili.residence?.address?.buildIdentifier() {
            print("buildId==\(buildId)")
        }
        print("----------------------------")

        // 如果想在方法的可选值后进行进一步的链接
        if let boolValue = lili.residence?.address?.buildIdentifier()?.hasPrefix("联合") {
            if boolValue == true {
                print("包含该项字符串")
            }
        }
        print("----------------------------")





    }


}

