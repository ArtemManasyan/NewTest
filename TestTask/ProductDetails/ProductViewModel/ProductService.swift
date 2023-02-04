//
//  ProductService.swift
//  TestTask
//
//  Created by Артем Манасян on 15.01.2023.
//

import Foundation
import Alamofire

class ProductService {
    
    let productUrl = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    func getData(completion: ((ProductDetailsModel) -> Void)?) {
        AF.request(productUrl, method: .get).responseDecodable(of: ProductDetailsModel.self) { response in
            switch response.result {
            case let .success (product):
                print(product)
                completion?(product)
            case let .failure(error):
                print(error)
            }
        }
    }
}




