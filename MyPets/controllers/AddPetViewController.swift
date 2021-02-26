//
//  AddPetViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class AddPetViewController: UIViewController, UITextFieldDelegate{
    static let identifier = "AddPetViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petNameText: UITextField!
    @IBOutlet weak var petMedicalIdText: UITextField!
    @IBOutlet weak var petWeight: UITextField!
    @IBOutlet weak var petTypePicker: UIPickerView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var addNewPetButton: UIButton!
    
    weak var delegate: AddPetViewControllerDelegate?
    var selectedValue: String = ""
    let petTypes = [String](arrayLiteral: "anotherAnimal","cat","dog","mouse","monkey")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        // Do any additional setup after loading the view.
    }
    
    func configuration() {
        petNameText.delegate = self
        petMedicalIdText.delegate = self
        petWeight.delegate = self
        petTypePicker.delegate = self
        petTypePicker.dataSource = self
        
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        
        birthDatePicker.maximumDate = Date()
        birthDatePicker.setDate(Date(), animated:  true)
        petNameText.layer.cornerRadius = petNameText.frame.height/2
        petMedicalIdText.layer.cornerRadius = petMedicalIdText.frame.height/10
        petWeight.layer.cornerRadius = petWeight.frame.height/10
        
    }

    @IBAction func addNewPet(_ sender: Any) {
        if let name = petNameText.text,
           let medicalId = petMedicalIdText.text,
           let weigth = Double(petWeight.text ?? "0.0" ),
           !name.isEmpty,
           !medicalId.isEmpty,
           weigth>0 {
            
            let pet = Pet(name: name, mecicalId: medicalId, weigth: weigth, birthDate: birthDatePicker.date, image: UIImage(named: selectedValue), note: nil)
            
            delegate?.addItem(pet)
            self.navigationController?.popViewController(animated: true)
            
        }else {
            print("Add Somthing")
        }
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
   {
        self.selectedValue = petTypes[row]
        
    }
}
