//
//  PicturesCell.swift
//  TestTask
//
//  Created by Артем Манасян on 16.01.2023.
//

import UIKit
import iCarousel
import Kingfisher

class PicturesTableCell: UITableViewCell, iCarouselDataSource, iCarouselDelegate {

    
    let carousel = iCarousel()
    static var requiredHeight: CGFloat = 335
    var model: PicturesCellModel!
    
    func setModel(model: PicturesCellModel) {
        self.model = model
        addSubview(carousel)
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .rotary
        self.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        carousel.pin.all()
    }
}

extension PicturesTableCell {
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        model.pictures.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let myIndex = model.pictures[index]
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 240, height: 330))
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 20
        let myPicture = UIImageView()
        myView.addSubview(myPicture)
        myPicture.pin.width(220).height(315).hCenter().vCenter()
        myPicture.kf.setImage(with: URL(string: myIndex))
        return myView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {

        return value
    }
    
    

}

struct PicturesCellModel {
    var pictures: [String]
    
    init(model: ProductDetailsModel) {
        pictures =  model.images
    }
}

