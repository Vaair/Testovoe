//
//  ViewModel.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 30.01.2021.
//

import Foundation

class ViewModel{
    private var listData: [ListData] = []
    
    func numberOfRows() -> Int {
        return listData.count
    }
    
    func getUrl(forIndexPath indexPath: IndexPath) -> String? {
        let variant = listData[indexPath.row]
        return variant.url 
    }
    
    func getText(forIndexPath indexPath: IndexPath) -> String? {
        let variant = listData[indexPath.row]
        return variant.text
    }
    
    func getName(forIndexPath indexPath: IndexPath) -> String? {
        let variant = listData[indexPath.row]
        return variant.name
    }
    
    func getId(forIndexPath indexPath: IndexPath) -> String? {
        let variant = listData[indexPath.row]
        return String(describing: variant.id!) 
    }
    
    func fetchData(url: String, completion: @escaping () -> ()) {
        AlamofireNetworkRequest.responseData(url: url) { (model) in

            for sequence in model.view {
                let index = model.data.firstIndex(where: {$0.name == sequence })

                if sequence == "selector"{
                    for i in 0..<model.data[index!].data.variants!.count {
                        self.listData.append(ListData(url: nil,
                                                      name: nil,
                                                      text: model.data[index!].data.variants![i].text,
                                                      id: model.data[index!].data.variants![i].id))
                    }

                } else {

                    self.listData.append(ListData(url: model.data[index!].data.url,
                                                  name: model.data[index!].name,
                                                  text: model.data[index!].data.text,
                                                  id: nil))

                }

            }
            completion()
        }
    }
    
    func fetchImage(url: String, completion: @escaping (Data) -> ()) {
        AlamofireNetworkRequest.downloadImage(url: url) { (image) in
            completion(image.pngData()!)
        }

    }
    
}
