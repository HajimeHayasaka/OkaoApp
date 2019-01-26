//
//  ViewController.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/27.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var titleView: TitleView!
    var startButton: StartButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleCGRect: CGRect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let startCGRect: CGRect = CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.8, width: view.frame.width * 0.4, height: 100)
        
        self.view.backgroundColor = UIColor(named: "bgcolor")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        titleView = TitleView(frame: titleCGRect)
        titleView.animOn()
        self.view.addSubview(titleView)
        
        startButton = StartButtonView(frame: startCGRect)
        self.view.addSubview(startButton)
        startButton.button.addTarget(self, action: #selector(startButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func startButtonClicked(sender: UIButton) {
        print("startButtonClicked")
        let secondVC: PlayViewController = PlayViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

