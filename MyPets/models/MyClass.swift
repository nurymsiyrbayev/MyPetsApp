//
//  MyClass.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 27.02.2021.
//

import Foundation

class PetsSingleton {
    var pets = [Pet]()
    
    static var shared: PetsSingleton = {
            let instance = PetsSingleton()
            return instance
        }()
    
    private init() {}
    
    func addNewPet(_ item: Pet){
        pets.append(item)
    }
}

