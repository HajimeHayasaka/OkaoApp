//
//  ButtonView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class ButtonView: UIView {

    var button: UIButton!
    
    // UIViewクラスを使う場合に必要な初期化処理（その１）
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // UIViewクラスを使う場合に必要な初期化処理（その２）
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    // 画像をセットできるイニシャライザを用意
    init(frame: CGRect, image: String) {
        super.init(frame: frame)
        
        button = UIButton()
        button.setBackgroundImage(UIImage(named: image), for: UIControl.State.normal)
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }

}
