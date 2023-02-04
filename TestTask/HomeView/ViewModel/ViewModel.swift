//
//  ViewModel.swift
//  TestTask
//
//  Created by Артем Манасян on 04.12.2022.
//

import Foundation
import UIKit

class ViewModel {
    
    weak var vc: ViewController?
    var selectedButtonType: CategoryButton.ButtonType = .phones
    let service = Service()
    
    func loadData() {
        
        let headerModel1 = HeaderCellModel(titleText: "Select Category", moreButtonText: "view all") {
        }
        let headerModel2 = HeaderCellModel(titleText: "Hot Sales", moreButtonText: "see more") {
        }
        let headerModel3 = HeaderCellModel(titleText: "Best Seller", moreButtonText: "see more") {
        }
        let categoryModel = CategoryButtonModel(
            categoryTap: { [unowned self] button in
                selectedButtonType = button
                loadData()
            },
            buttonsTypes: CategoryButton.ButtonType.allCases,
            selectedType: selectedButtonType
        )
        
        service.getInfo(completion: { model in
            let hotSalesModels = model.popularModels.map {
                HotSalesCellModel.init(for: $0)
            }
            
            let bestSellerModels = model.bestSellerModels.map {
                BestSellerCellModel.init(for: $0)
            }
   
            let cellsTypes: [CellType] = [
                .header(headerModel1),
                .categories(categoryModel),
                .header(headerModel2),
                .hotSales(hotSalesModels),
                .header(headerModel3),
                .bestSales(bestSellerModels)
            ]
            self.vc?.configCell(cellsTypes)
        })
    }
    
    func viewDidLoad() {
        loadData()
    }
    
    enum CellType {
        case header(HeaderCellModel)
        case categories(CategoryButtonModel)
        case hotSales([HotSalesCellModel])
        case bestSales([BestSellerCellModel])
        
        func height(for width: CGFloat) -> CGFloat {
            switch self {
            case .header(let model):
                return HeaderCell.dynamicSize(model: model, width: width)
            case .categories(let model):
                return CategoriesCell.dynamicSize(model: model, width: width)
            case .hotSales:
                return HotSalesCell.requiredHeight
            case .bestSales:
                return BestSellerCell.requiredHeight
            }
        }
    }
}

