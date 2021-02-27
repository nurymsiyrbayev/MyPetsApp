//
//  ViewController.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//

import UIKit

protocol AddPetViewControllerDelegate:class {
    func addItem(_ item: Pet)
}

protocol PetViewControllerDelegate:class {
    func removeNoteItemFromPet(_ item: Pet,_ index: Int)
    func savePetItem(_ item: Pet, _ index: Int)
}

class ViewController: UIViewController {
    
    static let identifier = String(describing: ViewController.self)
    static let nib = UINib(nibName: identifier, bundle: nil)
    
    @IBOutlet weak var petsCollectionView: UICollectionView!
    
    @IBOutlet weak var addPetButton: UINavigationItem!
    
    var pets = [Pet]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        petsCollectionConfigure()
        pets.append(
            Pet(name: "Nock", mecicalId: "0120302", weigth: 34.0, birthDate: Date(), image: UIImage(named: "dog"), note: [Note](arrayLiteral: Note(text: "Do something"),Note(text: "Teach for aport")), goWalkHistory: [WalkThePet]())
        )
    }
    
    func configure() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.view.backgroundColor = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        petsCollectionView.backgroundColor  = UIColor(red: 231.0/255.0, green: 247.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    }
    
    func petsCollectionConfigure(){
        petsCollectionView.delegate = self
        petsCollectionView.dataSource = self
        petsCollectionView.register(PetsCollectionViewCell.nib, forCellWithReuseIdentifier: PetsCollectionViewCell.identifier)
        }
    
    
    
    @IBAction func addPet(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: AddPetViewController.identifier) as! AddPetViewController
        vc.delegate = self
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
        vc.delegate = self
        vc.index = indexPath.item
        vc.item = self.pets[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return configureContextMenu(indexPath.item)
    }
    
    func configureContextMenu(_ index: Int) -> UIContextMenuConfiguration {
        let context = UIContextMenuConfiguration(identifier: nil, previewProvider: nil){ (action) -> UIMenu? in
            
            let delete = UIAction(title: "Remove", image: UIImage(systemName: "trash"), identifier: nil, discoverabilityTitle: nil, attributes: .destructive, state: .off){_ in
                self.pets.remove(at: index)
                self.petsCollectionView.reloadData()
            }
            
//            let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil"), identifier: nil, discoverabilityTitle: nil, state: .off){_ in
//                self.petsCollectionView.reloadData()
//            }
            
            return UIMenu(title: "Options", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [delete])
        }
        
        return context
    }
    

}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSide = UIScreen.main.bounds.width/2
        return CGSize(width: cellSide, height: cellSide)
    }
}

extension ViewController: AddPetViewControllerDelegate{
    func addItem(_ item: Pet) {
        self.pets.append(item)
        self.petsCollectionView.reloadData()
    }
}

extension ViewController: PetViewControllerDelegate{
    func savePetItem(_ item: Pet, _ index: Int) {
        self.pets[index] = item
        print(item)
        print(index)
        petsCollectionView.reloadData()
    }
    
    func removeNoteItemFromPet(_ item: Pet,_ index: Int) {
        self.pets.insert(item, at: index)
    }
}
