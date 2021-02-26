//
//  PetsCollectionViewCell.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class PetsCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: PetsCollectionViewCell.self)
        static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var quickEditButton: UIButton!

    @IBAction func quickEditPet(){
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: Pet) {
        self.contentView.backgroundColor = UIColor(red: 180/255.0, green: 216/255, blue: 238/255, alpha: 1.0)
        self.bringSubviewToFront(petNameLabel)
        self.bringSubviewToFront(quickEditButton)
        self.sendSubviewToBack(petImageView)
        self.backgroundColor = .systemGray6
        self.backgroundView?.largeContentImage = item.image
        self.layer.cornerRadius = self.frame.size.width / 5
        petImageView.image = item.image
        petImageView.sizeToFit()
        petImageView.layer.cornerRadius = petImageView.frame.height/2
        petNameLabel.text = item.name
        
        
    }
    
}
