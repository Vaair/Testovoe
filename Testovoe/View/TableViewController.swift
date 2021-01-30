//
//  ViewController.swift
//  Testovoe
//
//  Created by Лера Тарасенко on 29.01.2021.
//

import UIKit

private let url = "https://pryaniky.com/static/json/sample.json"

class TableViewController: UITableViewController {
    
    private var alert: UIAlertController!
    
    private var viewModel: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.reuseId)
        
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.tableFooterView = UIView()
        
        viewModel.fetchData(url: url, completion: { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
        
    }
    
    private func setAlert(message: String){
        alert = UIAlertController(title: "Вы выбрали", message: message, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Готово", style: .default)
        
        alert.addAction(doneAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let url = viewModel.getUrl(forIndexPath: indexPath) {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.reuseId, for: indexPath) as! ImageTableViewCell
            
            cell.textMessageLabel.text = viewModel.getText(forIndexPath: indexPath)
            
            viewModel.fetchImage(url: url) { (data) in
                DispatchQueue.main.async {
                    cell.picture.image = UIImage(data: data)
                }
            }

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
            
            cell.textMessageLabel.text = viewModel.getText(forIndexPath: indexPath)
            
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = (viewModel.getName(forIndexPath: indexPath) ?? viewModel.getId(forIndexPath: indexPath)) ?? ""
        
        self.setAlert(message: viewModel.getText(forIndexPath: indexPath)! + "\n Name or id: " + id)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


