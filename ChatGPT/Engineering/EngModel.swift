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
            EngModel(title: "gdsglhf", image: "NBPHE_500x500 (1)", url: "https://stackoverflow.com/questions/28894765/uibutton-action-in-table-view-cell"),
            EngModel(title: "1jkdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            EngModel(title: "1jkdfgdfgdgdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "String"),
            EngModel(title: "1jkdfgdfgdflllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            EngModel(title: "1jkdfgfdglllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "")
        ]
        
    }
}
