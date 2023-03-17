//
//  Health.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import UIKit

class Health: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let healthList: [HealthModel] = HealthModel.getMock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        let cellNib = UINib(nibName: "HealthTableViewCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "healthTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func l1(_ sender: Any) {
        
        UIApplication.shared.open(URL(string:"www.google.com")! as  URL, options:  [:], completionHandler: nil)
        
    }
    
    @IBAction func l2(_ sender: Any) {
        
        
        UIApplication.shared.open(URL(string:"www.google.com")! as  URL, options:  [:], completionHandler: nil)
    }
    
    
    @IBAction func l3(_ sender: Any) {
        
        
        UIApplication.shared.open(URL(string:"www.google.com")! as  URL, options:  [:], completionHandler: nil)
    }
    
    
    @IBAction func l4(_ sender: Any) {
        
        
        UIApplication.shared.open(URL(string:"www.google.com")! as  URL, options:  [:], completionHandler: nil)
    }
    
    @IBAction func l5(_ sender: Any) {
        
        UIApplication.shared.open(URL(string:"www.google.com")! as  URL, options:  [:], completionHandler: nil)
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

extension Health: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  healthList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthTableViewCell", for: indexPath) as! HealthTableViewCell
        let healthModel  =  healthList[indexPath.row]
        cell.setupUI(healthModel)
        cell.loacationButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        //  id =1
        cell.loacationButton.tag = indexPath.row

        return cell
    }
    
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        UIApplication.shared.open(URL(string: healthList[buttonTag].url)! as  URL, options:  [:], completionHandler: nil)
        // open web healthList [sender.tag]
    }
    
}
