//
//  DetailViewController.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    
  var episode: Episode!
  
    @IBOutlet weak var fullImageViewCell: UIImageView!

    
    @IBOutlet weak var episodeInformationLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let cell = try! UIImage(data: NSData(contentsOf: NSURL(string:episode.image)! as URL) as Data)
//
//    fullImageViewCell.contentMode = UIImageView.ContentMode.scaleAspectFit
    fullImageViewCell.contentMode = UIImageView.ContentMode.scaleAspectFill

    fullImageViewCell.image = cell
    
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "EEEE, MMM d, yyyy, h:mm a, z"
    
    
    let secondDateFormatterGet = DateFormatter()
    secondDateFormatterGet.dateFormat = "yyyy-MM-dd"
    let secondDateFormatterPrint = DateFormatter()
    secondDateFormatterPrint.dateFormat = "MMMM d, yyyy"
    
    guard let airStamp = dateFormatterGet.date(from: self.episode.airStamp ) else {return}
    let newAirStamp = (dateFormatterPrint.string(from: airStamp))
    
    guard let airDate = secondDateFormatterGet.date(from: self.episode.airDate ) else {return}
    let newAirDate = (secondDateFormatterPrint.string(from: airDate))
    
    
    let episodeInformation = "Name: \(self.episode.name)\n\nAir Date: \(newAirDate)\n\nAir Stamp: \(newAirStamp)\n\nRuntime: \(self.episode.runtime) minutes\n\nSummary: \n\n\(self.episode.summary)"
    
    self.episodeInformationLabel.text = episodeInformation
    let updateString = episodeInformation.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    self.episodeInformationLabel.text = updateString
  }
}
