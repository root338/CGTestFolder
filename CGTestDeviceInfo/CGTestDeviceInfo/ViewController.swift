//
//  ViewController.swift
//  CGTestDeviceInfo
//
//  Created by apple on 2018/4/8.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // swift 下
//        print(UIDevice.current.machineModel)
//        _ = UIDevice.current.machineModel
//        _ = UIDevice.current.machineModel
        // oc 下
        UIDevice.current.allIpAddress()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

