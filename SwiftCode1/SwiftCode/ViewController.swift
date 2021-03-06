//
//  ViewController.swift
//  SwiftCode
//
//  Created by 李慧娟 on 2018/10/29.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         var声明变量，
         let声明常量，并且要被赋初始值
         */

        /*
         //MARK: - 1.基本语法及字符串
         ---------------------------------------
         */
        // 后边不必带分号，但一行有多个语句时，后边要用分号隔开
        var myString = "hello world"
        myString = "Hello world"

        // 在创建常量或者变量时，如果不能i明确的表示它的值，就用:在后边标示出其类型
        let floatValue: Float = 70


        // 用\()去表示某个常量或变量
        let width = 50
        let str2 = "the width is \(width)"
        print(str2)

        // 如果要使用关键字作为标识符，可以在关键词前后添加重音符号
        let `class` = "class"

        // 检查API的可用性
        if #available(iOS 10, macOS 10.12, *) {
            // 符合此系统下的设备会执行
        } else {
            // 之外的
        }


        /*
         //MARK: - 2.字符串和字符
         ---------------------------------------
         */
        let myString2 = "你好"

        // 其他类型转换为字符串
        let str1 = "the width is "
        print(str1 + String(width))

        // 占用多行的字符串，用"""
        let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
        Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(width) pieces of fruit.
        """
        print(quotation)

        // 空字符串（可以用字符串的isEmpty属性来判断是否为空字符串）
        let stringA = "string不是空字符串"
        if stringA.isEmpty {
            print("stringA是空字符串")
        } else {
            print("stringA不是空字符串")
        }

        let stringB = String()
        if stringB.isEmpty {
            print("stringB是空字符串")
        } else {
            print("stringB不是空字符串")
        }

        // 字符串拼接可以直接用+号或+=
        print(myString + myString2)
        print(myString += myString2)

        // 字符串长度用.count计算
        print("stringA 的长度为\(stringA.count)")

        // 字符串（用==来比较是否相等）
        let isEqual = (stringA == stringB) ? true:false// 是否全等
        print(isEqual)
        let isHasPrefix = stringA.hasPrefix("str")// 是否含有前缀
        let isHasSuffix = stringA.hasSuffix("你好")// 是否含有后缀
        print("是否含有前缀---\(isHasPrefix)\n是否含有后缀---\(isHasSuffix)")// \n表示换行，\t表示空格


        // 创建字符
        let charA: Character = "a"//储存多个值，比如"ab"会报错，只能是单一的字符
        print("charA的值为\(charA)")

        // 遍历字符串中的字符
        var stringC = "hello"
        for ch in stringC  {
            print(ch)
        }

        // 把数组中的字符整合为字符串
        let charArray: [Character] = ["c","a","t","!","🐱"]
        let catString = String(charArray)
        print(catString)

        // 将字符拼接到字符串后边（不能将字符串拼接到字符后边，因为字符必须包含单个字符）
        stringC.append(charA)
        print(stringC)


         //--------------*****访问和修改字符串
        // 访问字符串
        var mString = "my heart will go on"
        print(mString[mString.startIndex])//首位字符 m
//        print(mString[mString.endIndex])// 访问末位字符会报错
        print(mString[mString.index(before: mString.endIndex)])// 访问某个索引之前的字符 n
        print(mString[mString.index(after: mString.startIndex)])// 访问某个索引之后的字符 y
        let index = mString.index(mString.startIndex, offsetBy: 3)//从某个下标开始，距离为3的索引
        print("mString----\(mString[index])")// h

        // 使用indices属性可以访问字符串中各个字符的所有索引
        for index1 in mString.indices {
            print("\(mString[index1])")
        }

        // 插入
        mString.insert("!", at: mString.endIndex)// 插入单个字符
        mString.insert(contentsOf: "你好", at: mString.index(before: mString.endIndex))// 插入字符串
        print(mString)// my heart will go on你好!

        // 删除
        // 指定索引处删除单个字符
        mString.remove(at: mString.index(mString.startIndex, offsetBy: 1))// 删除第1个
        print("删除单个字符---\(mString)")//m heart will go on你好!

        // 删除指定范围内的字符串
        let startIndex = mString.index(mString.endIndex, offsetBy: -6)// 从最后一位，往前推6个的范围
        let range = startIndex..<mString.endIndex
//        let range2 = Range(uncheckedBounds: (startIndex,mString.endIndex))
        mString.removeSubrange(range)
        print("删除指定范围内字符----\(mString)")//m heart will go

        // Substrings（子字符串-与字符串大多都是相同的处理方法m，但是与字符串不同，当需要长久使用某个子字符串时，需要将它强转为字符串进行存储）
        let index1 = mString.firstIndex(of: "g")// 查找某个字符所在的位置，如果有多个相同的，则取第一个
        // ??空合运算符 x??y 表示，x 是否为nil，如果不为nil,则取x,如果为nil，则取y的值
        let index2 = index1 ?? mString.endIndex
        let subStr1 = mString[..<index2]
        print("子字符串的值为--\(subStr1)")

        // 把子字符串强转为字符串类型，并长期存储
        let newStr = String(subStr1)
        print("子字符串转换为字符串-----\(newStr)")


        /*
         //MARK: - 3.可选类型（Optionals）
         ---------------------------------------
         swift可选类型用于处理值缺失的情况，可选表示“那儿有一个值，等于x,或者没有值”，定义用后缀？来表示可选；
         如果一个可选类型的实例包含一个值，可以用!来访问这个值,!表示“我知道这个可选有值，请使用它”，这叫做【强制解析】；
         在声明可选变量时，用！来代替？，这样在访问可选值时，就不用加！来强制解析，这重种叫做【自动解析】；
         使用【可选绑定】来判断可选类型值是否包含值，如果包含，就把值符给一个临时变量或常量；
         处理可选值的另一种方法是用？？运算符提供默认值，如果缺少可选值，则使用默认值
         */

        // 可选声明及访问
        var optionString: String? = "john"
        print(optionString == nil)// false
        print(optionString!)

        // 自动解析
        var optionStr: String! = "你好"
        print(optionStr)

        // 可选绑定（把值赋给临时常量name）
        if let name = optionString {
             print("hello \(name)")
        } else {
            print("可选字段没有值哦～")
        }

        // ??运算符处理可选值
        let nickName: String? = nil
        let fullName: String = "lhj"
        print("hi,\(nickName ?? fullName)")// hi,lhj

        /*
         //MARK: - 4.条件和循环语句
         ---------------------------------------
         注：for循环在swift3重已被弃用
         continue语句表示结束当前循环进入下一循环
         break表示结束当前循环，并且跳出循环
         fallthrough表示依次执行每个条件中循环体，不管符不符合条件
         return结束循环体
         */
        // for...in...
        let array2 = [18,20,34,56,12,11]
        var count = 0
        for score in array2 {
            if score > 50 {
                count += 3
            } else {
                count += 1
            }
        }
        print(count)

        var number: Int = 0

        let dic2 = ["one":[1,2,3,4,5],
                    "two":[6,7,8,9,10],
                    "three":[3,6,9,5,7]]
        // 循环遍历字典中的数组
        for (_, values) in dic2 {// 如果不需要使用某个值，可以用_去忽略
            for value in values {
                if value > number {
                    number += 1
                }
            }
        }
        print(number)

        // switch（支持任何类型的数据和各种的比较操作，不限于整数和相等的测试）
        let fruit = "apple"
        switch fruit {
        case "banana":
            print("This is a banana")
        case "lemon":
            print("This is a lemon")
        case "apple","li":// 可以用逗号分隔多个情况，只要匹配其中一个就行
            print("This is an apple")
        default:
            print("no fruit")
        }

        // 范围匹配
        let mCount = 1993
        switch mCount {
        case 0:
            print("mCount在此范围内--0")
        case 1..<5:
            print("mCount在此范围内--1..<5")
        case 5..<10:
            print("mCount在此范围内--5..<10")
        case 1000..<2000:
            print("mCount在此范围内--1000..<2000")
        default:
            print("mCount都不在此范围内")
        }

        // 元祖匹配-在switch中测试多个值，或者用_来匹配任何可能的值
        let somePoint = (1, 1)// 坐标
        switch somePoint {
        case (0, 0):
            print("\(somePoint) in this origin(0, 0)")
        case (_, 0):
            print("\(somePoint) in this origin(_, 0)")
        case (0, _):
            print("\(somePoint) in this origin(0, _)")
        case (-2...2, -2...2):
            print("\(somePoint) in this origin(-2...2, -2...2)")
        default:
            print("no origin")
        }

        // while...
        var m = 2
        while m < 10 {
            m = m * 2;
        }
        print(m)

        repeat {
            m *= 2
        } while m < 20
        print(m)

        // ..<
        var total = 0
        for i in 0..<4 {// 从0循环到3
            total += i
            print(total)
        }

        // 间隔特定的数进行循环，例如，每5个数做一个标记
        let minIntervel = 5
        for tickMark in stride(from: 0, to: 20, by: minIntervel) {//跳过不需要的标记
            print("tickMark----\(tickMark)")//0,5,10,15
        }

        for tickMark in stride(from: 0, through: 20, by: minIntervel) {// 封闭范围
            print("tickMark----\(tickMark)")//0,5,10,15,20
        }




        /*
         //MARK: - 5.数组、字典和集合
         数组是有序值集合，字典是键值关联的无序集合，set是唯一值的无序集合
         创建集合时，当把它赋值给一个常量，它就是不可变的，其大小和内容不能修改，当把它赋值给一个变量，则它是可变的，可以修改删除
         ---------------------------------------
         */

        //--------------*****数组
        // 创建空数组初始化程序,当指定数组中的类型时，则数组中只能存放该类型的数据
        var emptyArray = [String]()// 当能推断出类型时，也可以写为emptyArray = []

        // 创建相同元素，并指定数量的数组
        let array = Array(repeating: "哈喽", count: 5)
        print(array)

        // 两个数组想加可以创建新的数组
        emptyArray = Array(repeating: "你好啊", count: 2)
        let newArray = emptyArray + array
        print(newArray)

        // 创建数组或字典，使用[]，最后一个元素允许用逗号，访问数组或字典中的元素时通过索引或键
        var array1 = ["peace","of","love"]
        print(array1)
        print("数组是否为空---\(array1.isEmpty)")// 检查数组count是否为0

        // 数组添加元素
        array1.insert("hahha", at: 0)// 在数组某个位置插入数组
        array1.append("other")// 在数组后边拼接数组
        array1 += ["我是被添加的"]// 用+=运算符合并数组
        print("添加之后的数组为---\(array1)")// ["hahha", "peace", "of", "love", "other", "我是被添加的"]

        // 修改数组元素
        array1[1] = "and"// 修改某个索引下元素的值
        array1[0...2] = ["我是被替换的～"]// 替换0.1.2索引范围的值，替换内容长度可以与指定范围内不相等
        print("修改之后的数组为---\(array1)")// ["我是被替换的～", "love", "other", "我是被添加的"]

        // 删除数组中的元素
        //        array1.removeAll()// 删除全部
        //        array1.remove(at: 0)// 删除某个元素，返回被删除的元素
        let item = array1.removeLast()// 删除最后一个元素，返回被删除的元素
        print(item)
        print("删除之后的数组为---\(array1)")

        // 检查数组是否包含某个元素
        print("数组是否包含love---\(array1.contains("love"))")

        // 遍历数组
        for str in array1 {// 不带索引的
            print(str)
        }
        for (index,value) in array1.enumerated() {// enumerated()方法返回数组的下标和所在下标的元素组成的元祖
            print("第\(index + 1)个元素为\(value)")
        }

        //--------------*****字典
        // 创建空字典
        var dic1 = [String: String]()//// 当能推断出类型时，也可以写为emptyDic = [:]
        dic1["add"] = "添加"
        print("dic1的值为----\(dic1)")

        dic1 = [:]
        print("dic1又被重新赋值为空字典----\(dic1)")

        dic1 = ["name":"lhj",
                "age":"25",
                "gender":"女"]
        dic1["age"] = "24"
        print("dic1被重新赋值为----\(dic1)")

        // 访问字典
        print("dic1的数量为\(dic1.count)")// 字典的键值对数量
        print("dic1是否为空----\(dic1.isEmpty)")//字典的键值对数量是否为0

        // 字典添加键值对
        dic1["new"] = "新的"

        // 字典通过kkey修改value的值
        dic1["new"] = "修改后新的"// 当此key存在的时候，则修改key对应的value值，当key不存在的时候，新增键值对
        let oldValue:String! = dic1.updateValue("我也是新的", forKey: "new")// 与上面方法相同，但不同的是，该方法返回被修改的旧值
        print("被修改前的值为----\(oldValue!)")
        print("dic1的值为----\(dic1)")

        // 利用可选绑定检索字典中的值
        if let valueStr = dic1["newKey"] {
            print("newKey对应的值为--\(valueStr)")
        } else {
            print("newKey对应的值不存在")
        }

        // 删除某个键值对，只需要通过key把value设置为nil
        dic1["new"] = nil
        print("dic1删除new键值对之后的值为---\(dic1)")

        // 或者用removeValue forKey方法删除某个键值对，此方法会返回被删除的值，如果不存在该值，则返回nil
        let removeValue =  dic1.removeValue(forKey: "name")
        print("被删除的值为---\(removeValue!)")

        // 遍历字典
        for (keyStr, valueStr) in dic1 {// 通过字典中的每一项元祖进行遍历
            print("\(keyStr)---\(valueStr)")
        }

        for keyStr2 in dic1.keys.sorted() {//
            print("keyStr2----\(keyStr2)")
        }

        for valueStr2 in dic1.values {
            print("value----\(valueStr2)")
        }

        //--------------*****集合
        // 创建某个类型的空集合，无序且自动去重
        var newSet = Set<Int>()
        newSet = [1,2,3,4,4,5,6]
        newSet.insert(8)
        newSet.remove(1)
//        newSet.removeAll()
        print("newSet的count为---\(newSet.count)\t newSet===\(newSet)")

        print("newSet是否为空----\(newSet.isEmpty)")
        print("newSet是否包含5---\(newSet.contains(5))")

        // 遍历集合并排序
        for intvalue in newSet.sorted() {
            print("------\(intvalue)")
        }

        let aSet: Set = [1,3,5,7,9]
        let bSet: Set = [3,9,2,4,6]
        // intersection方法创建包含两个集合交集的新集合
        print(aSet.intersection(bSet).sorted())// [3, 9]

        //symmetricDifference方法创建一个包含任一集合中的值，但不能包含其交集
        print(aSet.symmetricDifference(bSet).sorted())// [1, 2, 4, 5, 6, 7]

        // union方法创建包含两个集合并集的新集合
        print(aSet.union(bSet).sorted())// [1, 2, 3, 4, 5, 6, 7, 9]

        //subtracting方法创建一个值不在指定集合的新集
        print(aSet.subtracting(bSet).sorted())//[1, 5, 7]

        // isSubset of方法判断集合的所有值是否包含在指定的集合里
        print(aSet.isSubset(of: bSet))

        // isSuperset of方法判断集合是否包含指定集合中的所有值
        print(aSet.isSuperset(of: bSet))

        // isStrictSubset或isStrictSuperset方法判断集合是否是指定集合的子集或超集，但不等于
        print(aSet.isStrictSubset(of: bSet))

        // isDisjoint with方法判断两个集合有没有共同的值
        print(aSet.isDisjoint(with: bSet))

        print("\(aSet)----\(bSet)")

    }

}

