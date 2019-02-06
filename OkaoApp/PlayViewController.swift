//
//  PlayViewController.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/26.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit
import AVFoundation

enum Tag: Int {
    case kao
    case kami
    case kamiAnim
    case mayuge
    case me
    case hana
    case kuchi
    case mimi
    case resetButton
}

class PlayViewController: UIViewController {
    
    var okaoView: OkaoView!
    var touchNameLabel: TouchNameView!
    var animResetButton: ButtonView!
    var audioPlayer : AVAudioPlayer!
    var soundPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色セット、ナビゲーションバー非表示
        self.view.backgroundColor = UIColor(named: "bgcolor")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // 各Viewの座標をセット
        let okaoViewCGRect = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
        let touchNameLabelCGRect = CGRect(x: 0.0, y: view.frame.height * 0.1, width: view.frame.width, height: 70)
        let animResetButtonCGrect = CGRect(x: view.frame.width * 0.3, y: view.frame.height * 0.85, width: view.frame.width * 0.4, height: view.frame.height * 0.1)
        
        // 顔を表示
        okaoView = OkaoView(frame: okaoViewCGRect)
        self.view.addSubview(okaoView)
        
        // タッチした箇所の名前を表示
        touchNameLabel = TouchNameView(frame: touchNameLabelCGRect)
        self.view.addSubview(touchNameLabel)
        
        // アニメーションストップボタン表示
        animResetButton = ButtonView(frame: animResetButtonCGrect, image: "animResetButton")
        self.view.addSubview(animResetButton)

        // ボタン押下実行処理
        buttonAddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playMusic()
    }
    
    // 各ボタンのaddTarget処理をまとめた関数
    func buttonAddTarget() {
        // KaoView
        okaoView.kaoView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.kaoView.button.tag = Tag.kao.rawValue
        
        // KamiView(Normal)
        okaoView.kamiView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.kamiView.button.tag = Tag.kami.rawValue
        
        // KamiView(Anim)
        okaoView.kamiView.animButton.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.kamiView.animButton.tag = Tag.kamiAnim.rawValue

        // MayugeView
        okaoView.mayugeLeftView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.mayugeLeftView.button.tag = Tag.mayuge.rawValue
        okaoView.mayugeRightView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.mayugeRightView.button.tag = Tag.mayuge.rawValue
        
        // MeView
        okaoView.meLeftView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.meLeftView.button.tag = Tag.me.rawValue
        okaoView.meRightView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.meRightView.button.tag = Tag.me.rawValue
        
        // HanaView
        okaoView.hanaView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.hanaView.button.tag = Tag.hana.rawValue
        
        // KuchiView
        okaoView.kuchiView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.kuchiView.button.tag = Tag.kuchi.rawValue
        
        // MimiView
        okaoView.mimiLeftView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.mimiLeftView.button.tag = Tag.mimi.rawValue
        okaoView.mimiRightView.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        okaoView.mimiRightView.button.tag = Tag.mimi.rawValue

        // animResetButton
        animResetButton.button.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        animResetButton.button.tag = Tag.resetButton.rawValue
    }
    
    @objc func buttonClicked(sender: UIButton) {
        touchSound()
        switch sender.tag {
        case Tag.kao.rawValue:
            print("kaoViewClicked")
            print(sender.tag)
            okaoView.kaoView.animOn()
            touchNameLabel.setLabel(name: okaoView.kaoView.name)
        case Tag.kami.rawValue:
            print("kamiViewClicked")
            print(sender.tag)
            okaoView.kamiView.animOn()
            touchNameLabel.setLabel(name: okaoView.kamiView.name)
        case Tag.kamiAnim.rawValue:
            print("kamiViewClicked")
            print(sender.tag)
            okaoView.kamiView.animOff2()
            okaoView.kamiView.animOn2()
            touchNameLabel.setLabel(name: okaoView.kamiView.animName)
            audioPlayer = nil
            playMusic2()
        case Tag.mayuge.rawValue:
            print("mayugeViewClicked")
            print(sender.tag)
            okaoView.mayugeLeftView.animOn()
            okaoView.mayugeRightView.animOn()
            touchNameLabel.setLabel(name: okaoView.mayugeLeftView.name)
        case Tag.me.rawValue:
            print("meViewClicked")
            print(sender.tag)
            okaoView.meLeftView.animOn()
            okaoView.meRightView.animOn()
            touchNameLabel.setLabel(name: okaoView.meLeftView.name)
        case Tag.hana.rawValue:
            print("hanaViewClicked")
            print(sender.tag)
            okaoView.hanaView.animOn()
            touchNameLabel.setLabel(name: okaoView.hanaView.name)
        case Tag.kuchi.rawValue:
            print("kuchiViewClicked")
            print(sender.tag)
            okaoView.kuchiView.animOn()
            touchNameLabel.setLabel(name: okaoView.kuchiView.name)
        case Tag.mimi.rawValue:
            print("mimiViewClicked")
            print(sender.tag)
            okaoView.mimiLeftView.animOn()
            okaoView.mimiRightView.animOn()
            touchNameLabel.setLabel(name: okaoView.mimiLeftView.name)
        case Tag.resetButton.rawValue:
            print("animResetButtonClicked")
            print(sender.tag)
            okaoView.animOff()
            touchNameLabel.setLabel(name: "")
            audioPlayer = nil
            playMusic()
        default:
            break
        }
    }
        
    func playMusic() {
        let soundFilePath : String = Bundle.main.path(forResource: "BGM_play1", ofType: "mp3")!
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
    
    func playMusic2() {
        let soundFilePath : String = Bundle.main.path(forResource: "BGM_play2", ofType: "mp3")!
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
