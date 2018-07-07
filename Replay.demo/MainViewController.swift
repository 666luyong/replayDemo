//
//  MainViewController.swift
//  Replay.demo
//
//  Created by mediawork on 2018/6/27.
//  Copyright © 2018年 bbb. All rights reserved.
//

import UIKit
import AudioKit
import AudioKitUI
import Foundation
import SnapKit
class MainViewController: UIViewController {

    
    var micMixer :AKMixer!
    var recorder: AKNodeRecorder!
    var player : AKPlayer!
    var tape : AKAudioFile!
    var micBooster : AKBooster!
    var mainMixer : AKMixer!
    
    let mic = AKMicrophone()
    
    enum State {
        case readyToRecord
        case recording
        case readyToPlay
        case playing
    }
    
    var state = State.readyToRecord
    
    var polt : AKNodeOutputPlot?
    var infoLabel :UILabel!
    var resetButton : UIButton!
    var mainButton : UIButton!
    var loopButton : UIButton!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        AKAudioFile.cleanTempDirectory()
        
        AKSettings.bufferLength = .medium
        
        do{
            try AKSettings.setSession(category: .playAndRecord, with: .allowBluetooth)
        } catch{
            
        }
        AKSettings.defaultToSpeaker = true
        
        //Patching
        micMixer = AKMixer(mic)
        micBooster = AKBooster(micMixer)
        
        //监听时设置音量
        micBooster.gain = 0
        recorder = try? AKNodeRecorder(node: micMixer)
        
        if let file = recorder.audioFile {
            player = AKPlayer(audioFile: file)
        }
        player.isLooping = true
        player.completionHandler = playingEnd
        
        mainMixer = AKMixer(micBooster)
        
        AudioKit.output = mainMixer
        
        do {
            try AudioKit.start()
        } catch  {
            
        }
    }
    
    func playingEnd()  {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    private func setupUI(){
        
    }
 

}
