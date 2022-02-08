const String kIConDir = 'assets/icons/';
const String kImageDir = 'assets/images/';
const String kFlagDir = 'assets/flags/';
const String kImageUrl = 'https://wetspot.akaar-it.xyz/';
const String kBaseUrl = 'https://trustcollect.qrbdl.com/api/';
const String kBase64Extend = 'data:image/jpeg;base64,';
const String kBase64ExtendVideo = 'data:video/mp4;base64,';
const String kBase64ExtendAudio = 'data:audio/mp3;base64,';

///Combined User Id to create single chatroom id
String combinedUserId(String id1, String id2) {
  return id1.compareTo(id2) > 0 ? '$id1-$id2' : '$id2-$id1';
}



// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp htmlValidatorRegExp = RegExp(r"(<[^>]*>|&\w+;)");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Your email address is not valid";
const String kPassNullError = "Please enter your password";
const String kPassNewNullError = "Please enter your New password";
const String kPassConfirmNullError = "Please enter your Confirm password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your full name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";
const String kInvalidNumberError = "Invalid phone number";
const String kMinWithdrawLimit = "Minimum withdraw limit 1 USD";


const String topicName = 'web_app';
const int timeoutRequest = 60;

///****Don't change start data***
const String kCurrency = '\$';
// Shared Key
const String theme = 'theme';
const String token = 'token';
const String userId = 'user_id';
const String userAvatar = 'user_avatar';
const String userName = 'user_name';
const String userPassword = 'user_pass';
const String userDisplayName = 'display_name';
const String userEmail = 'user_email';
const String firstName = 'first_name';
const String lastName = 'last_name';

///****Don't change end***
//Image show and hide
const bool isImageShow = true;


///Change privacy $ policy data
//create : https://app-privacy-policy-generator.firebaseapp.com/
const String kPrivacy =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
