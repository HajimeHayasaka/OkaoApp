//
//  KuchiView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class KuchiView: UIView {

    let name: String = "くち"
    var button: UIButton!
    var animView: UIImageView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        button = UIButton()
        button.setImage(UIImage(named: "kuchi"), for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted = false
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        self.addSubview(button)
        
        animView = UIImageView()
        animView.contentMode = UIView.ContentMode.scaleToFill
        self.addSubview(animView)
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        animView.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    func animOn() {
        let anim = CABasicAnimation(keyPath: "opacity")
        anim.fromValue = 1.0
        anim.toValue = 0.0
        anim.duration = 1.0
        anim.isRemovedOnCompletion = false
        anim.fillMode = CAMediaTimingFillMode.forwards
        button.layer.add(anim, forKey: "animKey")
        
        let anim2 = CABasicAnimation(keyPath: "opacity")
        anim2.fromValue = 0.0
        anim2.toValue = 1.0
        anim2.duration = 1.0
        anim2.isRemovedOnCompletion = false
        anim2.fillMode = CAMediaTimingFillMode.forwards
        animView.image = UIImage(named: "kuchi_anim")
        animView.layer.add(anim2, forKey: "animKey")
    }
    
    func animOff() {
        button.layer.removeAnimation(forKey: "animKey")
        button.setImage(UIImage(named: "kuchi"), for: UIControl.State.normal)
        animView.layer.removeAnimation(forKey: "animKey")
        animView.image = nil
    }
}
