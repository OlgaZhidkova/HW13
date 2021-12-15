//
//  CommonAlbumsTableViewCell.swift
//  HW13
//
//  Created by Ольга on 15.12.2021.
//

import UIKit

class CommonAlbumsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CommonAlbumsTableViewCell"
    
    private let collectionInsets = UIEdgeInsets(
      top: 20,
      left: 20,
      bottom: 20,
      right: 20)
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var models = [Model]()
    
    static func nib() -> UINib {
        return UINib(nibName: "CommonAlbumsTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(buttonLabel)
        headerLabel.text = "Общие альбомы"
        buttonLabel.text = "См. все"
        buttonLabel.textColor = .systemBlue
        
        collectionView.register(CommonAlbumsCollectionViewCell.nib(), forCellWithReuseIdentifier: CommonAlbumsCollectionViewCell.identifier)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonAlbumsCollectionViewCell.identifier, for: indexPath) as! CommonAlbumsCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
      return collectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return collectionInsets.left
    }
}
