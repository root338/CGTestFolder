//
//  YMTestSwiftVC.swift
//  YMTestOCSwift
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class YMTestSwiftVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testView = YMTestOCView.init()
        self.view.addSubview(testView)
        testView.frame = self.view.bounds;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
