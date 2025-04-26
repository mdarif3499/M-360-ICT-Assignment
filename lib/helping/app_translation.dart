import 'package:get/get.dart';

import 'appStringFile.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {
        'en_US': {
          AppStringKey.login: 'Login',
          AppStringKey.password: 'Password',
          AppStringKey.logout: 'Log out',
          AppStringKey.edit_profile: 'Edit Profile',
          AppStringKey.user_name: 'User Name',
          AppStringKey.name: 'Name',
          AppStringKey.add_your_photo: 'Add Your Photo',
          AppStringKey.action_login: 'Login',
          AppStringKey.email: 'Email',
          AppStringKey.phone_number: 'Phone Number',
          AppStringKey.mobile_number: 'Mobile Number',
          AppStringKey.title: 'Title',
          AppStringKey.home: 'Home',

          AppStringKey.submit: 'Submit',
          AppStringKey.choose_option: 'Choose Option',
          AppStringKey.from_gallery: 'From Gallery',
          AppStringKey.from_camera: 'From Camera',

        },
        'bn_BD': {
          AppStringKey.registration: 'নিবন্ধন',
          AppStringKey.login: 'লগইন',
          AppStringKey.password: 'পাসওয়ার্ড',
          AppStringKey.logout: 'লগ আউট',
          AppStringKey.edit_profile: 'এডিট প্রোফাইল',
          AppStringKey.user_name: 'ইউজার নেম',
          AppStringKey.name: 'নাম',
          AppStringKey.email: 'ই-মেইল',
          AppStringKey.phone_number: 'মোবাইল নাম্বার',
          AppStringKey.mobile_number: 'মোবাইল নম্বর',
          AppStringKey.registration: 'রেজিস্ট্রেশন',
        },
      };
}
