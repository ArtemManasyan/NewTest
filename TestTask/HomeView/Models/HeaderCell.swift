//
//  CustomCollectionCell.swift
//  TestTask
//
//  Created by Артем Манасян on 05.12.2022.
//

import UIKit
import PinLayout

class HeaderCell: UICollectionViewCell {
    private var titleLabel = UILabel()
    private var moreButton = UIButton()
    private var model: HeaderCellModel?
    
    func setModel(model: HeaderCellModel) {
        
        titleLabel.text = model.titleText
        moreButton.setTitle(model.moreButtonText, for: .normal)
        moreButton.addTarget(self, action: #selector(didTapmoreButton) , for: .touchUpInside)
        addSubview(titleLabel)
        addSubview(moreButton)
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 23)
        moreButton.setTitleColor(UIColor(hex: "#FF6E4E"), for: .normal)
        
        self.model = model
    }
    
    static func dynamicSize(model: HeaderCellModel, width: CGFloat) -> CGFloat {
        
        return CGFloat(50)
    }
    
    @objc func didTapmoreButton() {
        model?.moreButtonAction?()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.pin.left(17).width(200).height(50)
        moreButton.pin.right(17).width(80).height(50)
    }
}

struct HeaderCellModel {
    var titleText: String
    let moreButtonText: String
    var moreButtonAction: (() -> Void)?
}


