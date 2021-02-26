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
    @IBOutlet weak var GoWalkThePetButton: UIButton!
    
    var item: Pet?
    
    @IBAction func showWalkTimer(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: GoWalkViewController.identifier) as! GoWalkViewController
        self.navigationController?.show(vc, sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    func configuration() {
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
       
        petNameLabel.text = self.item?.name
        petWeight.text = "\(self.item?.weigth ?? 0.0)"
        petImageView.image = self.item?.image
        petMedicalIdLabel.text = self.item?.mecicalId
        
        petImageView.sizeToFit()
        petImageView.layer.cornerRadius = petImageView.frame.height/5
        GoWalkThePetButton.layer.cornerRadius = GoWalkThePetButton.frame.height/2
    }
}
