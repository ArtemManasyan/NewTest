//
//  CartService.swift
//  TestTask
//
//  Created by Артем Манасян on 30.01.2023.
//

import Foundation
import Alamofire

class CartService {
    
    
    
    let cartUrl = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    func getBasket(completion: ((CartModelParsing) -> Void)?) {
        AF.request(cartUrl, method: .get).responseDecodable(of: CartModelParsing.self) { response in
            switch response.result {
            case let .success (cartModel):
                print(cartModel)
                completion?(cartModel)
            case let .failure(error):
                print(error)
            }
        }
    }
}
    
    
    
    
    
    
    
    
    
    
    

