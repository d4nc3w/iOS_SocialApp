import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false // State to track login status
    @State private var isSignUp = false // State to track sign up status
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        NavigationView {
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
                        isLoggedIn = true
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
                        isSignUp = true
                    }) {
                        Text("Sign Up")
                            .padding()
                            .frame(maxWidth: 150)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(500)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding()
            
            .fullScreenCover(isPresented: $isLoggedIn) {
                MainScreenView(name: $firstName) // Pass the firstName binding to MainScreenView
            }
            .fullScreenCover(isPresented: $isSignUp) {
                SignUpView(firstName: $firstName, lastName: $lastName, isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct SignUpView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Text("What's your Name?")
                .font(.title)
                .fontWeight(.bold)
            
            TextField("First Name", text: $firstName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button(action: {
                isLoggedIn = true
            }) {
                Text("Continue")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct MainScreenView: View {
    @Binding var name: String // Binding to reflect changes from outside
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome \(name)!")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
