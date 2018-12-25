//
//  TypeCastingVC.swift
//  SwiftCode10
//
//  Created by 李慧娟 on 2018/12/21.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

/*
 // MARK: - 类型转换（Type Casting）
 -------------------------------------
 类型转换是一种检查实例类型的方法，也可以用来检查某个实例类是否属于另一个类的父类或子类；
 Swift中类型转换是用as和is运算符来实现的
*/


class MediaItem {
    var myName: String
    init(name: String) {
        myName = name
    }
}

class Movie: MediaItem {
    var myDirector: String
    init(name: String, director: String) {
        self.myDirector = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var myArtist: String
    init(name: String, artist: String) {
        self.myArtist = artist
        super.init(name: name)
    }
}

class TypeCastingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let array = [
            Movie.init(name: "无双", director: "张艺谋"),
            Song.init(name: "李茶的姑妈", artist: "那英"),
            Song.init(name: "大江大河", artist: "王凯"),
            Movie.init(name: "驴得水", director: "不知道"),
            Song.init(name: "打败", artist: "好妹妹乐队")
        ]

        var movieCount = 0
        var songCount = 0


        /*
         // MARK: - 1.用is检查实例类型
         */
        for item in array {
            if item is Movie {
                movieCount += 1
            } else if item is Song {
                songCount += 1
            }
        }

        print("movieCount====\(movieCount)\nsongCount=====\(songCount)")
        print("----------------------------")

        /*
         // MARK: - 2.用as转换类型
         */
        for listValue in array {
            if let a = listValue as? Movie {
                print("Movie:\(a.myName)---\(a.myDirector)")
            }
            else if let b = listValue as? Song {
                print("Song:\(b.myName)-----\(b.myArtist)")
            }
        }
        print("-------------------------------------")

        /*
         // MARK: - 3.为Any和AnyObject做类型铸造
         Any表示任何类型，包括函数类型
         AnyObject表示任何类型的实例
         */
        var someThings:[Any] = [0,
                                0.0,
                                3.1415926,
                                "hello",
                                (3, 5),
                                Movie(name: "蜘蛛侠", director: "罗素兄弟"),
                                {(name: String) -> String in "hello \(name)"}
        ]

        for thing in someThings {
            switch thing {
            case 0 as Int:
                print("0 is int")
            case 0 as Double:
                print("0 is double")
            case let movie as Movie:
                print("Movie:\(movie.myName)---\(movie.myDirector)")
            case let (x, y) as (Double, Double):
                print("\(x)---\(y)")
            case let colurse as (String) -> String:
                print(colurse("lhj"))
            default:
                print("没有匹配")
            }
        }

        let optionNum: Int? = 3
        someThings.append(optionNum as Any)

    }
    


}
