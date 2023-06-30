//
//  HistoryVC.swift
//  CarGo
//
//  Created by user on 4/6/23.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ResultTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultTableViewCell")
        

        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

    
}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Utils.openedResults.isEmpty ? 1 : Utils.openedResults.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "ShowMoreInfoViewController") as! ShowMoreInfoViewController
        vc.model = Utils.openedResults[indexPath.row]
        
            print("counttt = \(Utils.moreInfo.count)")
            navigationController?.pushViewController(vc, animated: true)
            
        
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.item)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else {
            
            return UITableViewCell()
            
        }
        cell.selectionStyle = .none
        cell.isFavorite = { isSuccies in
            Utils.filterCarGoDataArray[indexPath.row].isBookmarksSelected = isSuccies
            if let index = Utils.carGoDataArray.firstIndex(where: {$0.id == Utils.filterCarGoDataArray[indexPath.row].id}) {
                Utils.carGoDataArray[index].isBookmarksSelected = isSuccies
                if isSuccies == true {
                    Utils.selectedCarGoDataArray.append(Utils.filterCarGoDataArray[indexPath.row])
                    print("count == \(Utils.selectedCarGoDataArray.count)")
                }else{
                    for i in 0..<Utils.selectedCarGoDataArray.count {

                        
                        if Utils.filterCarGoDataArray[indexPath.row].id == Utils.selectedCarGoDataArray[i].id {
                            Utils.selectedCarGoDataArray.remove(at: i)
                            print("count == \(Utils.selectedCarGoDataArray.count)")
                            break
                        }
                    }
                }
            }

        }
        
        if Utils.openedResults.isEmpty {
            cell.emptyResult(true)
            cell.emptyResultLabel.text = "Ցավոք որոնման արդյունքում ոչինչ չի գտնվել"
        } else {
            let item = Utils.openedResults[indexPath.row]
            cell.setupData(item: item)
            cell.emptyResult(false)
        }
        
        return cell
    }
}

