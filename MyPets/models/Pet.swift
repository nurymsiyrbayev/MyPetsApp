//
//  Pet.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 25.02.2021.
//
import Foundation
import UIKit

struct Pet{
    let name: String?
    let mecicalId: String?
    var weigth: Double?
    let birthDate: Date?
    var image: UIImage?
    var note: [Note]?
}

struct Note{
    let text: String
}
