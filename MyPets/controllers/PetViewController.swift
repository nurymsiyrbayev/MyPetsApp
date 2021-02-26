//
//  PetViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class PetViewController: UIViewController {
    
    static let identifier = "PetViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petWeight: UILabel!
    @IBOutlet weak var petMedicalIdLabel: UILabel!
    
    @IBOutlet weak var stopWatchTime: UILabel!
    @IBOutlet weak var startTimerButton: UIButton!
    @IBOutlet weak var stopTimerButton: UIButton!
    @IBOutlet weak var resetTimerButton: UIButton!
    
    var item: Pet?
    var isTimeRunning: Bool?
    var timer = Timer()
    var stopWatchCounter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
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
    
    func configuration() {
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        stopWatchTime.text = ""
        petNameLabel.text = self.item?.name
        petWeight.text = "\(self.item?.weigth ?? 0.0)"
        petImageView.image = self.item?.image
        petMedicalIdLabel.text = self.item?.mecicalId
        stopWatchTime.text = "00:00:00.0"
        
        petImageView.sizeToFit()
        petImageView.layer.cornerRadius = petImageView.frame.height/5
        
        startTimerButton.layer.cornerRadius = startTimerButton.frame.height/2
        stopTimerButton.layer.cornerRadius = stopTimerButton.frame.height/2
        resetTimerButton.layer.cornerRadius = resetTimerButton.frame.height/2
        
        
        
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
