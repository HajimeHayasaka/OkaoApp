//
//  MeView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class MeView: UIView {

    let name: String = "め"
    var button: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton()
        button.setImage(UIImage(named: "me"), for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    // 回転＋拡大縮小アニメーション＋画像切り替え
    func animOn() {
        // 画像切り替え
        button.setImage(UIImage(named: "me_anim"), for: UIControl.State.normal)
        
        // 360度回転アニメーション
        let anim1 = CABasicAnimation(keyPath: "transform.rotation.z")
        anim1.fromValue = 0.0
        anim1.toValue = Double.pi * 2
        anim1.duration = 1.0
        anim1.repeatCount = HUGE
        
        // 拡大縮小アニメーション
        let anim2 = CABasicAnimation(keyPath: "transform.scale")
        anim2.fromValue = 1.0
        anim2.toValue = 1.4
        anim2.duration = 0.5
        anim2.autoreverses = true
        anim2.repeatCount = HUGE
        
        // ２つのアニメーションをグループ化
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 1.0
        animationGroup.repeatCount = HUGE
        animationGroup.animations = [anim1, anim2]
        button.layer.add(animationGroup, forKey: "animKey")
    }
    
    func animOff() {
        button.setImage(UIImage(named: "me"), for: UIControl.State.normal)
        button.layer.removeAnimation(forKey: "animKey")
    }
}
