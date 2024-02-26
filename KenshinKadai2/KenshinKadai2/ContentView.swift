//
//  ContentView.swift
//  KenshinKadai2
//
//  Created by Kenshin on 2024/02/24.
//

import SwiftUI

struct ContentView: View {
    @State var numbers: [String] = .init(repeating: "", count: 2)
    @State private var selectedMulti = 0
    @State var anser: String = "値が入っていません"

    var body: some View {
        VStack {
            CustomField(num: $numbers[0])
            CustomField(num: $numbers[1])

            Picker(selection: $selectedMulti, label: Text("label")) {
                Text("+").tag(0)
                Text("-").tag(1)
                Text("×").tag(2)
                Text("÷").tag(3)
            }
            .pickerStyle(.segmented)
        }

        Button("Button") {
            guard let firstnum = Int(numbers[0]), let secondnum = Int(numbers[1]) else {
                anser = "値が入っていません"
                return
            }

            switch selectedMulti {
            case 0:
                anser = "\(firstnum + secondnum)"
            case 1:
                anser = "\(firstnum - secondnum)"
            case 2:
                anser = "\(firstnum * secondnum)"
            default:
                if secondnum == 0 {
                    anser = "割る数には0以外を入力してください"
                } else {
                    anser = "\(firstnum / secondnum)"
                }
            }
        }

        Text(anser)
    }
}

struct CustomField: View {
    @Binding var num: String
    var body: some View {
        TextField("", text: $num)
            .border(Color.gray, width: 1)
            .padding()
    }
}

#Preview {
    ContentView()
}
