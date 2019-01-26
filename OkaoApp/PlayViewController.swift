//
//  PlayViewController.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var kaoView: KaoView!
    var kamiView: KamiView!
    var meLeftView: MeView!
    var meRightView: MeView!
    var hanaView: HanaView!
    var kuchiView: KuchiView!
    var mimiLeftView: MimiView!
    var mimiRightView: MimiView!
    var touchNameLabel: TouchNameView!
    
    var activeView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let kaoX: CGFloat = view.frame.width * 0.05
        let kaoY: CGFloat = view.frame.height * 0.4
        let kaoWidth: CGFloat = view.frame.width * 0.85
        let kaoHeight: CGFloat = view.frame.width * 0.85
        
        let kaoCGRect = CGRect(x: kaoX, y: kaoY, width: kaoWidth, height: kaoHeight)
        let kamiCGRect = CGRect(x: kaoX - 10, y: kaoY - 100, width: kaoWidth + 20, height: kaoWidth * 0.7)
        let meLeftCGRect = CGRect(x: kaoX + kaoWidth * 0.15, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let meRightCGRect = CGRect(x: kaoX + kaoWidth * 0.65, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let hanaCGRect = CGRect(x: kaoX + kaoWidth * 0.45, y: kaoY + kaoHeight * 0.5, width: kaoWidth * 0.1, height: kaoWidth * 0.2)
        let kuchiCGRect = CGRect(x: kaoX + kaoWidth * 0.35, y: kaoY + kaoHeight * 0.7, width: kaoWidth * 0.3, height: kaoWidth * 0.2)
        let mimiLeftCGRect = CGRect(x: kaoX - kaoWidth * 0.1, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.25)
        let mimiRightCGRect = CGRect(x: kaoX + kaoWidth * 0.92, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.25)

        kaoView = KaoView(frame: kaoCGRect)
        kamiView = KamiView(frame: kamiCGRect)
        meLeftView = MeView(frame: meLeftCGRect)
        meRightView = MeView(frame: meRightCGRect)
        hanaView = HanaView(frame: hanaCGRect)
        kuchiView = KuchiView(frame: kuchiCGRect)
        mimiLeftView = MimiView(frame: mimiLeftCGRect)
        mimiRightView = MimiView(frame: mimiRightCGRect)
        mimiLeftView.button.setImage(UIImage(named: "mimi_left"), for: .normal)
        mimiRightView.button.setImage(UIImage(named: "mimi_right"), for: .normal)
        
        self.view.addSubview(mimiLeftView)
        self.view.addSubview(mimiRightView)
        self.view.addSubview(kaoView)
        self.view.addSubview(kamiView)
        self.view.addSubview(meLeftView)
        self.view.addSubview(meRightView)
        self.view.addSubview(hanaView)
        self.view.addSubview(kuchiView)
        
        touchNameLabel = TouchNameView(frame: CGRect(x: 0.0, y: view.frame.height * 0.1, width: view.frame.width, height: 80))
        self.view.addSubview(touchNameLabel)

        kaoView.button.addTarget(self, action: #selector(kaoViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        kamiView.button.addTarget(self, action: #selector(kamiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        meLeftView.button.addTarget(self, action: #selector(meViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        meRightView.button.addTarget(self, action: #selector(meViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        hanaView.button.addTarget(self, action: #selector(hanaViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        kuchiView.button.addTarget(self, action: #selector(kuchiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mimiLeftView.button.addTarget(self, action: #selector(mimiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mimiRightView.button.addTarget(self, action: #selector(mimiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func kaoViewClicked(sender: UIButton) {
        print("kaoViewClicked")
        animOff()
        kaoView.animOn()
        touchNameLabel.setLabel(name: kaoView.name)
    }
    
    @objc func kamiViewClicked(sender: UIButton) {
        print("kamiViewClicked")
        animOff()
        kamiView.animOn()
        touchNameLabel.setLabel(name: kamiView.name)
    }
    
    @objc func meViewClicked(sender: UIButton) {
        print("meViewClicked")
        animOff()
        meLeftView.animOn()
        meRightView.animOn()
        touchNameLabel.setLabel(name: meLeftView.name)
    }
    
    @objc func hanaViewClicked(sender: UIButton) {
        print("hanaViewClicked")
        animOff()
        hanaView.animOn()
        touchNameLabel.setLabel(name: hanaView.name)
    }
    
    @objc func mimiViewClicked(sender: UIButton) {
        print("mimiViewClicked")
        animOff()
        mimiLeftView.animOn()
        mimiRightView.animOn()
        touchNameLabel.setLabel(name: mimiLeftView.name)
    }
    
    @objc func kuchiViewClicked(sender: UIButton) {
        print("kuchiViewClicked")
        animOff()
        kuchiView.animOn()
        touchNameLabel.setLabel(name: kuchiView.name)
    }
    
    func animOff() {
        kaoView.animOff()
        kamiView.animOff()
        meLeftView.animOff()
        meRightView.animOff()
        hanaView.animOff()
        kuchiView.animOff()
        mimiLeftView.animOff()
        mimiRightView.animOff()
    }
}
