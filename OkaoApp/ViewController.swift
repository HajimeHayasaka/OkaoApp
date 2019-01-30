//
//  ViewController.swift
//  OkaoApp
//
//  Created by 早坂甫 on 2019/01/27.
//  Copyright © 2019年 早坂甫. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var titleView: TitleView!
    var startButton: StartButtonView!
    var audioPlayer : AVAudioPlayer!
    var soundPlayer : AVAudioPlayer!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        playMusic()
    }
    
    @objc func startButtonClicked(sender: UIButton) {
        print("startButtonClicked")
        startSound()
        audioPlayer = nil // delegateで処理する方法もある。
        let secondVC: PlayViewController = PlayViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func playMusic() {
        let soundFilePath : String = Bundle.main.path(forResource: "BGM_op", ofType: "mp3")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }
        catch{
        }
        //numberOfLoopsに-1を指定すると無限ループする。
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
    }
    
    func startSound() {
        let soundFilePath : String = Bundle.main.path(forResource: "Start", ofType: "mp3")!
        let fileURL : URL = URL(fileURLWithPath: soundFilePath)
        
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: fileURL)
        }
        catch{
        }
        soundPlayer.currentTime = 0
        soundPlayer.volume = 0.5
        soundPlayer.play()
    }    
}

