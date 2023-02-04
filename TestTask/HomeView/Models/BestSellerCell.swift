//
//  ThirdCollectionViewCell.swift
//  TestTask
//
//  Created by Артем Манасян on 06.12.2022.
//

import UIKit
import Kingfisher

class BestSellerCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
        
    private var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 2
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomBestSellerCell.self, forCellWithReuseIdentifier: "bestSales")
        return collection
    }()

    private var models: [BestSellerCellModel]?
    static var requiredHeight: CGFloat = 250
    
    func setModel(models: [BestSellerCellModel]) {
        collection.dataSource = self
        collection.delegate = self
        addSubview(collection)
        collection.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        self.models = models
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collection.pin.all()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSales", for: indexPath) as! CustomBestSellerCell
        let model = models![indexPath.row]
        cell.nameLabel.text = model.nameText
        cell.discountPriceLabel.text =  model.discountPriceValue
        cell.notDiscountPriceLabel.text = model.notDiscountPriceValue
        cell.picture.kf.setImage(with: URL(string: model.picture))
        cell.setModel()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collection.bounds.width / 2) - 1, height: 228)
    }
}

struct BestSellerCellModel {
    let nameText: String
    let picture: String
    let discountPriceValue: String
    let notDiscountPriceValue: String
    var seeMoreButtonAction: (() -> Void)?
    
    init (for model: BestSellerProductModel) {
        nameText = model.title
        picture = model.picture
        discountPriceValue = {
            "$\(Int(model.discountPrice))"
        }()
        notDiscountPriceValue = {
            "$\(Int(model.priceWithoutDiscount))"
        }()
    }
}

class CustomBestSellerCell: UICollectionViewCell {
    var picture = UIImageView()
    var nameLabel = UILabel()
    var discountPriceLabel = UILabel()
    var notDiscountPriceLabel = UILabel()
    let underView: UIView = {
        let underV = UIView()
        
        return underV
    }()
    
    func setModel() {
        addSubview(underView)
        backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        underView.backgroundColor = .white
        underView.addSubview(picture)
        underView.addSubview(nameLabel)
        underView.addSubview(discountPriceLabel)
        underView.addSubview(notDiscountPriceLabel)
        nameLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 10)
        discountPriceLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        discountPriceLabel.textColor = .gray
        notDiscountPriceLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        underView.layer.cornerRadius = 20
        underView.pin.top(12).bottom().horizontally(8)
        picture.pin.width(150).height(160).hCenter().top(5)
        nameLabel.pin.below(of: picture).marginTop(20).width(150).height(15).left(25)
        discountPriceLabel.pin.below(of: picture).height(13).width(40).left(80)
        notDiscountPriceLabel.pin.below(of: picture).height(13).width(40).left(25)
        
        
    }
}

