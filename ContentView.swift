import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "bubble.left.and.text.bubble.right")
                .imageScale(.large)
                .foregroundColor(.blue)
                .font(.largeTitle)
            
            Text("SocialApp")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            HStack(spacing: 20) { // Use HStack for buttons
                Button(action: {
                    // Action for Log In button
                    print("Log In tapped")
                }) {
                    Text("Log In")
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(500)
                }
                
                Button(action: {
                    // Action for Sign Up button
                    print("Sign Up tapped")
                }) {
                    Text("Sign Up")
                        .padding()
                        .frame(maxWidth: 150)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(500)
                }
            }
            .padding(.bottom, 20) // Add padding to the bottom of the VStack
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
