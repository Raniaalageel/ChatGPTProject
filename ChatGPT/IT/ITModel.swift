//
//  ITModel.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import Foundation

struct ITModel{
    let title: String
    let image: String
    let url: String
}

extension ITModel {
    static func getMock() -> [ITModel]{
        return  [
            ITModel(title: "CompTIA A+", image: "aa", url: "https://www.comptia.org/certifications/a"),
            ITModel(title: "Azure  AI Fundamentals", image: "b", url: "https://learn.microsoft.com/en-us/certifications/azure-ai-fundamentals/"),
            ITModel(title: "Certified Ethical Hacker", image: "cc", url: "https://www.eccouncil.org/train-certify/certified-ethical-hacker-ceh/"),
            ITModel(title: "Certificate in Cybersecurity Analysis", image: "dd", url: "https://www.iiba.org/business-analysis-certifications/certificate-in-cybersecurity-analysis/"),
            ITModel(title: "COBIT Foundation", image: "e", url: "https://www.isaca.org/credentialing/cobit-foundation")
        ]
        
    }
}
