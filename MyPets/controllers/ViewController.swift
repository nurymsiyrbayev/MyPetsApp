//
//  ViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    static let identifier = String(describing: ViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petsCollectionView: UICollectionView!
    
    @IBOutlet weak var addPetButton: UINavigationItem!
    
    let pets = [Pet](arrayLiteral:
    Pet(Name: "Nock", MecicalId: "0120302", weigth: 34.0, birthDate: Date(), image: nil),
    Pet(Name: "Nock", MecicalId: "0120302", weigth: 34.0, birthDate: Date(), image: nil))
        
    override func viewDidLoad() {
        super.viewDidLoad()
        shopCollectionConfigure()
    }
    
    func shopCollectionConfigure(){
        petsCollectionView.backgroundColor = .yellow
        petsCollectionView.delegate = self
        petsCollectionView.dataSource = self
        petsCollectionView.register(PetsCollectionViewCell.nib, forCellWithReuseIdentifier: PetsCollectionViewCell.identifier)
        }
    
    
    
    @IBAction func addPet(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: AddPetViewController.identifier) as! AddPetViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pets.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PetsCollectionViewCell.identifier, for: indexPath) as! PetsCollectionViewCell
        cell.configure(pets[indexPath.item])
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: PetViewController.identifier) as! PetViewController
            vc.item = self.pets[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    
    

}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSide = UIScreen.main.bounds.width/2 - 30
        return CGSize(width: cellSide, height: cellSide)
    }
}

