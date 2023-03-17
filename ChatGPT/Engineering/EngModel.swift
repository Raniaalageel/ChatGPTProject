//
//  EngModel.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import Foundation
struct EngModel{
    let title: String
    let image: String
    let url: String
}

extension EngModel {
    static func getMock() -> [EngModel]{
        return  [
            EngModel(title: "IASSC Certified Black Belt", image: "5", url: "https://iassc.org/six-sigma-certification/black-belt-certification/"),
            EngModel(title: "Strategic Management Performance System Certification (SMPS)", image: "44", url: "https://www.informa-mea.com/online-programmes/strategy-management/strategic-management-performance-system-smps-certification-online-programmes"),
            EngModel(title: "Certified Wireless Network Administrator (CWNA)", image: "3", url: "https://www.cwnp.com/certifications/cwna"),
            EngModel(title: "ARINC Installer, Technician (AFI/AFT)", image: "2", url: "https://www.etai.org/fiber_cabling.html"),
            EngModel(title: "Leadership in Energy and Environmental Design (LEED)", image: "1", url: "https://www.usgbc.org/leed")
        ]
        
    }
}
