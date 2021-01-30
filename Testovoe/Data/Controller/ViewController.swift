//
//  ViewController.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 29.01.2021.
//

import UIKit

private let url = "https://pryaniky.com/static/json/sample.json"

class ViewController: UIViewController {
    
    private var alert: UIAlertController!
    
    private var tableView = TableView()
    
    private var listData: [ListData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            
            self.tableView.set(list: self.listData)
            self.tableView.reloadData()
        }
        
        tableView.vc = self
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    func setAlert(message: String){
        alert = UIAlertController(title: "Вы выбрали", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Готово", style: .default)
        
        alert.addAction(doneAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


