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
      : profileImage = Image.asset('assets/temporary/profile_picture.png'),
        firstName = 'John',
        lastName = 'Doe',
        phoneNumber = '(629) 555 - 0129',
        email = 'john.doe@gmail.com';

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
  // TODO: will link to 'Edit Profile' page
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