//
//  PlayViewController.swift
//  KidsPlay_Okao
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let kaoCGRect: CGRect = CGRect(x: view.frame.width * 0.05,
                                       y: view.frame.height * 0.4,
                                       width: view.frame.width * 0.85,
                                       height: view.frame.width * 0.85)
        kaoView = KaoView(frame: kaoCGRect)

        let kamiCGRect: CGRect = CGRect(x: kaoView.frame.origin.x - 10,
                                        y: kaoView.frame.origin.y - 100,
                                        width: kaoView.frame.width + 20,
                                        height: view.frame.width * 0.7)
        let meLeftCGRect: CGRect = CGRect(x: kaoView.frame.origin.x + kaoView.frame.width * 0.15,
                                          y: kaoView.frame.origin.y + kaoView.frame.height * 0.45,
                                          width: kaoView.frame.width * 0.2,
                                          height: kaoView.frame.width * 0.2)
        let meRightCGRect: CGRect = CGRect(x: kaoView.frame.origin.x + kaoView.frame.width * 0.65,
                                           y: kaoView.frame.origin.y + kaoView.frame.height * 0.45,
                                           width: kaoView.frame.width * 0.2,
                                           height: kaoView.frame.width * 0.2)
        let hanaCGRect: CGRect = CGRect(x: kaoView.frame.origin.x + kaoView.frame.width * 0.45,
                                        y: kaoView.frame.origin.y + kaoView.frame.height * 0.5,
                                        width: kaoView.frame.width * 0.1,
                                        height: kaoView.frame.width * 0.2)
        let kuchiCGRect: CGRect = CGRect(x: kaoView.frame.origin.x + kaoView.frame.width * 0.35,
                                         y: kaoView.frame.origin.y + kaoView.frame.height * 0.7,
                                         width: kaoView.frame.width * 0.3,
                                         height: kaoView.frame.width * 0.2)
        let mimiLeftCGRect: CGRect = CGRect(x: kaoView.frame.origin.x - kaoView.frame.width * 0.1,
                                            y: kaoView.frame.origin.y + kaoView.frame.height * 0.45,
                                            width: kaoView.frame.width * 0.2,
                                            height: kaoView.frame.width * 0.25)
        let mimiRightCGRect: CGRect = CGRect(x: kaoView.frame.origin.x + kaoView.frame.width * 0.92,
                                             y: kaoView.frame.origin.y + kaoView.frame.height * 0.45,
                                             width: kaoView.frame.width * 0.2,
                                             height: kaoView.frame.width * 0.25)

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
        kaoView.anim()
    }
    
    @objc func kamiViewClicked(sender: UIButton) {
        print("kamiViewClicked")
        kamiView.anim()
    }
    
    @objc func meViewClicked(sender: UIButton) {
        print("meViewClicked")
        meLeftView.anim()
        meRightView.anim()
    }
    
    @objc func hanaViewClicked(sender: UIButton) {
        print("hanaViewClicked")
        hanaView.anim()
    }
    
    @objc func mimiViewClicked(sender: UIButton) {
        print("mimiViewClicked")
        mimiLeftView.anim()
        mimiRightView.anim()
    }
    
    @objc func kuchiViewClicked(sender: UIButton) {
        print("kuchiViewClicked")
        kuchiView.anim()
    }
    
}
