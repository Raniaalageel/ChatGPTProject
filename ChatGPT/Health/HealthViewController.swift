//
//  Health.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import UIKit

class Health: UIViewController,  UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    let healthList: [HealthModel] = HealthModel.getMock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI(){
        let cellNib = UINib(nibName: "HealthTableViewCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "healthTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
    @IBAction func popop(_ sender: Any) {
        
        self.dismiss(animated: true)
        
    }
    

}


