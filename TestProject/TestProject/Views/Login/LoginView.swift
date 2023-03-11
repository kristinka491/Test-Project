//
//  LoginView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.backgroundColor
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0) {
                Text(StringConstants.loginTitle)
                    .font(.montserrat(.bold, size: 25))
                    .foregroundColor(.headerColor)
                    .padding(.bottom, 80)
                VStack(spacing: 35) {
                    AuthorizationTextField(placeHolder: StringConstants.loginFirstNamePlaceholder,
                                           text: $viewModel.firstName)
                    
                    HStack {
                        SecureField(StringConstants.loginPasswordPlaceholder, text: $viewModel.password)
                            .multilineTextAlignment(.center)
                            .frame(height: 29)
                            .font(.montserrat(.regular, size: 12))
                            .foregroundColor(.placeholderColor)
                            .autocorrectionDisabled(true)
                            .padding(.leading, 30)
                        
                        Image("SecureEntry")
                            .padding(.trailing, 15)
                    }
                    .background(Color.placeholderBackgroundColor)
                    .cornerRadius(20)
                    
                }
                
                Button(action: {
                    viewModel.checkUser()
                }, label: {
                    Text(StringConstants.loginLoginButtonTitle)
                        .font(.montserrat(.bold, size: 14))
                        .foregroundColor(.buttonForegroundColor)
                })
                .disabled(!viewModel.isValid)
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .opacity(!viewModel.isValid ? 0.5 : 1)
                .background(Color.buttonBackgroundColor)
                .cornerRadius(15)
                .padding(.top, 99)
            }
            .padding(.leading, 44)
            .padding(.trailing, 42)
        }.navigationDestination(isPresented: $viewModel.isRegistered) {
            TabbarView()
        }.toolbar(.hidden)
        .alert(DataError.wrongUsernameOrPassword.title, isPresented: $viewModel.isShowError) {
        } message: {
            Text(DataError.wrongUsernameOrPassword.message)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
