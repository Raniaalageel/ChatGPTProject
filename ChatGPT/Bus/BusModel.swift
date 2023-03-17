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
            BusModel(title: "Certified Fraud Examiner (CFE)", image: "cfe", url: "https://stackoverflow.com/questions/28894765/uibutton-action-in-table-view-cell"),
            BusModel(title: "Financial Modeling & Valuation Analyst FMVA", image: "FMVA", url: "https://corporatefinanceinstitute.com/certifications/financial-modeling-valuation-analyst-fmva-program/"),
            BusModel(title: "Talent Management Certification Program", image: "tmcp1", url: "https://instituteod.com/organization-development-certification-programs/talent-management-certified-professional/"),
            BusModel(title: "Brand Management Certificate Program", image: "Cornell_University_Logo", url: ""),
            BusModel(title: "Certified Associate in Project Management (CAPM)", image: "capm-600px", url: "https://www.rics.org/training-events/online-training/on-demand/certified-associate-project-management?&cid=PPC%7cGoogle%7cTrainingEventsDSAMENA%7cLowValue%7cDSA%7cAll&gclid=Cj0KCQjwn9CgBhDjARIsAD15h0C6ZZY0-DPecE-ns54YbFwInHa5ylyTcJduGaataix02JwXeAaEesgaAn-CEALw_wcB&gclsrc=aw.ds")
        ]
        
    }
}
