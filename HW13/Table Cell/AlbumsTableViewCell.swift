//
//  AlbumsTableViewCell.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "AlbumsTableViewCell"
    
    private let sectionInsets = UIEdgeInsets(
      top: 10,
      left: 20,
      bottom: 10,
      right: 20)
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var models = [Model]()
    
    static func nib() -> UINib {
        return UINib(nibName: "AlbumsTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(buttonLabel)
        headerLabel.text = "Мои альбомы"
        buttonLabel.text = "См. все"
        buttonLabel.textColor = .systemBlue
        
        collectionView.register(MyAlbumsCollectionViewCell.nib(), forCellWithReuseIdentifier: MyAlbumsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
    // MARK: - Collection View
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyAlbumsCollectionViewCell.identifier, for: indexPath) as! MyAlbumsCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return sectionInsets.left
    }
}
