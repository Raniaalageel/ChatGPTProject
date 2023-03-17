//
//  HealthModel.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import Foundation

struct HealthModel{
    let title: String
    let image: String
    let url: String
}

extension HealthModel {
    static func getMock() -> [HealthModel]{
        return  [
            HealthModel(title: "gdsglhf", image: "NBPHE_500x500 (1)", url: "https://stackoverflow.com/questions/28894765/uibutton-action-in-table-view-cell"),
            HealthModel(title: "1jkdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            HealthModel(title: "1jkdfgdfgdgdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "String"),
            HealthModel(title: "1jkdfgdfgdflllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            HealthModel(title: "1jkdfgfdglllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "")
        ]
        
    }
}
