//
//  TendencyDataModel.swift
//  TendencyTest
//
//  Created by soyeon on 2021/12/27.
//

import Foundation

struct TendencyDataModel {
    let data: [TendencyQuestionData]
}

struct TendencyQuestionData {
    let question: String
    var answers: [TendencyAnswerData]
}

struct TendencyAnswerData {
    var answer: String
}

// Dummy Data
var tendencyQuestionData = [
    TendencyQuestionData(question: "시험을 앞둔 당신,\n공부를 해야한다면?", answers: tendencyAnswerData1),
    TendencyQuestionData(question: "준비한 시험에서 좋은 결과를\n받은 당신, 듣고 싶은 칭찬이 있다면?", answers: tendencyAnswerData2),
]

var tendencyAnswerData1 = [
    TendencyAnswerData(answer: "같은 시험을 준비하는 (초면인) 사람들을\n모아 스터디룸에서 공부"),
    TendencyAnswerData(answer: "친한 친구들과 함께 의지를 투합"),
    TendencyAnswerData(answer: "혼자 카페에 가서 공부하는 사람들을 보며\n자극을 받아 열심히 공부"),
    TendencyAnswerData(answer: "혼자 집에서 아무에게도 방해를 받지 않고\n집중하며 공부"),
]

var tendencyAnswerData2 = [
    TendencyAnswerData(answer: "너 재능 있구나"),
    TendencyAnswerData(answer: "너 노력한 거에 비해 잘나왔다"),
    TendencyAnswerData(answer: "공부를 되게 열심히 했나봐! 멋지다"),
    TendencyAnswerData(answer: "며칠동안 밤을 새더니\n결국 좋은 결과가 나왔구나! 축하해!!")
]
