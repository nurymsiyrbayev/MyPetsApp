//
//  GoWalkTableViewCell.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 27.02.2021.
//

import UIKit

class GoWalkTableViewCell: UITableViewCell {
    static let identifier = String(describing: GoWalkTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var walkTime: UILabel!
    @IBOutlet weak var walkDate: UILabel!
    
    var item: WalkThePet?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configuration() {
        self.contentView.backgroundColor = UIColor(red: 215.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        walkTime.text = "Walk Time: " + convertTimeCountToString(item?.timeCount ?? 0)
        walkDate.text = convertDateToString(item?.walkDate ?? Date())
    }
    
    func convertDateToString(_ date:Date) -> String {
            let converter = DateFormatter()
            converter.dateFormat = "d MMM y"
            return converter.string(from: date)
        }
    
    func convertTimeCountToString(_ timeCount: Double) -> String {
        if timeCount == 0 {
            return "00:00:00.0"
        }
        let floorCounter = Int(floor(timeCount))
        let hour = floorCounter / 3600
        
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
        let decisecond = String(format: "%.1f", timeCount).components(separatedBy: ".").last!
        
         
        return "\(hour):\(minuteText):\(secondText).\(decisecond)"
    }
    
}
