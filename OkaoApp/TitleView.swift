//
//  TitleView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class TitleView: UIView {

    var imageView: UIImageView!
    
    // UIViewクラスを使う場合に必要な初期化処理（その１）
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // UIViewクラスを使う場合に必要な初期化処理（その２）
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "title")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        imageView.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
    }
    
    func animOn() {
        let anim = CABasicAnimation(keyPath: "transform.rotation.z")
        anim.fromValue = -(Double.pi / 36)
        anim.toValue = Double.pi / 36
        anim.duration = 1.0
        anim.autoreverses = true
        anim.repeatCount = HUGE
        imageView.layer.add(anim, forKey: nil)
    }


}
