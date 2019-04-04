//
//  TestBasicController.swift
//  TestSwift
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
// TODO:------
/// 枚举定义
enum PersonType {
    case Children
    case Adult
    case Old
    case Test
}

class TestBasicController: UIViewController {

    lazy var arr : NSMutableArray = {
        return NSMutableArray.init();
    }();
    // MARK:------test
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
//        test1();
//        test2();
//        test3();
//        test4();
//        test5();
//        test6();
//        test7();
//        test8(person: ["name":"aa", "location":"BeiJing"]);
//        test9(person: "aaaa");
//        print((test10(arr: [1,3,4,5,6,32,12,4,5,6,0])));
//        test11("aaa");
        /*
        var a = 20;
        var b = 30;
        print("a = \(a), b = \(b)");
        test12(a: &a, b: &b);
        print("a = \(a), b = \(b)");
         */
//        test13();
        /*
        func aa(a : String, b : String) {
            print("a = \(a), b = \(b)");
        }
        test14(clousure: aa);
        */
        /*
        let btn = UIButton.init(type: .custom);
        btn.backgroundColor = UIColor.black;
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100);
        btn.center = self.view.center;
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside);
        self.view.addSubview(btn);
        
        let makeIncrementByTen = test15(forIncrement: 10);
        
        print(makeIncrementByTen());
        print(makeIncrementByTen());
        print(makeIncrementByTen());
        */
        test16();
    }
    
    
    func test16() -> Void {
        let personType = PersonType.Adult;
        print(personType);
    }
    
    @objc func btnClick() -> Void {
        let num = test15(forIncrement: 20);
        print(num());
    }
    
    func test15(forIncrement amount : Int) -> () -> Int {
        var runningTotal = 0;
        func increment() -> Int {
            runningTotal += amount;
            return runningTotal;
        }
        return increment;
    }
    
    /// 闭包
    func test14(clousure:(_ a : String, _ b : String) -> Void) -> Void {
        clousure("sss", "bbb");
    }
    
    func test13() -> Void {
        var arr = [1,3,5,6,3,1,4];
        func temp(a : Int, b : Int) -> Bool {
            return a < b;
        }
        print(arr.sort(by: temp));
        arr.sort(by: {(a : Int, b : Int) -> Bool in return a < b});
    }
    
    /// 函数参入的参数是let修饰的,不可变
    func test12(a:inout Int, b :inout Int) -> Void {
        let temp = a;
        a = b;
        b = temp;
    }
    
    func test11(_ name : String) -> Void {
        print("----\(name)");
    }
    
    func test10(arr : [Int]) -> (min: Int, max: Int) {
        var minValue = arr[0];
        var maxValue = arr[0];
        for val in arr[1..<arr.count] {
            if (val > maxValue) {
                maxValue = val;
            } else if (val < minValue) {
                minValue = val;
            }
        }
        return (maxValue, minValue);
    }
    
    func test9(person : String) -> Void {
        print("this is a \(person)");
    }
    
    func test8(person: [String: String]) {
        guard let name = person["name"] else {
            return
        }
        print("Hello \(name)")
        guard let location = person["location"] else {
            print("I hope the weather is nice near you.")
            return
        }
        print("I hope the weather is nice in \(location).")
    }
    
    // 检测 API 可用性
    func test7() -> Void {
        if #available(iOS 12.0, *) {
            print("iOS 12 is can Use");
        } else {
            print("iOS 12 is not can use");
        }
    }
    
    func test6() -> Void {
        var someIntes = [Int]();
        print(someIntes.count);
        for i in 10...15 {
            someIntes.append(i);
        }
        print(someIntes.count);
        
        var threeDoubles = Array(repeating: 1, count: 4);
        for i in threeDoubles {
            print(i);
        }
        
        var temp = someIntes + threeDoubles;
        for i in temp {
            print(i);
        }
        
        temp = [];
        print(temp.isEmpty);
        print(someIntes[3]);
    }
  
    func test5() -> Void {
        print((1, 2) <= (1, 2));
        print(("a", "2") < ("a", "3"));
        for index in 1...10 {
            print(index);
        }

        for index in 1..<10 {
            print(index);
            self.arr.add("this is \(index)");
        }
        
        for index in self.arr {
            print(index);
        }
        
        let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪";
        print(unusualMenagerie.count);
    }
    
    func test4() -> Void {
        if let t = Int("111") {
            print("can to a number");
        } else {
            print("could not to a number");
        }
    }
    
    func test3() -> Void {
        let i = "123aaa";
        let a = Int(i);
        print(a ?? 10);
        // var 声明一个变量为赋值,为nil
        var b : String?;
        print(b);
    }
    
    func test2() -> Void {
        let httpNotFound = (404, "Not Found");
        let (statusCode, statusMessage) = httpNotFound;
        print("statusCode = \(statusCode), stetusMessage = \(statusMessage)");
        
        let User = (userName:"zhangsan", age:20);
        print("username = \(User.userName), age = \(User.age)");
    }
    
    func test1() -> Void {
        // let 声明的为常量,不可再更改
//        let maxNUmber = 10;
        // var 声明的为变量, 可以更改其值
        var minNumber = 1;
//        maxNUmber = 100;
        minNumber = -10;
        print(minNumber);
        
        // var 可以推断类型,类型一旦确定,后面不可以更改
        var a = "s";
//        a = 10;
        print(a);
    }

}
