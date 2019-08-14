import UIKit

class Ability: Decodable {
    let name: String
    let isHidden: Bool

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
    }
    
    enum AbilityCodingKeys: String, CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let abilityContainer = try container.nestedContainer(keyedBy:
            AbilityCodingKeys.self, forKey: .ability)
         name = try abilityContainer.decode(String.self, forKey: .name)
        isHidden = try container.decode(Bool.self, forKey: .isHidden)
        
    }

    init?(jsonDictionary: [String: Any]){
        guard let jsonisHidden = jsonDictionary["is_hidden"] as? Bool,
        let jsonAbility = jsonDictionary["ability"] as? [String: Any],
            let jsonAbilityName = jsonAbility["name"] as? String
    else{
                return nil
        }
        
        isHidden = jsonisHidden
        name = jsonAbilityName
        
}
}
struct Pokemon: Decodable {
    let name: String
    let abilities: [Ability]
    
    init?(jsonDictionary: [String: Any]){
      guard  let jsonName = jsonDictionary["name"] as? String,
        let jsonAbilities = jsonDictionary["abilities"] as? [[String: Any]] else {
        return nil
        }
        let mappedAbilities = jsonAbilities.flatMap {Ability(jsonDictionary: $0)}
        name = jsonName
        abilities = mappedAbilities
    
}
}
if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let pokemonData = try?  Data(contentsOf: pokemonURL),
    let jsonObject = try? JSONSerialization.jsonObject(with: pokemonData, options: []) as? [String: Any]{
        let pokemon = Pokemon(jsonDictionary: jsonObject)
        print(pokemonURL)
        print(pokemonData)
        print(jsonObject)
        print(pokemon)
} else{
    print("something went wrong")

}


if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let pokemonData = try? Data(contentsOf: pokemonURL) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData)
print(pokemon)
} else {
print("something went wrong")
}

