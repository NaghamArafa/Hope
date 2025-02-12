import 'package:flutter/material.dart';
import 'package:hope/core/assets/app_assets.dart';
import 'package:hope/core/assets/app_icons.dart';
import 'package:hope/core/theme/app_colors.dart';
import 'package:hope/ui/shared_widgets/custom_check_field.dart';
import 'package:hope/ui/shared_widgets/custom_lable.dart';
import 'package:icons_plus/icons_plus.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  //late AppLocalizations appLocalizations;

  DateTime selectedDate = DateTime.now();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();

  bool smoke = false;
  bool hadCancer = false;
  bool familyCancer = false;

  String? _cancerType;
  final List<String> _cancerTypes = [
    'Liver',
    'Breast',
    'Prostate',
    'Skin',
    'Lymphoma'
  ];

  //late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    // appLocalizations = AppLocalizations.of(context)!;
    // userProvider = context.userProvider;
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Image.asset(
              AppAssets.register,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            CustomLabel(
                controller: nameController,
                hint: "username",
                prefixIcon: ImageIcon(
                  AssetImage(AppIcons.emailIcon),
                )),
            const SizedBox(height: 16),
            CustomLabel(
              controller: emailController,
              hint: "email",
              prefixIcon: ImageIcon(AssetImage(AppIcons.emailIcon)),
            ),
            const SizedBox(height: 16),
            CustomLabel(
              controller: phoneController,
              hint: "phone",
              prefixIcon: ImageIcon(AssetImage(AppIcons.phoneIcon)),
            ),
            const SizedBox(height: 16),
            InkWell(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage(AppIcons.calenderIcon),
                          color: AppColors.gray,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          "${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}",
                          style: TextStyle(color: AppColors.gray),
                        )
                      ],
                    )),
                onTap: () async {
                  var selectedTime = (await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2026))) ??
                      selectedDate;
                  setState(() {});
                }),
            const SizedBox(height: 16),
            CustomLabel(
              controller: passwordController,
              hint: "password",
              suffixIcon: const Icon(EvaIcons.eye),
              prefixIcon: ImageIcon(AssetImage(AppIcons.passwordIcon)),
            ),
            const SizedBox(height: 16),
            CustomLabel(
              controller: repasswordController,
              hint: "confirm password",
              suffixIcon: const Icon(EvaIcons.eye),
              prefixIcon: ImageIcon(AssetImage(AppIcons.passwordIcon)),
            ),
            const SizedBox(height: 16),
            CustomCheckField(isChecked: smoke, labelText: "Are you smoking ?"),
            const SizedBox(height: 16),
            CustomCheckField(
                isChecked: hadCancer,
                labelText: "Have you had cancer ?",
                onChanged: (value) {
                  setState(() {
                    hadCancer = value;
                  });
                }),
            const SizedBox(height: 16),
            if (hadCancer)
              DropdownButtonFormField<String>(
                value: _cancerType,
                items: _cancerTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _cancerType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'What type of cancer?',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the type of cancer';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 16),
            CustomCheckField(
                isChecked: familyCancer,
                labelText: "Has anyone in your family had cancer ? ",
                onChanged: (value) {
                  setState(() {
                    familyCancer = value;
                  });
                }),
            const SizedBox(height: 16),
            if (familyCancer)
              DropdownButtonFormField<String>(
                value: _cancerType,
                items: _cancerTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _cancerType = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'What type of cancer?',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select the type of cancer';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 32),
            buildRegisterButton(context),
            buildSignInTextRow(context)
          ],
        ),
      ),
    );
  }

  FilledButton buildRegisterButton(BuildContext context) => FilledButton(
      onPressed: () {}
      //async {
      //   try {
      //     showLoading(context);
      //     final userCredentials =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //       email: emailController.text,
      //       password: passwordController.text,
      //     );
      //     UserDM newUser = UserDM(
      //         id: userCredentials.user!.uid,
      //         name: nameController.text,
      //         email: emailController.text);
      //     await createUserInFirestore(newUser);
      //     userProvider
      //         .updateCurrentUser(await getUserFromFirestore(newUser.id));
      //     hideLoading(context);
      //   } on FirebaseAuthException catch (e) {
      //     hideLoading(context);
      //     String message = "Something went wrong please try again later";
      //     if (e.code == 'weak-password') {
      //       message = "The password provided is too weak.";
      //     } else if (e.code == 'email-already-in-use') {
      //       message = "The account already exists for that email.";
      //     } else {
      //       message = e.message ?? message;
      //     }
      //     showMessage(context, message, posButtonTitle: "ok", title: "Error");
      //   }
      //   // catch (e) {
      //   //   print(e);
      //   //   hideLoading(context);
      //   //   showMessage(context, e.toString(), posButtonTitle: "ok", title: "Error");
      //   // }
      // }
      ,
      child: Text("Create an Account"));

  Row buildSignInTextRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an Account?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Login"),
        )
      ],
    );
  }
}
