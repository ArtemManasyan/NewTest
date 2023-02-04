//
//  SecondCollectionViewCell.swift
//  TestTask
//
//  Created by Артем Манасян on 06.12.2022.
//

import UIKit

class HotSalesCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isPagingEnabled = true
//        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "hotSales")
        return collection
    }()
    static var requiredHeight: CGFloat = 150
    var models: [HotSalesCellModel]?
    
    func setModel(models: [HotSalesCellModel]) {
        collection.backgroundColor = #colorLiteral(red: 0.05063503236, green: 0.067364797, blue: 0.02175074443, alpha: 1)
        addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        self.models = models
    }
    
    override func layoutSubviews() {
        collection.pin.all()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "hotSales", for: indexPath) as! HotSalesCollectionViewCell
        let model = models![indexPath.row]
        cell.descriptionLabel.text = model.descriptionText
        cell.nameLabel.text = model.nameText
        cell.image.kf.setImage(with: URL(string: model.picture))
        cell.setModel()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 150)
    }
}

struct HotSalesCellModel {
    var nameText: String
    var descriptionText: String
    let picture: String
    var buyNowButtonAction: (() -> Void)?
    
    init (for model: HotSalesProductModel) {
        nameText = model.title
        descriptionText = model.subtitle
        picture = model.picture
    }
}

class HotSalesCollectionViewCell: UICollectionViewCell {
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()
    var image = UIImageView()
    var buyNowButton = UIButton()
    var isNew = UILabel()
    
    func setModel() {
        buyNowButton.setTitle("Buy now!", for: .normal)
        buyNowButton.setTitleColor(.black, for: .normal)
        buyNowButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 11)
        buyNowButton.backgroundColor = .white
        buyNowButton.layer.cornerRadius = frame.height/14
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(image)
        addSubview(buyNowButton)
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 11)
        descriptionLabel.textColor = .white
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.pin.left(20).top(40).width(100).height(25)
        descriptionLabel.pin.below(of: nameLabel, aligned: .left).height(10).width(140).marginVertical(10)
        buyNowButton.pin.below(of: descriptionLabel, aligned: .left).marginVertical(10).left(20).height(20).width(70)
        image.pin.width(235).top().bottom().right()
    }
}

