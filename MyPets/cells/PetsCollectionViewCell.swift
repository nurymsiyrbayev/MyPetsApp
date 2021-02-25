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
    
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var quickEditButton: UIButton!

    @IBAction func quickEditPet(){
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item: Pet) {
        self.layer.cornerRadius = self.frame.size.width / 5
        petImageView.image = item.image
        petImageView.layer.cornerRadius = petImageView.frame.height/2
        petImageView.clipsToBounds = true
                
    }
}
