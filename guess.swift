import Cocoa

// 計算核心
class Guess {
    // 答案
    let number = arc4random_uniform(10)
    
    // 判斷大小
    func answer(_ guess:Int) -> Int {
        if number == guess {
            return 0
        }
        else {
            if number > guess {
                return 1
            }
            else {
                return 2
            }
        }
    }
}

// 終端機版本
class CMD {
    static func gameloop() {
        // 步驟一：印出提示訊息
        print("請猜出 0 到 9 之間的正整數...")
        print("總共有三次機會猜出正確數字...")
        print("準備好了嗎...")
        
        // 步驟二：建立計算核心物件
        let g = Guess()
        
        // 步驟三：遊戲的主要迴圈
        var count = 0 // 記錄次數
        var flag = 0  // 記錄答對與否
        while count < 3 {
            count += 1
            print("請輸入：")
            var n: Int
            if let input = readLine() {
                n = Int(input)!
            }
            else {
                n = 0
            }
            
            let result = g.answer(n)
            switch (result) {
            case 0:
                // 步驟四之一：答對
                print("答對！")
                print("你猜了" + String(count) + "次...")
                flag = 1
            case 1:
                print("大一點！")
            case 2:
                print("小一點！")
            default:
                print("不正確的輸入...")
            }
            
            if (flag == 1) {
                break;
            }
        }
        
        // 步驟四之二：沒有答對
        if flag == 0 {
            print("猜了三次也沒猜對，答案是" + String(g.number) + "。")
        }
    }
}

// 執行遊戲
CMD.gameloop()

//《程式語言教學誌》的範例程式
// http://kaiching.org/
// 檔名：game.swift
// 功能：遊戲程式
// 作者：張凱慶

