import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hope/core/assets/app_assets.dart';
import 'package:hope/ui/screens/auth/login/login.dart';

class ResetpasswordScreen extends StatefulWidget {
  static const String routeName = "/resetpasswordScreen";

  ResetpasswordScreen({super.key});

  @override
  _ResetpasswordScreenState createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
  late AppLocalizations appLocalizations;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  String? _passwordMatchError;
  String? _emptyFieldError;

  String? _validatePasswords() {
    String newPassword = _newPasswordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      return appLocalizations.pleaseFillOutBothFields;
    } else if (newPassword != confirmPassword) {
      setState(() {
        _passwordMatchError = appLocalizations.passwordsDoNotMatch;
      });
      return null;
    }
    setState(() {
      _passwordMatchError = null;
    });
    return null;
  }

  String? _validateEmptyFields() {
    if (_newPasswordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      setState(() {
        _emptyFieldError = appLocalizations.pleaseFillOutBothFields;
      });
      return null;
    }
    setState(() {
      _emptyFieldError = null;
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.resetPassword),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.resetPassword,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Text(
              appLocalizations.enterNewPass,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            // New Password Field
            TextFormField(
              controller: _newPasswordController,
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _obscureNewPassword,
              // Toggle password visibility
              decoration: InputDecoration(
                hintText: appLocalizations.newPass,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureNewPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
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
                // Error message if empty
                errorStyle: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _confirmPasswordController,
              style: Theme.of(context).textTheme.bodyLarge,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                hintText: appLocalizations.confirmNewPass,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        _passwordMatchError != null || _emptyFieldError != null
                            ? Colors.red
                            : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        _passwordMatchError != null || _emptyFieldError != null
                            ? Colors.red
                            : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorText: _passwordMatchError ?? _emptyFieldError,
                errorStyle: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                _validateEmptyFields(); // Validate if fields are filled
                _validatePasswords(); // Validate password match
                if (_emptyFieldError == null && _passwordMatchError == null) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PasswordResetDialog();
                    },
                  );
                }
              },
              child: Text(appLocalizations.reset),
            ),
          ],
        ),
      ),
    );
  }
}

// Password reset dialog widget
class PasswordResetDialog extends StatelessWidget {
  late AppLocalizations appLocalizations;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.lock_outline, size: 60, color: Color(0xff8E56FF)),
            const SizedBox(height: 20),
            Text(
              appLocalizations.yourPasswordHasBeenReset,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text(appLocalizations.done),
              style: FilledButton.styleFrom(
                backgroundColor: Color(0xff8E56FF),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
