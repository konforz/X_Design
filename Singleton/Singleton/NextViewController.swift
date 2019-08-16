//
//  NextViewController.swift
//  Singleton
//
//  Created by MCS on 8/15/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit


class NextViewController: UIViewController {
    
    private var triviaObject: TriviaObject?
    
    @IBOutlet weak var newLabel: UILabel!
    
    @IBOutlet weak var clue: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var airDate: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    
    var updateValue: Int?
    var updateCategory: String?
    var updateAnswer: String?
    var updateQuestion: String?
    var updateAirDate: String?
    var updateCreationDate: String?
    var updateTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let getDate = DateFormatter()
            getDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let getDateDisplay = DateFormatter()
            getDateDisplay.dateFormat = "MM-dd-yyyy"

        guard let airDateDisplay = getDate.date(from: updateAirDate ?? "") else {return}
        let newAirDate = (getDateDisplay.string(from: airDateDisplay))

        guard let creationDateDisplay = getDate.date(from: updateCreationDate ?? "") else {return}
        let newCreationDate = (getDateDisplay.string(from: creationDateDisplay))
        
        
        
        clue.text = "Question \(updateQuestion ?? "")"
        answer.text = "Answer: \(updateAnswer ?? "")"
        value.text = "Value: \(updateValue ?? 0 )"
        category.text = "Category: \(updateCategory ?? "")"
        airDate.text = "AirDate: \(newAirDate)"
        creationDate.text = "CreationDate: \(newCreationDate)"
        
        // in the viewDidLoad of that VC you can call some sort of a setUp func
        // last step: use the navigation controller to push the new VC
        
//        if let trivia = triviaObject {
//            setUpViewController(with: trivia)
//        }
    }
    
    private func setUpViewController(with triviaObject: TriviaObject) {
        // set all the outlets
        clue.text = triviaObject.question
        answer.text = triviaObject.answer
        value.text = triviaObject.question
        category.text = triviaObject.question
        airDate.text = triviaObject.question
        creationDate.text = triviaObject.question

    }
}

