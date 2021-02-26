//
//  AddPetViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class AddPetViewController: UIViewController{
    static let identifier = "AddPetViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petNameText: UITextField!
    @IBOutlet weak var petMedicalIdText: UITextField!
    @IBOutlet weak var petWidth: UITextField!
    @IBOutlet weak var petTypePicker: UIPickerView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var addNewPetButton: UIButton!
    
    let petTypes = [String](arrayLiteral: "another","cat","dog","mouse","monkey")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.petTypePicker.dataSource = self
        self.petTypePicker.delegate = self
        
        petNameText.layer.cornerRadius = petNameText.frame.height/2
        petMedicalIdText.layer.cornerRadius = petMedicalIdText.frame.height/10
        petWidth.layer.cornerRadius = petWidth.frame.height/10
        
    }

    @IBAction func addNewPet(_ sender: Any) {
        
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
          // Dispose of any resources that can be recreated.
      }
    
}

extension AddPetViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return petTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return petTypes[row]
    }
}
