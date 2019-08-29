//
//  ViewController.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  private let viewModel = FriendsViewModel()

  @IBOutlet weak var episodeTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.episodeTableView.dataSource = self
    self.episodeTableView.delegate = self
//    self.episodeTableView.register(UITableViewCell.self,
//                                   forCellReuseIdentifier: "cell")
//    
    self.episodeTableView.register(UINib(nibName: "myTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    //self.episodeTableView.register(myTableViewCell.self, forCellReuseIdentifier: "Cell")
    self.viewModel.getData {
      DispatchQueue.main.async {
        self.episodeTableView.reloadData()
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.numberOfEpisodes()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//  let mycell = myTableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! myTableViewCell
    let episode = self.viewModel.episode(for: indexPath.row)
    cell.titleLabel?.text = episode.name
    cell.subtextLabel?.text = episode.airDate
    let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string:episode.image)! as URL) as Data)
    cell.imageViewcell.image = cellImage
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let episode = self.viewModel.episode(for: indexPath.row)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
    detailVC.episode = episode
    self.navigationController?.pushViewController(detailVC, animated: true)
    self.episodeTableView.deselectRow(at: indexPath, animated: true)
  }
}
