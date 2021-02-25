//
//  AddPetViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class AddPetViewController: UIViewController {
    static let identifier = "AddPetViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petNameText: UITextField!
    @IBOutlet weak var petMedicalIdText: UITextField!
    @IBOutlet weak var petWidth: UITextField!
    @IBOutlet weak var petTypePicker: UIPickerView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var addNewPetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func addNewPet(_ sender: Any) {
        
    }
    
    @IBAction func addPetImage(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
