//
//  SummaryViewController.swift
//  FibTest
//
//  Created by Samuel on 25/3/22.
//  Copyright © 2022 James Nguyen (JTN). All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private let cellID = "MyTableViewCell"
    private var datasource = [String]()
    private let storage = UserDefaults.standard
    private let dataName = "alldatasaved"
    private var datas = [DatasSaved]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        //datas = storage.object(forKey: dataName) as! [DatasSaved]
        let mydata = storage.array(forKey: dataName) as? [String] ?? []
        datasource = mydata
        print("mydata \(mydata)")
        
        setupUI()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }

}

//MARK: - UITableViewDataSource
extension SummaryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let cell = cell as? MyTableViewCell{
            let val = datasource[indexPath.row].components(separatedBy: "-")

            let number: String = val[0]
            var time: String = val[1]
            cell.setupCellWith(identifier: "\(number)", number: "\(time) ms")
        }
        //cell.textLabel = datasource[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SummaryViewController: UITableViewDelegate{


}
