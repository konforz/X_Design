import UIKit

struct Pokemon: Decodable {
    let baseExp: Int
    let height: Int
    let id: Int
    let isDefault: Bool
    let order: Int
    let weight: Int
    let name: String
    let abilities: [Ability]
    let locationAreaEncounters: URL
    let moves: [Moves]
    let species: Species
    let sprites: Sprites
    let stats: [Stats]
    let types: [Types]
    let Forms: [Forms]
    let GameIndices: [GameIndices]
    
    enum PokemonCodingKeys: String, CodingKey {
        case baseExp = "base_experience"
        case isDefault = "is_default"
        case LocationAreaEncounters = "location_area_encounters"
        case name
        case id
        case order
        case weight
        case abilities
        case moves
        case species
        case sprites
        case stats
        case types
        case GameIndices = "game_indices"
    }
struct Ability: Decodable {
    let name: String
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case Ability
        case isHidden = "is_hidden"
        case slot
}
        
    enum AbilityCodingKeys: String, CodingKey{
            case name
            

}
init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let abilityContainer = try container.nestedContainer(keyedBy: AbilityCodingKeys.self, forKey: .Ability)
    name = try abilityContainer.decode(String.self, forKey: .name)
    isHidden = try container.decode(Bool.self, forKey: .isHidden)
    slot = try container.decode(Int.self, forKey: .slot)

        }
        
}
struct Forms: Decodable {
    let name: String
    }
}
struct GameIndices: Decodable {
    let gameIndex: Int
    let name: String

    enum GameIndicesCodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    
    }
    enum GameIndicesnameCodingKeys: String, CodingKey {
        case name
    }
    
    
init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: GameIndicesCodingKeys.self)
    let GameIndicesContainer = try container.nestedContainer(keyedBy: GameIndicesnameCodingKeys.self, forKey: .version)
    name = try GameIndicesContainer.decode(String.self, forKey: .name)
    gameIndex = try container.decode(Int.self, forKey: .gameIndex)
}

}



struct Moves: Decodable {
        let name: String
        let versionGroupDetails: [VersionGroupDetails]

    enum MovesCodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"

    }
    struct Move: Decodable {
        let name: String
        
    }

    enum MoveCodingKeys: String, CodingKey {
        case name
        
    }


    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovesCodingKeys.self)
        let MoveContainer = try container.nestedContainer(keyedBy:MoveCodingKeys.self, forKey: .move)
        name = try MoveContainer.decode(String.self, forKey: .name)
        versionGroupDetails = try container.decode([VersionGroupDetails].self, forKey: .versionGroupDetails)
    }
}


    struct VersionGroupDetails: Decodable {
        let levelLearnedAt: Int
        let moveLearnMethodname: String
        let vGroup: [VersionGroup]

        enum CodingKeys: String, CodingKey {
            case levelLearnedAt = "level_learned_at"
            case moveLearnMethod = "move_learn_method"
            case versionGroup = "version_group"
        }
        enum MoveLearnMethodCodingKeys: String, CodingKey{
            case moveLearnMethodname = "name"

        }
        enum VersionGroupCodingKeys: String, CodingKey {
            case versionGroupname = "name"
        }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            levelLearnedAt = try container.decode(Int.self, forKey: .levelLearnedAt)
            let moveLearnedMethodContainer = try container.nestedContainer(keyedBy: MoveLearnMethodCodingKeys.self, forKey: .moveLearnMethod)
            moveLearnMethodname = try moveLearnedMethodContainer.decode(String.self, forKey: .moveLearnMethodname)
            let versionGroupContainer = try container.nestedContainer(keyedBy: VersionGroupCodingKeys.self, forKey: .versionGroup)
            versionGroup = try container.decode(String.self, forKey: .versionGroup)
            abilities = try container.decode(String.self, forKey: .abilities)
            baseExp = try container.decode(String.self, forKey: .baseExp)
            Forms = try container.decode(String.self, forKey: .Forms)
            height = try container.decode(String.self, forKey: .height)
            id = try container.decode(String.self, forKey: .id)
            isDefault = try container.decode(String.self, forKey: .isDefault)
            order = try container.decode(String.self, forKey: .order)
            weight = try container.decode(String.self, forKey: .weight)
            name = try container.decode(String.self, forKey: .name)
            locationAreaEncounters = try container.decode(String.self, forKey: .locationAreaEncounters)
            moves = try container.decode(String.self, forKey: .moves)
            species = try container.decode(String.self, forKey: .species)
            sprites = try container.decode(String.self, forKey: .sprites)
            types = try container.decode(String.self, forKey: .types)

        }
    }

    
struct Species: Decodable{
    let name: String
    }

struct Sprites: Decodable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let backFemale: String?
    let backShinyFemale: String?
    let frontFemale: String?
    let frontShinyfemale: String?
    
    enum SpritesCodingKeys: String, CodingKey {
        case Sprites = "sprites"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
        case frontFemale =  "front_female"
        case frontShinyfemale = "front_shiny_female"
        
    }
}
    
struct Stats: Decodable {
    let baseStat: Int
    let effort: Int
    let name: String
    

    enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
        case effort
    }
    
    enum StatsCodingKeys: String, CodingKey{
        case name
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let statsContainer = try container.nestedContainer(keyedBy: StatsCodingKeys.self, forKey: .stat)
        name = try statsContainer.decode(String.self, forKey: .name)
        effort = try container.decode(Int.self, forKey: .effort)
        baseStat = try container.decode(Int.self, forKey: .baseStat)
    }
}

struct Types: Decodable {
    let slot: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
    enum TypesCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let TypesContainer = try container.nestedContainer(keyedBy: TypesCodingKeys.self, forKey: .type)
        name = try TypesContainer.decode(String.self, forKey: .name)
        slot = try container.decode(Int.self, forKey: .slot)

    }
}

if let pokemonURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"),
    let pokemonData = try? Data(contentsOf: pokemonURL) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonData)
    print(pokemonURL)
    print(pokemonData)
} else{
    print("something went wrong")
    
}



