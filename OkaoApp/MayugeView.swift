//
//  MayugeView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/27.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class MayugeView: UIView {


    let name: String = "まゆげ"
    var button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton()
        button.setImage(UIImage(named: "mayuge"), for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    func animOn() {
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = -(Double.pi / 16)
        anim.toValue = Double.pi / 16
        anim.duration = 1.0
        anim.autoreverses = true
        anim.repeatCount = HUGE
        button.layer.add(anim, forKey: "anmiKey")
    }
    
    func animOff() {
        button.layer.removeAnimation(forKey: "anmiKey")
    }
}