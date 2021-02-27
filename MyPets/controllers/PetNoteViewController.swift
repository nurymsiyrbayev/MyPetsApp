//
//  PetNoteViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class PetNoteViewController: UIViewController, UITextViewDelegate {
    static let identifier = "PetNoteViewController"
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var textView: UITextView!
    
    weak var delegate: PetNoteViewControllerDelegate?
    
    var item: Note?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewConfigure()
        configuration()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveText()
    }
    
    func saveText() {
        if let noteText = textView.text,
           !noteText.isEmpty {
            delegate?.saveNoteText(Note(text: noteText), index ?? 0)
        }
    }
    
    func configuration() {
        textView.text = item?.text
        textView.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    func textViewConfigure() {
        textView.delegate = self
    }
}
