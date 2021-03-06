//
//  MyAlbumsCollectionViewCell.swift
//  HW13
//
//  Created by Ольга on 13.12.2021.
//

import UIKit

class MyAlbumsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    static let identifier = "MyAlbumsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyAlbumsCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: Model) {
        self.imageView.image = UIImage(named: model.imageName)
        self.imageView.layer.cornerRadius = 5
        self.imageView.contentMode = .scaleAspectFill
        self.textLabel.text = model.text
        self.numberLabel.text = model.number
    }
}
