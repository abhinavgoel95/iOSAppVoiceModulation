//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Abhinav Goel on 19/06/16.
//  Copyright © 2016 Abhinav Goel. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var recordedAudioURL : NSURL!
    var audioFile: AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int{case Slow = 0, Fast, Chimpmunk, Vader, Echo, Reverb }
    
    @IBAction func playSoundForButton(sender: UIButton)
    {
        print("play")
        switch(ButtonType(rawValue: sender.tag)!)
        {
            case .Slow:
                playSound(rate : 0.5)
            case .Fast:
                playSound(rate : 1.5)
            case .Chimpmunk:
                playSound(pitch : 1000)
            case .Vader:
                playSound(pitch : -1000)
            case .Echo:
                playSound(echo : true)
            case .Reverb:
                playSound(reverb : true)
        }
        configureUI(.Playing)
    }
    @IBAction func stopButtonPressed(sender: AnyObject)
    {
        print("stop")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PSVC loaded")
        setupAudio()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
