//
//  NetworkService.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 28.01.2021.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func responseData(url: String, completion: @escaping (Model) -> ()) {
        guard let url = URL(string: url) else { return }
        
        request(url).validate().responseData { (responseData) in
            
            switch responseData.result {
            case .success(let data):
                do{
                    let result = try JSONDecoder().decode(Model.self, from: data)
                    completion(result)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func downloadImage(url: String, completion: @escaping (_ image: UIImage)->()) {
        
        guard let url = URL(string: url) else { return }
        
        request(url).validate().responseData { (responseData) in
            
            switch responseData.result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                print(error)
            }
        }
    }
}
