//
//  CartViewModel.swift
//  TestTask
//
//  Created by Артем Манасян on 29.01.2023.
//

import Foundation

class CartViewModel {
    
    weak var cartVC: MyCartViewController?
    private let cartService = CartService()
    
    
    func loadData() -> MyCartView {
        let cartView = MyCartView()
        cartService.getBasket { cart in
            let basket = cart.basket.map {
                BasketModel(model: $0)
            }
            let total = TotalModel(model: cart)
            cartView.setModel(models: basket, totalModel: total)
        }
        return cartView
    }
    
//    func viewDidLoad() {
//        loadData()
//    }
    
    

}



