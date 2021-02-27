//
//  PetNoteTableViewCell.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 27.02.2021.
//

import UIKit

class PetNoteTableViewCell: UITableViewCell {
    static let identifier = String(describing: PetNoteTableViewCell.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var noteTextLabel: UILabel!
    
    var item: Note?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuration() {
        self.backgroundColor = UIColor(red: 215.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        noteTextLabel.text = item?.text
        noteTextLabel.isHidden = false
    }
}
