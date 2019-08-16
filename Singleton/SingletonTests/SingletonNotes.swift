//
//  SingletonNotes.swift
//  SingletonTests
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
//        let group = DispatchGroup()
//        var pokemonArray: [Pokemon] = []
//        for _ in 1...6 {
//            group.enter()
//        getRandomPokemon {(pokemon) in
//            defer {group.leave() }
//            guard let pokemon = pokemon else {
//
//                return
//            pokemonArray.append(pokemon)
//            }
//            }
//
//            DispatchQueue.main.async {
//                self.pokemonNameLabel.text = pokemon.name
//        }
//        }
//            group.notify(queue: .main) {
//
//                self.pokemonNameLabel.text = pokemonArray.reduce("", {$0 + $1.name + "/"})
//                self.pokemonNameLabel.text = String(pokemonNameString.droplast(1))}
// Do any additional setup after loading the view.
//      let theSingleton = MySingleton.shared




//    URLSession.shared.dataTask(with: URL(string: "https://pokeapi.co/api/v2/pokemon/34")!) {
//                (data, _, _) in
//            guard let data = data else {return}
//            let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
//            DispatchQueue.global().async {
//                for number in 0...100000 {
//                    print(number)
//                }
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//
//            self.pokemonNameLabel.text = pokemon?.name
//

//        init(json:[String:Any]) throws {
//            guard let Answer = json["answer"] as? String else {throw ErrorSerialization.missing("missing answer")}
//            guard let Question = json["question"] as? String else {throw ErrorSerialization.missing("missing question")}
//            guard let Value = json["value"] as? Int else { throw ErrorSerialization.missing("missing value")}
//
//            self.Answer = Answer
//            self.Question = Question
//            self.Value = Value
//
//        }
//
//        }.resume()

