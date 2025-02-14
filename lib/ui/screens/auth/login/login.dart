import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hope/core/assets/app_assets.dart';
import 'package:hope/core/assets/app_icons.dart';
import 'package:hope/ui/screens/auth/forgetpassword/forgetpassword.dart';
import 'package:hope/ui/screens/auth/register/register.dart';
import 'package:hope/ui/shared_widgets/custom_button.dart';
import 'package:hope/ui/shared_widgets/language_switch.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/loginScreen";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AppLocalizations appLocalizations;

  var passwordController = TextEditingController();

  bool _obscurePassword = true;

  String? _emptyFieldError;

  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // late UserProvider userProvider;
  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    // userProvider = context.userProvider;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Image.asset(
                AppAssets.login,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              buildEmailTextField(context),
              const SizedBox(height: 16),
              buildPasswordTextField(context),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ForgetpasswordScreen.routeName);
                    },
                    child: Text(appLocalizations.forgetPassword),
                  )
                ],
              ),
              const SizedBox(height: 16),
              buildLoginButton(context),
              const SizedBox(height: 16),
              buildSignUpRow(context),
              const SizedBox(height: 16),
              buildORText(context),
              const SizedBox(height: 16),
              buildGoogleSignInButton(context),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LanguageSwitch(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return TextFormField(
      controller: passwordController,
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        prefixIcon: const ImageIcon(AssetImage(AppIcons.passwordIcon)),
        hintText: appLocalizations.password,
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        errorText: _emptyFieldError,
        errorStyle: TextStyle(color: Colors.red),
      ),
    );
  }

  TextFormField buildEmailTextField(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
          prefixIcon: const ImageIcon(AssetImage(AppIcons.emailIcon)),
          hintText: appLocalizations.email),
      controller: emailController,
      validator: (email) {
        if (email == null || email.isEmpty) {
          return "Please enter email";
        }
        final bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
        if (!emailValid) {
          return "The email address is badly formatted";
        }
        return null;
      },
    );
  }

  Widget buildLoginButton(BuildContext context) {
    return CustomButton(onClick: () {}, title: appLocalizations.login);
  }

  Widget buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          appLocalizations.dontHaveAccount,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RegisterScreen.routeName);
          },
          child: Text(appLocalizations.createAccount),
        )
      ],
    );
  }

  Padding buildORText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "or",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  FilledButton buildGoogleSignInButton(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      style: FilledButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      child: Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Brand(Brands.google),
              const SizedBox(width: 8),
              Text(appLocalizations.googleLogin),
            ],
          )),
    );
  }
}
