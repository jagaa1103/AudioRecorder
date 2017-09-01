//
//  ViewController.swift
//  AudioRecorder
//
//  Created by Enkhjargal Gansukh on 01/09/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecordingService.instance.requestPermission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func recordBtnClicked(_ sender: Any) {
        if(RecordingService.instance.recordingState == true){
            RecordingService.instance.stopRecord()
            self.statusLabel.text = "Start your record"
            recordBtn.setTitle("Record", for: .normal)
        }else{
            RecordingService.instance.startRecord()
            statusLabel.text = "Recording..."
            recordBtn.setTitle("Stop", for: .normal)
        }
    }
    
}

