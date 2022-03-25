//
//  ViewController.swift
//  FibTest
//
//  Created by Samuel on 25/3/22.
//  Copyright © 2022 James Nguyen (JTN). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -IBOutlets
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Properties
    private let cellID = "MyTableViewCell"
    private var datasource = [0]
    private let storage = UserDefaults.standard
    private var datas = [String]()
    private let dataName = "alldatasaved"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        numberTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: .editingChanged)
        //datas = storage.object(forKey: dataName) as! [DataSaved]
       
        if let savedPerson = storage.object(forKey: dataName) as? DatasSaved {
            print(savedPerson)
            
        }
        setupUI()
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    
    @objc private func textFieldDidChange(_ textField: UITextField){
        let myInt = Int(numberTextField.text!) ?? 0
        if(myInt>=1 && myInt<10){
            
            fibonacci(number: myInt)
            tableView.reloadData()
            view.endEditing(true)
        }else{
            numberTextField.text?.removeAll()
            numberTextField.text?.append(contentsOf: "")
            datasource = [0]
            tableView.reloadData()
            
        }
        
        
        print(datas.count)
       
        
        
    }
    
    func fibonacci(number: Int) -> Int{
        let startingPoint = Date()
        var total = 0
        for i in 1...number {
            total = total+i
            datasource.append(total)
        }
        timeLabel.text = "\(startingPoint.timeIntervalSinceNow * -1) seconds elapsed"
        let time: Int = Int(startingPoint.timeIntervalSinceNow * -1000)
        let newValue = "\(number)-\(time)"
        
        datas.append(newValue)
        storage.set(datas, forKey: dataName)
        return total
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        if let cell = cell as? MyTableViewCell{
            cell.setupCellWith(identifier: "\(indexPath.row)", number: "\(datasource[indexPath.row])")
        }
        //cell.textLabel = datasource[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{


}
