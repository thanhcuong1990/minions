//
//  Answer.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation

class Answer {
    var iAnswerId:Int?
    var sDescription:String?
    
    func parseToDict(questionId:Int) -> Dictionary<String,Int> {
        return ["question_id":questionId,"answer_id":self.iAnswerId!]
    }
}