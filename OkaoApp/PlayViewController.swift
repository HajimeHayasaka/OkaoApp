//
//  PlayViewController.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit
import AVFoundation

class PlayViewController: UIViewController {
    
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
    var touchNameLabel: TouchNameView!
    
    var audioPlayer : AVAudioPlayer!
    var soundPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playMusic()
        
        self.view.backgroundColor = UIColor.white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let kaoX: CGFloat = view.frame.width * 0.05
        let kaoY: CGFloat = view.frame.height * 0.4
        let kaoWidth: CGFloat = view.frame.width * 0.85
        let kaoHeight: CGFloat = view.frame.width * 0.85
        
        let kaoCGRect = CGRect(x: kaoX, y: kaoY, width: kaoWidth, height: kaoHeight)
        let kamiCGRect = CGRect(x: kaoX - 10, y: kaoY - 90, width: kaoWidth + 20, height: kaoWidth * 0.7)
        let mayugeLeftCGRect = CGRect(x: kaoX + kaoWidth * 0.15, y: kaoY + kaoHeight * 0.3, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let mayugeRightCGRect = CGRect(x: kaoX + kaoWidth * 0.65, y: kaoY + kaoHeight * 0.3, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let meLeftCGRect = CGRect(x: kaoX + kaoWidth * 0.15, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let meRightCGRect = CGRect(x: kaoX + kaoWidth * 0.65, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.2)
        let hanaCGRect = CGRect(x: kaoX + kaoWidth * 0.45, y: kaoY + kaoHeight * 0.5, width: kaoWidth * 0.1, height: kaoWidth * 0.2)
        let kuchiCGRect = CGRect(x: kaoX + kaoWidth * 0.35, y: kaoY + kaoHeight * 0.7, width: kaoWidth * 0.3, height: kaoWidth * 0.2)
        let mimiLeftCGRect = CGRect(x: kaoX - kaoWidth * 0.1, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.25)
        let mimiRightCGRect = CGRect(x: kaoX + kaoWidth * 0.92, y: kaoY + kaoHeight * 0.45, width: kaoWidth * 0.2, height: kaoWidth * 0.25)

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
        
        self.view.addSubview(mimiLeftView)
        self.view.addSubview(mimiRightView)
        self.view.addSubview(kaoView)
        self.view.addSubview(mayugeLeftView)
        self.view.addSubview(mayugeRightView)
        self.view.addSubview(kamiView)
        self.view.addSubview(meLeftView)
        self.view.addSubview(meRightView)
        self.view.addSubview(hanaView)
        self.view.addSubview(kuchiView)
        
        touchNameLabel = TouchNameView(frame: CGRect(x: 0.0, y: view.frame.height * 0.1, width: view.frame.width, height: 80))
        self.view.addSubview(touchNameLabel)

        kaoView.button.addTarget(self, action: #selector(kaoViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        kamiView.button.addTarget(self, action: #selector(kamiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mayugeLeftView.button.addTarget(self, action: #selector(mayugeViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mayugeRightView.button.addTarget(self, action: #selector(mayugeViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        meLeftView.button.addTarget(self, action: #selector(meViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        meRightView.button.addTarget(self, action: #selector(meViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        hanaView.button.addTarget(self, action: #selector(hanaViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        kuchiView.button.addTarget(self, action: #selector(kuchiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mimiLeftView.button.addTarget(self, action: #selector(mimiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
        mimiRightView.button.addTarget(self, action: #selector(mimiViewClicked(sender:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func kaoViewClicked(sender: UIButton) {
        print("kaoViewClicked")
        touchSound()
        animOff()
        kaoView.animOn()
        touchNameLabel.setLabel(name: kaoView.name)
    }
    
    @objc func kamiViewClicked(sender: UIButton) {
        print("kamiViewClicked")
        touchSound()
        animOff()
        kamiView.animOn()
        touchNameLabel.setLabel(name: kamiView.name)
    }
    
    @objc func mayugeViewClicked(sender: UIButton) {
        print("mayugeViewClicked")
        touchSound()
        animOff()
        mayugeLeftView.animOn()
        mayugeRightView.animOn()
        touchNameLabel.setLabel(name: mayugeLeftView.name)
    }
    
    @objc func meViewClicked(sender: UIButton) {
        print("meViewClicked")
        touchSound()
        animOff()
        meLeftView.animOn()
        meRightView.animOn()
        touchNameLabel.setLabel(name: meLeftView.name)
    }
    
    @objc func hanaViewClicked(sender: UIButton) {
        print("hanaViewClicked")
        touchSound()
        animOff()
        hanaView.animOn()
        touchNameLabel.setLabel(name: hanaView.name)
    }
    
    @objc func mimiViewClicked(sender: UIButton) {
        print("mimiViewClicked")
        touchSound()
        animOff()
        mimiLeftView.animOn()
        mimiRightView.animOn()
        touchNameLabel.setLabel(name: mimiLeftView.name)
    }
    
    @objc func kuchiViewClicked(sender: UIButton) {
        print("kuchiViewClicked")
        touchSound()
        animOff()
        kuchiView.animOn()
        touchNameLabel.setLabel(name: kuchiView.name)
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
    
    func playMusic() {
        let soundFilePath : String = Bundle.main.path(forResource: "BGM_play", ofType: "mp3")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }
        catch{
        }
        //numberOfLoopsに-1を指定すると無限ループする。
        audioPlayer.numberOfLoops = -1
        audioPlayer.volume = 0.5
        audioPlayer.play()
    }

    func touchSound() {
        let soundFilePath : String = Bundle.main.path(forResource: "Touch", ofType: "mp3")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }
        catch{
        }
        soundPlayer.currentTime = 0
        soundPlayer.play()
    }

}
