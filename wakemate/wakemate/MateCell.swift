//
//  MateCell.swift
//  wakemate
//
//  Created by BoMin on 2022/08/26.
//

import UIKit

class MateCell: UICollectionViewCell {
    static let identifier = "MateCell"
    
    let myMateSelectView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(myMateSelectView)
        
        NSLayoutConstraint.activate([
            self.myMateSelectView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.myMateSelectView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.myMateSelectView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.myMateSelectView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
        ])
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myMateSelectView.image = nil
    }
    
    func prepare(image: UIImage?) {
        self.myMateSelectView.image = image
    }
}

