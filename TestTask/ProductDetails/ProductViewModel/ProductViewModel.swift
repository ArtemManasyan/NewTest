//
//  ProductViewModel.swift
//  TestTask
//
//  Created by Артем Манасян on 14.01.2023.
//

import UIKit


class ProductViewModel {
    
    weak var vc: ProductViewController?
    let productService = ProductService()
    
    func loadData() {
        productService.getData(completion: { product in
            let picturesCellModel = PicturesCellModel(model: product)
            let descriptionCellModel = DescriptionCellModel(model: product)
            let productCellTypes: [ProductCellType] = [
                .picturesProductModel(picturesCellModel),
                .discriptionProductModel(descriptionCellModel)
            ]
            self.vc?.configProductCell(productCellTypes)
            })
    }
    
    func viewDidLoad() {
        loadData()
    }
    
    enum ProductCellType {
        case picturesProductModel(PicturesCellModel)
        case discriptionProductModel(DescriptionCellModel)
        
        func height(for width: CGFloat) -> CGFloat {
            switch self {
            case .picturesProductModel:
                return PicturesTableCell.requiredHeight
            case .discriptionProductModel:
                return DescriptionCell.requiredHeight
            }
        }
    }
    
}
