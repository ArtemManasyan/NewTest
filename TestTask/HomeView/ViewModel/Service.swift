//
//  Service.swift
//  TestTask
//
//  Created by Артем Манасян on 04.12.2022.
//

import Foundation
import Alamofire
import Kingfisher

class Service {

    let homeStore = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    
    func getInfo(completion: ((HomeStoreModel) -> Void)?) {
        AF.request(homeStore, method: .get).responseDecodable(of: HomeStoreModel.self) { response in
            switch response.result {
            case let .success (homeModel):
                print(homeModel)
                completion?(homeModel)
            case let .failure(error):
                print(error)
            }
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    

