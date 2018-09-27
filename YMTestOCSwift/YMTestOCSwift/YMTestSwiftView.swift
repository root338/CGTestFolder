//
//  YMTestSwiftView.swift
//  YMTestOCSwift
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class YMTestSwiftView: UIView {

    let titleLabel = UILabel.init()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.text = NSStringFromClass(YMTestSwiftView.self)
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = self.bounds
    }
}
