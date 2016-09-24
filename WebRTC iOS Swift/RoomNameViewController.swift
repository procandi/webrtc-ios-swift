//
//  RoomNameViewController.swift
//  WebRTC iOS Swift
//
//  Created by Sushil Dahal on 2/8/16.
//  Copyright © 2016 Sushil Dahal. All rights reserved.
//

import UIKit
import SocketIO

class RoomNameViewController: UIViewController {
    @IBOutlet weak var roomName: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func btnConnect(_ sender: UIButton) {
        
        let socket = SocketIOClient(socketURL: URL(string: "http://192.168.0.100:8000")!, config: [.log(true), .forcePolling(true)])
        
        socket.on("connect") {data, ack in
            print("socket connected")
            self.lblResult.text="socket connected";
        }
        
        
        print("socket connecting")
        self.lblResult.text="socket connecting";
        socket.connect()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectButton(_ sender: UIButton) {
        if let roomNameValue: String = roomName.text!{
            if !roomNameValue.isEmpty{
                self.performSegue(withIdentifier: "connectToRoom", sender: roomNameValue)
            }else{
                showAlertWithMessage("Room name cannot be left blank")
            }
        }else{
            showAlertWithMessage("Enter the room name")
        }
    }
    
    func showAlertWithMessage(_ message: String){
        let alertView: UIAlertController = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertView.addAction(alertAction)
        self.present(alertView, animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "connectToRoom"){
            let webRTCVC: WebRTCViewController = segue.destination as! WebRTCViewController
            let data: String = sender as! String
            webRTCVC.roomName = data
        }
    }

}
