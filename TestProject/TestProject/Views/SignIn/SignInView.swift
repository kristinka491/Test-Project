//
//  SignInView.swift
//  TestProject
//
//  Created by Krystsina on 2023-03-10.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 0) {
                    Text(StringConstants.signInTitle)
                        .font(.montserrat(.bold, size: 25))
                        .foregroundColor(.headerColor)
                        .padding(.bottom, 78)
                    
                    VStack(spacing: 35) {
                        AuthorizationTextField(placeHolder: StringConstants.signInFirstNamePlaceholder,
                                               text: $viewModel.firstName)
                        AuthorizationTextField(placeHolder: StringConstants.signInLastNamePlaceholder,
                                               text: $viewModel.lastName)
                        
                        VStack {
                            AuthorizationTextField(placeHolder: StringConstants.signInEmailPlaceholder,
                                                   text: $viewModel.email)
                            if !viewModel.isEmailValid {
                                Text(StringConstants.signInInvalidEmail)
                                    .font(.montserrat(.bold, size: 10))
                                    .foregroundColor(.red)
                            }
                        }
                        
                        Button(action: {
                            viewModel.registerUser()
                        }, label: {
                            Text(StringConstants.signInButtonTitle)
                                .font(.montserrat(.bold, size: 14))
                                .foregroundColor(.buttonForegroundColor)
                        })
                        .disabled(viewModel.isSaveButtonDisabled)
                        .frame(height: 46)
                        .frame(maxWidth: .infinity)
                        .opacity(viewModel.isSaveButtonDisabled ? 0.5 : 1)
                        .background(Color.buttonBackgroundColor)
                        .cornerRadius(15)
                    
                    }
                    .padding(.leading, 44)
                    .padding(.trailing, 42)
                    
                    HStack(spacing: 0) {
                        Text(StringConstants.signInAlreadyHaveAnAccount)
                            .font(.montserrat(.bold, size: 10))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.additionalTextColor)
                            
                        NavigationLink(destination: LoginView()) {
                            Text(StringConstants.signInLoginButtonTitle)
                                .frame(width: 48)
                                .font(.montserrat(.bold, size: 10))
                                .foregroundColor(.loginButtonColor)
                        }
                        
                        Spacer()
                    }.frame(maxWidth: .infinity)
                        .padding(.leading, 42)
                        .padding(.trailing, 43)
                        .padding(.top, 18)
                        .padding(.bottom, 83)
                    
                    VStack(alignment: .center, spacing: 38) {
                        Button {
                            debugPrint("Tapped sign in with google")
                        } label: {
                            Label(StringConstants.signInSignInWithGoogleButtonTitle, image: "SignInWithGoogle")
                                .font(.montserrat(.regular, size: 12))
                                .foregroundColor(.black)
                                .labelStyle(HorizontalLabelStyle(spacing: 14))
                        }
                        
                        Button {
                            debugPrint("Tapped sign in with apple")
                        } label: {
                            Label(StringConstants.signInSignInWithAppleButtonTitle, image: "SignInWithApple")
                                .font(.montserrat(.regular, size: 12))
                                .foregroundColor(.black)
                                .labelStyle(HorizontalLabelStyle(spacing: 20))
                        }
                        
                    }
                    .padding(.leading, 99)
                    .padding(.trailing, 99)
                }
            }
            .navigationDestination(isPresented: $viewModel.isRegistered) {
                TabbarView()
            }
        }.alert(DataError.userIsRegistered.title, isPresented: $viewModel.isShowError) {
        } message: {
            Text(DataError.userIsRegistered.message)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
