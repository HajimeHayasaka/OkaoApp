//
//  KamiView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class KamiView: UIView {

    let name: String = "かみ"
    var button: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton()
        button.setImage(UIImage(named: "kami"), for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted = false
        button.imageView?.contentMode = UIView.ContentMode.scaleToFill
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        self.addSubview(button)        
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    // 拡大縮小アニメーション
    func animOn() {
        let anim = CABasicAnimation(keyPath: "transform.scale")
        anim.fromValue = 1.0
        anim.toValue = 1.2
        anim.duration = 1.0
        anim.autoreverses = true
        anim.repeatCount = HUGE
        button.layer.add(anim, forKey: "animKey")
    }
    
    func animOff() {
        button.layer.removeAnimation(forKey: "animKey")
    }
}
