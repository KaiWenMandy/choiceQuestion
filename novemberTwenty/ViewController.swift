//
//  ViewController.swift
//  novemberTwenty
//
//  Created by User13 on 2018/11/28.
//  Copyright © 2018 user13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 每一題的類別
    struct qua {
        var question:String
        var answer:String
        var choice:[String] = []
    }
    // 選項
    @IBOutlet var answerButton: [UIButton]!
    // 題目
    @IBOutlet weak var questionLabel: UILabel!
    // 題號
    @IBOutlet weak var roundLabel: UILabel!
    // 上面的貓貓圖
    @IBOutlet weak var onImage: UILabel!
    // 下面的人形圖
    @IBOutlet weak var underImage: UILabel!
    // 分數
    @IBOutlet weak var totalLabel: UILabel!
    // 時間
    @IBOutlet weak var timeLabel: UILabel!
    // 再來一次鈕
    @IBOutlet weak var againButton: UIButton!
    // 各題
    var mulitples = [
        qua(question: "『夜國之主・月讀』與『創世明神・天照大神』是什麼關係？", answer: "手足", choice: [ "手足", "親子", "情侶", "閨蜜" ]),
        qua(question: "『冰雪貴公子・奧格斯』是什麼種族？", answer: "龍族", choice: [ "龍族", "人類", "天使", "源神" ]),
        qua(question: "鑲嵌在手部裝備的秘石是什麼形狀？", answer: "三角形", choice: [ "三角形", "六角形", "四角形", "水滴形" ]),
        qua(question: "『黑闇領主・萊因哈特』的妻子的名字是下列何者？", answer: "露西亞", choice: [ "露西亞", "伊莎朵", "瑪姬", "露絲" ]),
        qua(question: "『滅世邪神・洛基』曾經在主線任務中附身在誰身上？", answer: "伊薩爾", choice: [ "伊薩爾", "萊因哈特", "奧格斯", "艾利諾姆" ]),
        qua(question: "『詢戀歌姬・繆絲』喜歡的對象為下列何者？", answer: "阿波羅", choice: [ "阿波羅", "阿基里斯", "浮士德", "基加美修" ]),
        qua(question: "下列何者武器類型為魔法武器？", answer: "魔槍", choice: [ "戰弓", "雙手斧", "手裏劍", "魔槍" ]),
        qua(question: "下列何者武器為左手持物？", answer: "法書", choice: [ "法書", "雙手斧", "鐮刀", "魔槍" ]),
        qua(question: "下列何者武器傷害係數最高？", answer: "雙手斧", choice: [ "劍盾", "雙手斧", "雙刀", "拳刃" ]),
        qua(question: "幻想神域的技能元素屬性不含無屬有幾種？", answer: "6種", choice: [ "5種", "6種", "7種", "8種" ]),
        qua(question: "『斷魂闇姬・克蕾絲』的武器為何者？", answer: "鐮刀", choice: [ "鐮刀", "法書", "聖劍", "雙手杖" ]),
        qua(question: "穿透屬性主要是為了抵制王怪的何者屬性？", answer: "韌性", choice: [ "韌性", "減少傷害", "額外特殊減傷", "反穿透" ]),
        qua(question: "下列何者不為曾經的王？", answer: "亞伯拉罕", choice: [ "亞伯拉罕", "奧格斯", "伊薩爾", "萊茵哈特" ]),
        qua(question: "『冰雪貴公子・奧格斯』身形增長的理由為下列何者？", answer: "時光之力", choice: [ "時光之力", "時代力量", "洪荒之力", "自然長大" ]),
        qua(question: "『魔物研究所』位於下列何者？", answer: "忘卻林", choice: [ "忘卻林", "納維亞聖城", "披月丘陵", "奇蹟礦山" ]),
        qua(question: "目前次元大廳並無開放下列何者等級？", answer: "25等", choice: [ "25等", "35等", "45等", "55等" ]),
        qua(question: "下列何者不為獅王『里奧・萊恩』的兒子？", answer: "帕奧里・萊恩", choice: [ "帕若歐・萊恩", "帕里斯・萊恩", "帕帕爾・萊恩", "帕奧里・萊恩" ]),
        qua(question: "下列何者地圖無法經由一般地圖的傳送石進入？", answer: "星月山谷", choice: [ "荒漠沙谷", "獵日峽谷", "星月山谷", "護封隱谷" ]),
        qua(question: "『你說什麼！』稱號是從哪個地圖獲得？", answer: "護封隱谷", choice: [ "幽湖秘林", "護封隱谷", "日落狂山", "月殞魔窟" ]),
        qua(question: "天使長艾斯提爾的稱號為下列何者？", answer: "啟示之翼", choice: [ "啟示之翼", "奇緣之神", "起源之使", "祈願之羽" ])
    ]
    var choices:[String] = [] // 目前的題目選項陣列
    var totalScore:Int = 0 // 分數
    var mul:qua? // 目前的題目物件
    var test:[Int] = [] // 題庫的出題順序
    var count = 0 // 算目前第幾題
    var counter = 30 // 計時器，一開始3分鐘
    var timer = Timer() // 計時器
    let roundString = [ "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" ] // 題號以中文表示
    var historyScore:[Int] = [ 0, 0, 0, 0 ]
    var historyTime = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        test = num.shuffled()
        timeLabel.text = "3:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        changeQuestion()
    }
    
    // 當按下答案即執行
    @IBAction func choiceButton(_ sender: UIButton) {
        // 代表所選button是array的第幾個成員
        let number = answerButton.firstIndex(of: sender)
        if ( answerButton[number!].currentTitle == mul!.answer ) {
            totalScore += 10
            totalLabel.text = String(totalScore)
            underImage.text = "😆"
            onImage.text = "😾"
        }
        else {
            underImage.text = "😥"
            onImage.text = "😹"
        }
        count += 1
        if ( count < 10 ) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                //self.displayAnswer()
                self.changeQuestion()
            }
        }
        else {
            finalScore()
        }
    }
    
    // 重新計算與遊戲
    @IBAction func playButoon(_ sender: Any) {
        let num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        test = num.shuffled()
        count = 0
        totalScore = 0
        totalLabel.text = String(totalScore)
        counter = 180
        timeLabel.text = "3:00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        for i in 0...3 {
            answerButton[i].isEnabled = true
        }
        againButton.setTitle("重新", for: .normal)
        changeQuestion()
    }
    
    // 更新題目
    func changeQuestion() {
        mul = mulitples[test[count]]
        roundLabel.text = "第" + roundString[count] + "題"
        questionLabel.text = mul!.question
        choices = mul!.choice.shuffled()
        answerButton[0].setTitle(choices[0], for: .normal)
        answerButton[1].setTitle(choices[1], for: .normal)
        answerButton[2].setTitle(choices[2], for: .normal)
        answerButton[3].setTitle(choices[3], for: .normal)
        underImage.text = "🤨"
        onImage.text = "😺"
    }
    
    // 最後結算
    func finalScore () {
        timer.invalidate()
        for i in 0...3 {
            answerButton[i].isEnabled = false
        }
        againButton.setTitle("再玩一次", for: .normal)
        historyDisplay()
        
        //
        switch totalScore {
        case 100:
            timeLabel.text = "Right!"
            underImage.text = "😇"
            onImage.text = "🙀"
        case 90:
            timeLabel.text = "WIN!"
            underImage.text = "🤗"
            onImage.text = "😿"
        case 80:
            timeLabel.text = "WIN!"
            underImage.text = "🤩"
            onImage.text = "😿"
        case 70:
            timeLabel.text = "WIN!"
            underImage.text = "😍"
            onImage.text = "😿"
        case 60:
            timeLabel.text = "WIN!"
            underImage.text = "😤"
            onImage.text = "😸"
        case 50:
            timeLabel.text = "OK!!"
            underImage.text = "😋"
            onImage.text = "😸"
        case 40:
            timeLabel.text = "LOSS!"
            underImage.text = "😓"
            onImage.text = "😸"
        case 30:
            timeLabel.text = "LOSS!"
            underImage.text = "😭"
            onImage.text = "😽"
        case 20:
            timeLabel.text = "LOSS!"
            underImage.text = "😨"
            onImage.text = "😽"
        case 10:
            timeLabel.text = "LOSS!"
            underImage.text = "😰"
            onImage.text = "😽"
        default:
            timeLabel.text = "Oh,NO"
            underImage.text = "😱"
            onImage.text = "😻"
        }
    }
    
    // 每一秒處理計時器
    @objc func timerRun () {
        counter -= 1
        let countSec:Int = counter % 60
        let countMin:Int = counter / 60
        timeLabel.text = String(countMin) + ":" + String( format: "%02d", countSec )
        if ( counter > 0 ) {
        }
        else {
            finalScore()
        }
    }
    
    // 在結算時顯示歷史紀錄
    func historyDisplay () {
        if ( historyTime < 4 ) {
            historyScore[historyTime] = totalScore
        }
        else {
            historyScore[0] = historyScore[1]
            historyScore[1] = historyScore[2]
            historyScore[2] = historyScore[3]
            historyScore[3] = totalScore
        }
        roundLabel.text = "共玩" + String(historyTime + 1) + "次"
        if ( historyTime > 3 ) {
            questionLabel.text = "歷史紀錄：倒數四次"
            for i in 0...3 {
                answerButton[i].setTitle(String(historyScore[3 - i]), for: .normal)
            }
        }
        else {
            questionLabel.text = "歷史紀錄"
            for i in 0...3 {
                if ( (historyTime - i + 1) > 0 ) {
                    answerButton[i].setTitle(String(historyScore[historyTime - i]), for: .normal)
                }
                else {
                    answerButton[i].setTitle("", for: .normal)
                }
            }
        }
        historyTime += 1
    }
    
}

