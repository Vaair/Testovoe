//
//  TableView.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 29.01.2021.
//

import UIKit

private let url = "https://pryaniky.com/static/json/sample.json"

class TableView: UITableView {

    private var list: [ListData] = []
    
    var vc: ViewController!
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        delegate = self
        dataSource = self
        
        register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(list: [ListData]) {
        self.list = list
    }
}

extension TableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let variant = list[indexPath.row]
        
        if let url = variant.url {
            let cell = dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseId, for: indexPath) as! ImageTableViewCell
            
            cell.textMessageLabel.text = variant.text
            
            AlamofireNetworkRequest.downloadImage(url: url) { (image) in
                DispatchQueue.main.async {
                    cell.picture.image = image
                }
            }
            return cell
        } else {
            
            let cell = dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
            
            cell.textMessageLabel.text = variant.text

            return cell
   
        }
        
    }
   
}

extension TableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let variant = list[indexPath.row]
        
        let id = variant.name ?? String(describing: variant.id!)
        
        self.vc.setAlert(message: variant.text! + "\n Name or id: " + id)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
  
}
