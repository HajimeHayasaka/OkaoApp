//
//  OkaoView.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/02/03.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class OkaoView: UIView {
    
    var kaoView: KaoView!
    var kamiView: KamiView!
    var mayugeLeftView: MayugeView!
    var mayugeRightView: MayugeView!
    var meLeftView: MeView!
    var meRightView: MeView!
    var hanaView: HanaView!
    var kuchiView: KuchiView!
    var mimiLeftView: MimiView!
    var mimiRightView: MimiView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let kaoLength: CGFloat = frame.width > frame.height ? frame.height * 0.8 : frame.width * 0.8
        let kaoX: CGFloat = (frame.width - kaoLength) / 2 
        let kaoY: CGFloat = (frame.height - kaoLength) * 0.9
        let kaoWidth: CGFloat = kaoLength
        let kaoHeight: CGFloat = kaoLength
        
        let kaoCGRect = CGRect(x: kaoX, y: kaoY, width: kaoWidth, height: kaoHeight)
        let kamiCGRect = CGRect(x: kaoX - 5, y: kaoY - (kaoHeight * 0.25), width: kaoWidth + 10, height: kaoHeight * 0.7)
        let mayugeLeftCGRect = CGRect(x: kaoX + kaoWidth * 0.15, y: kaoY + kaoHeight * 0.4, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let mayugeRightCGRect = CGRect(x: kaoX + kaoWidth * 0.65, y: kaoY + kaoHeight * 0.4, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let meLeftCGRect = CGRect(x: kaoX + kaoWidth * 0.15, y: kaoY + kaoHeight * 0.55, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let meRightCGRect = CGRect(x: kaoX + kaoWidth * 0.65, y: kaoY + kaoHeight * 0.55, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let hanaCGRect = CGRect(x: kaoX + kaoWidth * 0.45, y: kaoY + kaoHeight * 0.6, width: kaoWidth * 0.1, height: kaoWidth * 0.2)
        let kuchiCGRect = CGRect(x: kaoX + kaoWidth * 0.35, y: kaoY + kaoHeight * 0.75, width: kaoWidth * 0.3, height: kaoWidth * 0.2)
        let mimiLeftCGRect = CGRect(x: kaoX - kaoWidth * 0.09, y: kaoY + kaoHeight * 0.57, width: kaoWidth * 0.18, height: kaoWidth * 0.22)
        let mimiRightCGRect = CGRect(x: kaoX + kaoWidth * 0.9, y: kaoY + kaoHeight * 0.57, width: kaoWidth * 0.18, height: kaoWidth * 0.22)
        
        kaoView = KaoView(frame: kaoCGRect)
        kamiView = KamiView(frame: kamiCGRect)
        mayugeLeftView = MayugeView(frame: mayugeLeftCGRect)
        mayugeRightView = MayugeView(frame: mayugeRightCGRect)
        meLeftView = MeView(frame: meLeftCGRect)
        meRightView = MeView(frame: meRightCGRect)
        hanaView = HanaView(frame: hanaCGRect)
        kuchiView = KuchiView(frame: kuchiCGRect)
        mimiLeftView = MimiView(frame: mimiLeftCGRect)
        mimiRightView = MimiView(frame: mimiRightCGRect)
        mimiLeftView.button.setImage(UIImage(named: "mimi_left"), for: .normal)
        mimiRightView.button.setImage(UIImage(named: "mimi_right"), for: .normal)
        
        self.addSubview(mimiLeftView)
        self.addSubview(mimiRightView)
        self.addSubview(kaoView)
        self.addSubview(mayugeLeftView)
        self.addSubview(mayugeRightView)
        self.addSubview(kamiView)
        self.addSubview(meLeftView)
        self.addSubview(meRightView)
        self.addSubview(hanaView)
        self.addSubview(kuchiView)
    }
    
    func animOff() {
        kaoView.animOff()
        kamiView.animOff()
        mayugeLeftView.animOff()
        mayugeRightView.animOff()
        meLeftView.animOff()
        meRightView.animOff()
        hanaView.animOff()
        kuchiView.animOff()
        mimiLeftView.animOff()
        mimiRightView.animOff()
    }

}
