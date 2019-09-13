//
//  TableViewCell.swift
//  ImageGram
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCell: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let fruitModel = FruitsModel()
    let carModel = CarsModel()
    let planetModel = PlanetsModel()
    let jungleModel = JungleModel()
    let fishModel = FishModel()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellWithReuseIdentifier: "reuseCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        planetModel.getData {
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                    self.jungleModel.getData {
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                    self.fishModel.getData {
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                    self.carModel.getData {
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
            self.fruitModel.getData {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
    }
    
}
}
extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension TableViewCell: UICollectionViewDelegate {
    
}

