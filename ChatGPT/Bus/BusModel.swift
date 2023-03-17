//
//  BusModel.swift
//  ChatGPT
//
//  Created by Amani Aldahmash on 17/03/2023.
//

import Foundation
struct BusModel{
    let title: String
    let image: String
    let url: String
}

extension BusModel {
    static func getMock() -> [BusModel]{
        return  [
            BusModel(title: "gdsglhf", image: "NBPHE_500x500 (1)", url: "https://stackoverflow.com/questions/28894765/uibutton-action-in-table-view-cell"),
            BusModel(title: "1jkdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            BusModel(title: "1jkdfgdfgdgdlllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "String"),
            BusModel(title: "1jkdfgdfgdflllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: ""),
            BusModel(title: "1jkdfgfdglllfjdhl dfahlf  jdhlhf", image: "NBPHE_500x500 (1)", url: "")
        ]
        
    }
}
