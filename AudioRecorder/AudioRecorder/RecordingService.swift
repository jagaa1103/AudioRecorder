//
//  RecordingService.swift
//  AudioRecorder
//
//  Created by Enkhjargal Gansukh on 01/09/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import AVFoundation

class RecordingService: NSObject {
    static let instance = RecordingService()
    var recordingState = false
    var audioRecorder: AVAudioRecorder!
    
    override init() {
        super.init()
        print("init RecordingService")
    }
    
    func requestPermission(){
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        session.requestRecordPermission { (state: Bool) in
            if state {
                print("Microphone usage permission allowed")
            }else {
                print("Microphone usage permission failed")
            }
        }
    }
    
    func startRecord(){
        if(recordingState == false){
            recordingState = true
            print("Started recording...")
            let fileService = FileService()
            let filePath = fileService.getFilePath()
            try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
            audioRecorder.isMeteringEnabled = true
            audioRecorder.prepareToRecord()
            audioRecorder.record()
        }else{
            print("Already recording...")
        }
    }
    
    func stopRecord(){
        if(recordingState == true){
            recordingState = false
            audioRecorder.stop()
            let session = AVAudioSession.sharedInstance()
            try! session.setActive(false)
            print("Stopped recording...")
        }
    }
}
