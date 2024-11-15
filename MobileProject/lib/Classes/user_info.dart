import 'package:flutter/material.dart';

class UserInfo {
  // Data members
  Image profileImage;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  // Constructor
  UserInfo()
      : profileImage = Image.asset('assets/default_profile.png'),
        firstName = '',
        lastName = '',
        phoneNumber = '',
        email = '';

  UserInfo.parameterized({
    required this.profileImage,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  // Setters
  void setProfileImage(Image image) {
    profileImage = image;
  }

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setEmail(String email) {
    this.email = email;
  }

  // Getters
  Image getProfileImage() {
    return profileImage;
  }

  String getFirstName() {
    return firstName;
  }

  String getLastName() {
    return lastName;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getEmail() {
    return email;
  }
}