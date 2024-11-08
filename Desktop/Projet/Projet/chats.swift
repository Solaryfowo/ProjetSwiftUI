//
//  chats.swift
//  Projet
//
//  Created by Sylvain Fowo on 02/11/2024.
//


import SwiftUI

struct chats: View {
   // @State private var messageText = ""
      // @State var messages: [String] = ["Welcome to Chat Bot 2.0!"]
    
    var body: some View {
        HStack {
            Text("chat")
                .font(.largeTitle)
                .bold()
            
            Image(systemName: "bubble.left.fill")
                .font(.system(size: 26))
                .foregroundColor(Color.blue)
//                   Text("iBot")
//                       .font(.largeTitle)
//                       .bold()
//
//                   Image(systemName: "bubble.left.fill")
//                       .font(.system(size: 26))
//                       .foregroundColor(Color.blue)
//               }
//
//               ScrollView {
//                   ForEach(messages, id: \.self) { message in
//                       // If the message contains [USER], that means it's us
//                       if message.contains("[USER]") {
//                           let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
//
//                           // User message styles
//                           HStack {
//                               Spacer()
//                               Text(newMessage)
//                                   .padding()
//                                   .foregroundColor(Color.white)
//                                   .background(Color.blue.opacity(0.8))
//                                   .cornerRadius(10)
//                                   .padding(.horizontal, 16)
//                                   .padding(.bottom, 10)
//                           }
//                       } else {
//
//                           // Bot message styles
//                           HStack {
//                               Text(message)
//                                   .padding()
//                                   .background(Color.gray.opacity(0.15))
//                                   .cornerRadius(10)
//                                   .padding(.horizontal, 16)
//                                   .padding(.bottom, 10)
//                               Spacer()
//                           }
//                       }
//
//                   }.rotationEffect(.degrees(180))
//               }
//               .rotationEffect(.degrees(180))
//               .background(Color.gray.opacity(0.1))
//
//
//               // Contains the Message bar
//               HStack {
//                   TextField("Type something", text: $messageText)
//                       .padding()
//                       .background(Color.gray.opacity(0.1))
//                       .cornerRadius(10)
//                       .onSubmit {
//                           sendMessage(message: messageText)
//                       }
//
//                   Button {
//                       sendMessage(message: messageText)
//                   } label: {
//                       Image(systemName: "paperplane.fill")
//                   }
//                   .font(.system(size: 26))
//                   .padding(.horizontal, 10)
//               }
//               .padding()
//           }
//       }
//
//       func sendMessage(message: String) {
//           withAnimation {
//               messages.append("[USER]" + message)
//               self.messageText = ""
//
//               DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                   withAnimation {
//                       messages.append(getBotResponse(message: message))
//                   }
              }
//
    }
    
}
#Preview  {
   
        chats()
        
        
    }

