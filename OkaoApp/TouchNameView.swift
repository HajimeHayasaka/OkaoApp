//
//  TouchNameView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/27.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class TouchNameView: UIView {

    var label: UILabel!
    
    // UIViewクラスを使う場合に必要な初期化処理（その１）
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // UIViewクラスを使う場合に必要な初期化処理（その２）
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
//        label.font = UIFont(name: "STHeitiSC-Medium", size: 80)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 80)
        label.text = ""
        self.addSubview(label)
    }
    
    override func layoutSubviews() {
        label.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    func setLabel(name: String) {
        label.text = name
    }
}
