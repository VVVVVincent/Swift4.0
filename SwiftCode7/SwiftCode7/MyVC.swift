//
//  MyVC.swift
//  SwiftCode7
//
//  Created by 李慧娟 on 2018/12/4.
//  Copyright © 2018年 李慧娟. All rights reserved.
//

import UIKit

class MyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 在其它类中，定义另一个类的实例，可以访问该类的属性或方法
        let vc = SuperVC()
        vc.makeNoise()
        print(vc.m)

        let  subVc = SubVC()
        subVc.makeNoise()// 会调用子类中被重写的那个方法
        print(subVc.m)


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
