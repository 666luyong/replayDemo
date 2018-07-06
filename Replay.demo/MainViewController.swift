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
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
 

}
