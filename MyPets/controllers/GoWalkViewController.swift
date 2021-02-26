//
//  GoWalkViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 27.02.2021.
//

import UIKit

class GoWalkViewController: UIViewController {
    static let identifier = "GoWalkViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var stopWatchTime: UILabel!
    @IBOutlet weak var startTimerButton: UIButton!
    @IBOutlet weak var stopTimerButton: UIButton!
    @IBOutlet weak var resetTimerButton: UIButton!
    
    var isTimeRunning: Bool?
    var timer = Timer()
    var stopWatchCounter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    func configuration() {
        stopWatchTime.text = "00:00:00.0"
        stopWatchTime.text = ""
        
        startTimerButton.layer.cornerRadius = startTimerButton.frame.height/2
        stopTimerButton.layer.cornerRadius = stopTimerButton.frame.height/2
        resetTimerButton.layer.cornerRadius = resetTimerButton.frame.height/2
    }
    
    @IBAction func startDidTap(_ sender: Any) {
        
        if !(isTimeRunning ?? false) {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        }
        isTimeRunning = true
        startTimerButton.isEnabled = false
        resetTimerButton.isEnabled = true
        stopTimerButton.isEnabled = true
        
        startTimerButton.alpha = 0.5
        resetTimerButton.alpha = 1.0
        stopTimerButton.alpha = 1.0
    }
    
    @IBAction func stopDidTap(_ sender: Any) {
        timer.invalidate()
        isTimeRunning = false
        
        startTimerButton.isEnabled = true
        resetTimerButton.isEnabled = true
        stopTimerButton.isEnabled = false
        
        startTimerButton.alpha = 1.0
        resetTimerButton.alpha = 1.0
        stopTimerButton.alpha = 0.5
    }
    
    @IBAction func resetDidTap(_ sender: Any) {
        timer.invalidate()
        isTimeRunning = false
        stopWatchCounter = 0.0
        stopWatchTime.text = "00:00:00.0"
        
        startTimerButton.isEnabled = true
        resetTimerButton.isEnabled = false
        stopTimerButton.isEnabled = false
        
        startTimerButton.alpha = 1.0
        resetTimerButton.alpha = 0.5
        stopTimerButton.alpha = 0.5
    }
    
    @objc func runTimer(){
        stopWatchCounter += 0.1
        
        let floorCounter = Int(floor(stopWatchCounter))
        let hour = floorCounter / 3600
        if hour > 24 {
            stopWatchCounter = 0.0
            isTimeRunning = false
        }
        let minute = (floorCounter % 3600) / 60
        var minuteText = "\(minute)"
        if minute < 10{
            minuteText = "0\(minute)"
        }
        let second = (floorCounter % 3600) % 60
        var secondText = "\(second)"
        if second < 10{
            secondText = "0\(second)"
        }
        let decisecond = String(format: "%.1f", stopWatchCounter).components(separatedBy: ".").last!
        
        stopWatchTime.text = "\(hour):\(minuteText):\(secondText).\(decisecond)"
    }
}
