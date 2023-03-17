//
//  ITViewController.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import UIKit

class ITViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
  
    @IBOutlet weak var tableView: UITableView!
    
 let ITModelList: [ITModel] = ITModel.getMock()
    
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
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  ITModelList.count
    }
    
    @objc(tableView:cellForRowAtIndexPath:) func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "healthTableViewCell", for: indexPath) as! HealthTableViewCell
        let  itModel  =  ITModelList[indexPath.row]
        var healthModel = HealthModel(title: itModel.title, image: itModel.image, url: itModel.url)
        cell.setupUI(healthModel)
        cell.loacationButton.addTarget(self, action: #selector(connected(sender:)), for: .touchUpInside)
        //  id =1
        cell.loacationButton.tag = indexPath.row

        return cell
    }
    
    
    @objc func connected(sender: UIButton){
        let buttonTag = sender.tag
        UIApplication.shared.open(URL(string: ITModelList[buttonTag].url)! as  URL, options:  [:], completionHandler: nil)
        // open web healthList [sender.tag]
    
    }
}
