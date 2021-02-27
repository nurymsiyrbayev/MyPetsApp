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
    var mecicalId: String?
    var weigth: Double?
    let birthDate: Date?
    var image: UIImage?
    var note: [Note]
    var goWalkHistory : [WalkThePet?]
}

struct Note{
    var text: String?
}

struct WalkThePet {
    let timeCount: Double?
    let walkDate: Date?
}
