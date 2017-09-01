//
//  FileService.swift
//  AudioRecorder
//
//  Created by Enkhjargal Gansukh on 01/09/2017.
//  Copyright © 2017 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

class FileService {
    
    func getFilePath() -> URL? {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordInitialName = "recorded.wav"
        let pathArray = [dirPath, recordInitialName]
        return URL(string: pathArray.joined(separator: "/"))
    }
    
    func getFile(){
        
    }
    
    func getFileList(){
        
    }
    
    func saveFile(){
        
    }
    
}
