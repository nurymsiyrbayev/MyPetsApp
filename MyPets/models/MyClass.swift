//
//  MyClass.swift
//  MyPets
//
//  Created by ADMIN ODoYal on 27.02.2021.
//

import Foundation

class MyClass {
    static private(set) var characterArray: [Character] = []

    init() {
        let defaults = UserDefaults.standard

        MyClass.characterArray = defaults.array(forKey: "characterArray") as? [Character] ?? [Character]()
    }

    func saveDefaults() {
        let defaults = UserDefaults.standard

        defaults.set(MyClass.characterArray, forKey: "characterArray") // Error occurs here
    }

    func doStuff() {
        let character = Character("字")
        MyClass.characterArray.append(character)
    }
}
