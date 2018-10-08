//
//  ViewController.swift
//  NFCDemo
//
//  Created by shenyi on 2018/9/21.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit
import CoreNFC

class ViewController: UIViewController {
    //MARK:Properties
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    private var nfcSession: NFCNDEFReaderSession!
    private var nfcMessages: [[NFCNDEFMessage]] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.nfcSession = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: true)
        self.nfcSession.alertMessage = "将要读取NFC数据"
        
        if NFCNDEFReaderSession.readingAvailable {
            print("该设备支持NFC读取")
        }
        else {
            print("该设备不支持NFC读取")
        }
    }

    @IBAction func startScan(_ sender: Any) {
        print("start scan")
        self.nfcSession.begin()
  
    }
}

extension ViewController : NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("error reading NFC: \(error.localizedDescription)")
        self.nfcSession.invalidate()
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("new NFC tag detected: ")
        
        for message in messages {
            for record in message.records {
                print("Type name format: \(record.typeNameFormat)")
                print("Payload: \(record.payload)")
                print("Type: \(record.type)")
                print("Identifier: \(record.identifier)")
            }
        }
        
        self.nfcMessages.append(messages)
    }
}

