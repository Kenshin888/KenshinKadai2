//
//  ContentView.swift
//  KenshinKadai2
//
//  Created by Kenshin on 2024/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var numbers:[String] = .init(repeating:"",count:2)
    @State private var selectedMulti = 0
    @State var anser:Int? = nil
    var body: some View {
        VStack {
            CustomField(num:$numbers[0])
            CustomField(num:$numbers[1])

            Picker(selection:$selectedMulti,label: Text("label")){
                Text("+").tag(0)
                Text("-").tag(1)
                Text("×").tag(2)
                Text("÷").tag(3)
            }
            .pickerStyle(.segmented)
        }



        Button("Button"){

            if selectedMulti == 0 {
                //足し算する
                if let firstnum = Int(numbers[0]),let secondnum = Int(numbers[1]){
                    anser = firstnum + secondnum
                }else{
                    anser = nil
                }

            }else if selectedMulti == 1 {
                //引き算する
                if let firstnum = Int(numbers[0]),let secondnum = Int(numbers[1]){
                    anser = firstnum - secondnum
                }else{
                    anser = nil
                }

            }else if selectedMulti == 2 {
                //引き算する
                if let firstnum = Int(numbers[0]),let secondnum = Int(numbers[1]){
                    anser = firstnum * secondnum
                }else{
                    anser = nil
                }

            }else{
                //引き算する
                if let firstnum = Int(numbers[0]),let secondnum = Int(numbers[1]),secondnum != 0 {
                    anser = firstnum / secondnum
                }else{
                    anser = nil
                }

            }
        }
        if let value = anser {
            Text("\(value)")
        }else if let firstnum = Int(numbers[0]),let secondnum = Int(numbers[1]){
            Text("割る数には0以外を入力してください")
        }else{
            Text("値が入っていません")
        }

    }

}



struct CustomField : View {
    @Binding var num : String
    var body: some View {
        TextField("",text:$num)
            .border(Color.gray,width:1)
            .padding()
    }
}



#Preview {
    ContentView()
}
