//
//  APIstructCalls.swift
//  APIcrawl
//
//  Created by MCS on 8/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct JasonAttributes: Codable {
    let ability: URL
    let berry: URL
    let berryFirmness: URL
    let berryFlavor: URL
    let characteristic: URL
    let contestEffect: URL
    let contestType: URL
    let eggGroup: URL
    let encounterCondition: URL
    let encounterConditionValue: URL
    let encounterMethod: URL
    let evolutionChain: URL
    let evolutionTrigger: URL
    let gender: URL
    let generation: URL
    let growthRate: URL
    let item: URL
    let itemAttribute: URL
    let itemCategory: URL
    let itemFlingEffect: URL
    let itempocket: URL
    let language: URL
    let location: URL
    let locationArea: URL
    let machine: URL
    let move: URL
    let moveAilment: URL
    let moveBattleStyle: URL
    let moveCategory: URL
    let moveDamageClass: URL
    let moveLearnMethod: URL
    let moveTarget: URL
    let nature: URL
    let palParkArea: URL
    let pokeathlonStat: URL
    let pokedex: URL
    let pokemon: URL
    let pokemonColor: URL
    let pokemonForm: URL
    let pokemonHabitat: URL
    let pokemonShape: URL
    let pokemonSpecies: URL
    let region: URL
    let stat: URL
    let uperContestEffect: URL
    let type: URL
    let version: URL
    let versionGroup: URL

    enum CodingKeys: String, CodingKey {
        case ability
        case berry
        case berryFirmness = "berry-firmness"
        case berryFlavor = "berry-flavor"
        case characteristic
        case contestEffect = "contest-effect"
        case contestType = "contest-type"
        case eggGroup = "egg-group"
        case encounterCondition = "encounter-condition"
        case encounterConditionValue = "encounter- condition"
        case encounterMethod = "encounter-method"
        case evolutionChain = "envolution-chain"
        case evolutionTrigger = "evolution-trigger"
        case gender
        case generation
        case growthRate = "growth-rate"
        case item
        case itemAttribute = "item-attribute"
        case itemCategory = "item-category"
        case itemFlingEffect = "item-fling-effect"
        case itempocket = "item-pocket"
        case language
        case location
        case locationArea = "location-area"
        case machine
        case move
        case moveAilment = "move-ailment"
        case moveBattleStyle = "move-battle-style"
        case moveCategory = "move-category"
        case moveDamageClass = "move-damage-class"
        case moveLearnMethod = "move-learn-method"
        case moveTarget = "move-target"
        case nature
        case palParkArea = "pal-park-area"
        case pokeathlonStat = "pokeathlon-stat"
        case pokedex
        case pokemon
        case pokemonColor = "pokemon-color"
        case pokemonForm = "pokemon-form"
        case pokemonHabitat = "pokemon-habbit"
        case pokemonShape = "pokemon-shape"
        case pokemonSpecies = "pokemon-species"
        case region
        case stat
        case uperContestEffect = "uper-contest-effect"
        case type
        case version
        case versionGroup = "version-group"
        
    }
    
}
