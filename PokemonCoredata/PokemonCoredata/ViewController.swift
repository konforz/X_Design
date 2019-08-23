//
//  ViewController.swift
//  PokemonCoredata
//
//  Created by MCS on 8/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var PokemonTableView: UITableView!
    var pokemonArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PokemonTableView.dataSource = self
        PokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokecell")
        let randomPokemonNumber = Int.random(in: 1...807)
        guard let pokeURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(randomPokemonNumber)") else {
            return }
        URLSession.shared.dataTask(with: pokeURL) { (data,_,_) in
            guard let data = data,
                let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {return}
            self.pokemonArray.append(pokemon)
            do {
                try CoreDataManager.shared.context.save()
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.pokemonArray = CoreDataManager.shared.getAllPokemon()
                self.PokemonTableView.reloadData()
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "pokecell")
        cell.textLabel?.text = pokemonArray[indexPath.row].name
        return cell
    }
}
