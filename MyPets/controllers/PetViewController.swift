//
//  PetViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

protocol PetNoteViewControllerDelegate:class {
    func saveNoteText(_ note: Note, _ index: Int)
}

protocol GoWalkViewControllerDelegate:class {
    func saveWalkThePet(_ walkThePet: [WalkThePet?])
}

class PetViewController: UIViewController {
    
    static let identifier = "PetViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var medicalIdText: UITextField!
    @IBOutlet weak var weigtText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petWeight: UILabel!
    @IBOutlet weak var petMedicalIdLabel: UILabel!
    @IBOutlet weak var GoWalkThePetButton: UIButton!
    @IBOutlet weak var petNoteTableView: UITableView!
    @IBOutlet weak var petViewSegmentController: UISegmentedControl!
    @IBOutlet weak var addNewNoteButton: UIButton!
    
    var item: Pet?
    var index: Int?
    weak var delegate: PetViewControllerDelegate?
    
    @IBAction func addNewNote(_ sender: Any) {
        item?.note.append(Note(text: "Some Text"))
        petNoteTableView.reloadData()
    }
    
    @IBAction func showWalkTimer(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: GoWalkViewController.identifier) as! GoWalkViewController
        vc.delegate = self
        vc.walkThePetHistory = item?.goWalkHistory as! [WalkThePet]
        self.navigationController?.show(vc, sender: sender)
    }
    @IBAction func swicthSegment(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            hidePetTableView()
        case 1:
            hidePetInformationView()
        default:
            break
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        saveButton.isHidden = true
        editButton.isHidden = false
        if let weight = Double(weigtText.text ?? "0.0"),
           let medicalId = medicalIdText.text,
           !medicalId.isEmpty,
           weight>0{
            print(weight)
            print(medicalId)
            item?.weigth = weight
            item?.mecicalId = medicalId
            guard let pet = item, item != nil,
                  let index = self.index, self.index != nil
            else {
                return
            }
            delegate?.savePetItem(pet, index)
            configuration()
        }
        
        
    }
    @IBAction func editAction(_ sender: Any) {
        saveButton.isHidden = false
        editButton.isHidden = true
        medicalIdText.text = petMedicalIdLabel.text
        weigtText.text = petWeight.text
        medicalIdText.isHidden = false
        weigtText.isHidden = false
        petMedicalIdLabel.isHidden = true
        petWeight.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petTableViewConfigure()
        configuration()
    }
    
    func petTableViewConfigure() {
        petNoteTableView.delegate = self
        petNoteTableView.dataSource = self
        petNoteTableView.register(PetNoteTableViewCell.nib, forCellReuseIdentifier: PetNoteTableViewCell.identifier)
    }
    
    func hidePetInformationView() {
        petNoteTableView.isHidden = false
        addNewNoteButton.isHidden = false
        petWeight.isHidden = true
        editButton.isHidden = true
        birthDateLabel.isHidden = true
        petMedicalIdLabel.isHidden = true
        GoWalkThePetButton.isHidden = true
    }
    
    func hidePetTableView() {
        petNoteTableView.isHidden = true
        addNewNoteButton.isHidden = true
        weigtText.isHidden = true
        medicalIdText.isHidden = true
        
        birthDateLabel.isHidden = false
        petWeight.isHidden = false
        editButton.isHidden = false
        petMedicalIdLabel.isHidden = false
        GoWalkThePetButton.isHidden = false
    }
    
    func configuration() {
        hidePetTableView()
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        petNoteTableView.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        addNewNoteButton.backgroundColor = .systemTeal
        editButton.backgroundColor = .systemTeal
        saveButton.isHidden = true
        
        petNameLabel.text = self.item?.name
        petWeight.text = "\(self.item?.weigth ?? 0.0)"
        petImageView.image = self.item?.image
        petMedicalIdLabel.text = self.item?.mecicalId
        birthDateLabel.text = convertDateToString(self.item?.birthDate ?? Date())
        
        petImageView.sizeToFit()
        petImageView.layer.cornerRadius = petImageView.frame.height/5
        GoWalkThePetButton.layer.cornerRadius = GoWalkThePetButton.frame.height/2
        addNewNoteButton.layer.cornerRadius = addNewNoteButton.frame.height/2
        editButton.layer.cornerRadius = addNewNoteButton.frame.height/2
    }
    
    func convertDateToString(_ date:Date) -> String {
            let converter = DateFormatter()
            converter.dateFormat = "d MMM y"
            return converter.string(from: date)
        }
    
    func removeNoteItem(_ index: Int) {
        if let itemIndex = self.index, self.item != nil, self.index != nil{
            
            self.item?.note.remove(at: index)
            guard let petItem = self.item else { return }
            delegate?.removeNoteItemFromPet(petItem, itemIndex)
        }
    }
}

extension PetViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item?.note.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = petNoteTableView.dequeueReusableCell(withIdentifier: PetNoteTableViewCell.identifier, for: indexPath) as! PetNoteTableViewCell
        cell.item = item?.note[indexPath.row]
        cell.configuration()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let vc = self.storyboard?.instantiateViewController(identifier: PetNoteViewController.identifier) as! PetNoteViewController
        vc.item = self.item?.note[indexPath.row]
        vc.delegate = self
        vc.index = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    
// Swiper for delete and change Current Item
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: (Bool) -> ()) in actionPerformed(true)
            self.removeNoteItem(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        delete.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

extension PetViewController: PetNoteViewControllerDelegate{
    func saveNoteText(_ note: Note, _ index: Int) {
        item?.note[index] = note
        petNoteTableView.reloadData()
    }
}

extension PetViewController: GoWalkViewControllerDelegate{
    func saveWalkThePet(_ walkThePet: [WalkThePet?]) {
        item?.goWalkHistory = walkThePet
    }
}
