//
//  KamiView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

enum AnimBtnState {
    case none
    case view
    case animation
}

class KamiView: UIView {

    let name: String = "かみ"
    var button: UIButton!
    let animName: String = "かめ"
    var animButton: UIButton!
    var animState: AnimBtnState = AnimBtnState.none

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
        
        animButton = UIButton()
        animButton.adjustsImageWhenHighlighted = false
        animButton.imageView?.contentMode = UIView.ContentMode.scaleToFill
        animButton.contentHorizontalAlignment = .fill
        animButton.contentVerticalAlignment = .fill
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        animButton.frame = CGRect(x: frame.width * 0.325, y: 30, width: frame.width * 0.35, height: frame.height * 0.25)
    }
    
    // アイテム出現アニメーション
    func animOn() {
        if animState == .none {
            animButton.setImage(UIImage(named: "kami_anim"), for: UIControl.State.normal)
            self.addSubview(animButton)
            let anim = CABasicAnimation(keyPath: "opacity")
            anim.fromValue = 0.0
            anim.toValue = 1.0
            anim.duration = 1.0
            anim.isRemovedOnCompletion = false
            anim.fillMode = CAMediaTimingFillMode.forwards
            animButton.layer.add(anim, forKey: "animKey")
            animState = .view
        }
    }
    
    // アイテムアニメーション
    func animOn2() {
        if animState == .view {
            let anim = CABasicAnimation(keyPath: "transform.rotation.z")
            anim.fromValue = -(Double.pi / 36)
            anim.toValue = Double.pi / 36
            anim.duration = 0.5
            anim.autoreverses = true
            anim.repeatCount = HUGE
            animButton.layer.add(anim, forKey: "animKey")
            animState = .animation
        }
    }

    func animOff() {
        if animState != .none {
            animButton.layer.removeAnimation(forKey: "animKey")
            animButton.removeFromSuperview()
            animState = .none
        }
    }
    
    func animOff2() {
        if animState == .animation {
            animButton.layer.removeAnimation(forKey: "animKey")
            animState = .view
        }
    }
}
