import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:phrms/AdjustmentsField.dart';
import 'package:phrms/ApplicationTrackingPage.dart';
import 'package:phrms/AppraisalField.dart';
import 'package:phrms/AppreciationField.dart';
import 'package:phrms/AssessmentField.dart';
import 'package:phrms/BackgroundChecksPage.dart';
import 'package:phrms/BenefitsField.dart';
import 'package:phrms/BenefitsFieldPage.dart';
import 'package:phrms/BudgetManagementField.dart';
import 'package:phrms/CandidateIdentifyingField.dart';
import 'package:phrms/ClearanceChecklistField.dart';
import 'package:phrms/CommentsPage.dart';
import 'package:phrms/CommunicateField.dart';
import 'package:phrms/CommunicationPage.dart';
import 'package:phrms/CommunicationPageR.dart';
import 'package:phrms/CompanyPoliciesPage.dart';
import 'package:phrms/CompanyResourcesPage.dart';
import 'package:phrms/CompensationField.dart';
import 'package:phrms/CoreHRDetails.dart';
import 'package:phrms/CoreHRManagement.dart';
import 'package:phrms/CreateInvoiceField.dart';
import 'package:phrms/DataMappingField.dart';
import 'package:phrms/DataProtectionField.dart';
import 'package:phrms/DepartureField.dart';
import 'package:phrms/DocumentationField.dart';
import 'package:phrms/DocumentationPage.dart';
import 'package:phrms/ESignatureField.dart';
import 'package:phrms/EditInvoicesField.dart';
import 'package:phrms/EmergencyContactField.dart';
import 'package:phrms/EmplyoeeManagement.dart';
import 'package:phrms/EscalationField.dart';
import 'package:phrms/EvaluationField.dart';
import 'package:phrms/ExitDocumentationField.dart';
import 'package:phrms/ExitInterviewField.dart';
import 'package:phrms/ExitManagement.dart';
import 'package:phrms/ExpenseTrackingField.dart';
import 'package:phrms/FeedBackPage.dart';
import 'package:phrms/FeedbackCollectionPage.dart';
import 'package:phrms/FeedbackField.dart';
import 'package:phrms/HolidaysField.dart';
import 'package:phrms/IncidentManagementField.dart';
import 'package:phrms/IncidentReportsField.dart';
import 'package:phrms/IncomeStatementsField.dart';
import 'package:phrms/InsuranceField.dart';
import 'package:phrms/IntegrationConfigurationField.dart';
import 'package:phrms/IntegrationDashboardField.dart';
import 'package:phrms/IntegrationLogsField.dart';
import 'package:phrms/IntegrationManagement.dart';
import 'package:phrms/IntegrationTestingField.dart';
import 'package:phrms/InterviewOutcomePage.dart';
import 'package:phrms/InterviewQuestionnairesPage.dart';
import 'package:phrms/InterviewingField.dart';
import 'package:phrms/InvoiceManagement.dart';
import 'package:phrms/IssueTrackingField.dart';
import 'package:phrms/LeaveApprovalsPage.dart';
import 'package:phrms/LegalDocumentsPage.dart';
import 'package:phrms/LossofPayField.dart';
import 'package:phrms/MachineAssignmentField.dart';
import 'package:phrms/MakingOfferField.dart';
import 'package:phrms/ManageCategory.dart';
import 'package:phrms/ManageItem.dart';
import 'package:phrms/ApprovalWorkflows.dart';
import 'package:phrms/ManagerApprovalField.dart';
import 'package:phrms/ManagerApprovalFieldt.dart';
import 'package:phrms/NavBar.dart';
import 'package:phrms/NotificationPage.dart';
import 'package:phrms/OfferApprovalPage.dart';
import 'package:phrms/OfferExtensionPage.dart';
import 'package:phrms/OnBoardingField.dart';
import 'package:phrms/PaidTimeoffField.dart';
import 'package:phrms/PasswordRecoveryField.dart';
import 'package:phrms/PayrollManagement.dart';
import 'package:phrms/PaystubsField.dart';
import 'package:phrms/PerformanceManagement.dart';
import 'package:phrms/PersonalDetailsField.dart';
import 'package:phrms/ProjectAssignmentField.dart';
import 'package:phrms/RatingField.dart';
import 'package:phrms/RecruitingField.dart';
import 'package:phrms/RecruitmentManagement.dart';
import 'package:phrms/ReportingPage.dart';
import 'package:phrms/ResolutionLogsField.dart';
import 'package:phrms/ResourceAllocationField.dart';
import 'package:phrms/ResourceInventoryField.dart';
import 'package:phrms/ResourceManagement.dart';
import 'package:phrms/ResourceRequestsField.dart';
import 'package:phrms/ResourceTrackingField.dart';
import 'package:phrms/ResumeSubmissionPage.dart';
import 'package:phrms/RiskAssessmentField.dart';
import 'package:phrms/RiskManagement.dart';
import 'package:phrms/RiskMitigationField.dart';
import 'package:phrms/RoleReportingField.dart';
import 'package:phrms/SearchFilterPage.dart';
import 'package:phrms/TaxationField.dart';
import 'package:phrms/TimeSheetScreen.dart';
import 'package:phrms/TimeManagement.dart';
import 'package:phrms/TroubleManagement.dart';
import 'package:phrms/UserActivityField.dart';
import 'package:phrms/UserCreationField.dart';
import 'package:phrms/UserManagement.dart';
import 'package:phrms/UserPermissionsField.dart';
import 'package:phrms/UserRolesField.dart';
import 'package:phrms/ViewInvoiceField.dart';
import 'package:phrms/WorkAuthorizationField.dart';
import 'package:phrms/WorksiteAllocationField.dart';
import 'AdminTimesheetApprovalPage.dart';
import 'FinanceManagement.dart';
import 'HomePage.dart';
import 'RecruitmentDetails.dart';

enum Role { admin, hr, account, employee, defaultRole }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Role userRole = await getUserRole();
  runApp(MyApp(userRole: userRole));
}

Future<Role> getUserRole() async {
  User? user = FirebaseAuth.instance.currentUser;
  print(user);
  print('Is User Authenticated: ${user != null}');

  if (user != null) {
    String userUid = user.uid;
    print('User UID: $userUid');

    DocumentSnapshot userDoc =
    await FirebaseFirestore.instance.collection('users').doc(userUid).get();

    if (userDoc.exists) {
      String userRole = userDoc['Role'];
      print('User Role from Firestore: $userRole');

      switch (userRole) {
        case 'admin':
          return Role.admin;
        case 'hr':
          return Role.hr;
        case 'account':
          return Role.account;
        case 'employee':
          return Role.employee;
        default:
          return Role.defaultRole;
      }
    }
  }
  return Role.defaultRole;
}

String getRouteNameByUserRole(Role userRole) {
  switch (userRole) {
    case Role.admin:
      return '/admin';
    case Role.hr:
      return '/hr';
    case Role.account:
      return '/account';
    case Role.employee:
      return '/employee';
    default:
      return '/';
  }
}


class MyApp extends StatelessWidget {
  final Role userRole;
  const MyApp({Key? key, required this.userRole}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => UnauthorizedPage(),
        );
      },
    routes:{
      '/': (context) => LoginFirst(userRole: userRole),
      getRouteNameByUserRole(userRole): (context) {
        if (userRole == Role.admin) {
          return HomePage(userRole: Role.admin.toString());
        } else {
          return UnauthorizedPage();
        }
      },
      '/hr': (context) {
        if (userRole == Role.hr) {
          return RecruitmentManagement(userRole: Role.hr.toString());
        } else {
          return UnauthorizedPage();
        }
      },
      '/account': (context) {
        if (userRole == Role.account) {
          return PayrollManagement(userRole: Role.account.toString());
        } else {
          return UnauthorizedPage();
        }
      },
      '/employee': (context) {
        if (userRole == Role.employee) {
          return TimeManagement(userRole: Role.employee.toString());
        } else {
          return UnauthorizedPage();
        }
      },
      ManageItemScreen.id:(context)=> ManageItemScreen(),
      ManageCategories.id:(context)=> ManageCategories(),
      '/${RecruitmentManagement.id}': (context) => RecruitmentManagement(userRole: 'hr',),
      RecruitmentDetails.id:(context)=> RecruitmentDetails(),
      CandidateIdentifyingField.id:(context)=> CandidateIdentifyingField(),
      ResumeSubmissionPage.id:(context)=> ResumeSubmissionPage(),
      SearchFilterPage.id:(context)=> SearchFilterPage(),
      CommunicationPage.id:(context)=> CommunicationPage(),
      InterviewingField.id:(context)=> InterviewingField(),
      InterviewQuestionnairesPage.id:(context)=> InterviewQuestionnairesPage(),
      FeedbackCollectionPage.id:(context)=> FeedbackCollectionPage(),
      InterviewOutcomePage.id:(context)=> InterviewOutcomePage(),
      MakingOfferField.id:(context)=> MakingOfferField(),
      OfferApprovalPage.id:(context)=> OfferApprovalPage(),
      OfferExtensionPage.id:(context)=> OfferExtensionPage(),
      DocumentationPage.id:(context)=> DocumentationPage(),
      ApprovalWorkflows.id:(context)=> ApprovalWorkflows(),
      //ManagementApprovalField.id:(context)=> ManagementApprovalField(),
      '/${CoreHRManagement.id}': (context) => CoreHRManagement(),
      CoreHRDetails.id:(context)=> CoreHRDetails(),
      RecruitingField.id:(context)=> RecruitingField(),
      ApplicationTrackingPage.id:(context)=> ApplicationTrackingPage(),
      BackgroundChecksPage.id:(context)=> BackgroundChecksPage(),
      CommunicationPageR.id:(context)=> CommunicationPageR(),
      OnBoardingField.id:(context)=> OnBoardingField(),
      CompanyResourcesPage.id:(context)=> CompanyResourcesPage(),
      FeedbackPage.id:(context)=> FeedbackPage(),
      DocumentationField.id:(context)=> DocumentationField(),
      CompanyPoliciesPage.id:(context)=> CompanyPoliciesPage(),
      LegalDocumentsPage.id:(context)=> LegalDocumentsPage(),
      ESignatureField.id:(context)=> ESignatureField(),
      ManagerApprovalField.id:(context)=> ManagerApprovalField(),
      NotificationsPage.id:(context)=> NotificationsPage(),
      MachineAssignmentField.id:(context)=> MachineAssignmentField(),
      ReportingField.id:(context)=> ReportingField(),
      ProjectAssignmentField.id:(context)=> ProjectAssignmentField(),
      PersonalDetailsField.id:(context)=> PersonalDetailsField(),
      WorkAuthorizationField.id:(context)=> WorkAuthorizationField(),
      CompensationField.id:(context)=> CompensationField(),
      BenefitsFieldPage.id:(context)=> BenefitsFieldPage(),
      WorksiteAllocationField.id:(context)=> WorksiteAllocationField(),
      InsuranceField.id:(context)=> InsuranceField(),
      EmergencyContactField.id:(context)=> EmergencyContactField(),
      RoleReportingField.id:(context)=> RoleReportingField(),
      TimeSheetScreen.id:(context)=> TimeSheetScreen(),
      PaidTimeoffField.id:(context)=> PaidTimeoffField(),
      LossofPayField.id:(context)=> LossofPayField(),
      HolidaysField.id:(context)=> HolidaysField(),
      ManagerApprovalFieldt.id:(context)=> ManagerApprovalFieldt(),
      PaystubsField.id:(context)=> PaystubsField(),
      BenefitsField.id:(context)=> BenefitsField(),
      AdjustmentsField.id:(context)=> AdjustmentsField(),
      LeaveApprovalsPage.id:(context)=> LeaveApprovalsPage(),
      EvaluationField.id:(context)=> EvaluationField(),
      AssessmentField.id:(context)=> AssessmentField(),
      RatingField.id:(context)=> RatingField(),
      CommentsPage.id:(context)=> CommentsPage(),
      FeedbackField.id:(context)=> FeedbackField(),
      AppreciationField.id:(context)=> AppreciationField(),
      AppraisalField.id:(context)=> AppraisalField(),
      ExpenseTrackingField.id:(context)=> ExpenseTrackingField(),
      BudgetManagementField.id:(context)=> BudgetManagementField(),
      IncomeStatementsField.id:(context)=> IncomeStatementsField(),
      TaxationField.id:(context)=> TaxationField(),
      IncidentReportsField.id:(context)=> IncidentReportsField(),
      IssueTrackingField.id:(context)=> IssueTrackingField(),
      ResolutionLogsField.id:(context)=> ResolutionLogsField(),
      EscalationField.id:(context)=> EscalationField(),
      ResourceAllocationField.id:(context)=> ResourceAllocationField(),
      ResourceTrackingField.id:(context)=> ResourceTrackingField(),
      ResourceRequestsField.id:(context)=> ResourceRequestsField(),
      ResourceInventoryField.id:(context)=> ResourceInventoryField(),
      IntegrationConfigurationField.id:(context)=> IntegrationConfigurationField(),
      DataMappingField.id:(context)=> DataMappingField(),
      IntegrationLogsField.id:(context)=> IntegrationLogsField(),
      IntegrationTestingField.id:(context)=> IntegrationTestingField(),
      IntegrationDashboardField.id:(context)=> IntegrationDashboardField(),
      CreateInvoiceField .id:(context)=> CreateInvoiceField(),
      ViewInvoiceField .id:(context)=> ViewInvoiceField(),
      EditInvoicesField .id:(context)=> EditInvoicesField(),
      UserCreationField .id:(context)=> UserCreationField(),
      UserPermissionsField .id:(context)=> UserPermissionsField(),
      UserRolesField .id:(context)=> UserRolesField(),
      UserActivityField .id:(context)=> UserActivityField(),
      RiskAssessmentField .id:(context)=> RiskAssessmentField(),
      RiskMitigationField .id:(context)=> RiskMitigationField(),
      IncidentManagementField .id:(context)=> IncidentManagementField(),
      ExitInterviewField .id:(context)=> ExitInterviewField(),
      DepartureField .id:(context)=> DepartureField(),
      DataProtectionField .id:(context)=> DataProtectionField(),
      PasswordRecoveryField .id:(context)=> PasswordRecoveryField(),
      CommunicateField .id:(context)=> CommunicateField(),
      ClearanceChecklistField .id:(context)=> ClearanceChecklistField(),
      ExitDocumentationField .id:(context)=> ExitDocumentationField(),
      '/${EmplyoeeManagement.id}': (context) => EmplyoeeManagement(),
      '/${TimeManagement.id}': (context) => TimeManagement(userRole: 'employee',),
      AdminTimesheetApprovalPage.id: (context) => AdminTimesheetApprovalPage(),
      '/${PayrollManagement.id}': (context) => PayrollManagement(userRole: 'account',),
      '/${PerformanceManagement.id}': (context) => PerformanceManagement(),
      '/${FinanceManagement.id}': (context) => FinanceManagement(),
      '/${TroubleManagement.id}': (context) => TroubleManagement(),
      '/${ResourceManagement.id}': (context) => ResourceManagement(),
      '/${IntegrationManagement.id}': (context) => IntegrationManagement(),
      '/${InvoiceManagement.id}': (context) => InvoiceManagement(),
      '/${UserManagement.id}': (context) => UserManagement(),
      '/${RiskManagement.id}': (context) => RiskManagement(),
      '/${ExitManagement.id}': (context) => ExitManagement(),
    },
      builder: EasyLoading.init(),
    );
  }
}

class LoginFirst extends StatefulWidget {
  final Role userRole;
  const LoginFirst({Key? key, required this.userRole}) : super(key: key);

  @override
  _LoginFirstState createState() => _LoginFirstState();
}

class UnauthorizedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unauthorized Access'),
      ),
      body: Center(
        child: Text('You do not have permission to access this page.'),
      ),
    );
  }
}

class _LoginFirstState extends State<LoginFirst> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
  void _removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    String userRole = widget.userRole.toString();
    return Scaffold(
      backgroundColor: Colors.white,
      //endDrawer: Drawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: Colors.red,
        leading: Container(
          padding: EdgeInsets.only(left: 12),
          child: Image.asset('assets/images/phrmslogo.png',
              width: 42,
              height: 64,
          ),
        ),
        title: Container(
          width: 52,
          child: Row(
            children: [
              Image.asset('assets/images/microsoftteamsimage.png', width: 42), // Your existing image
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_outlined),
            iconSize: 38,
            onPressed: (){
              if (userRole != Role.admin) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Login Required!'),
                      content: Text('You need to log in as an admin to access this page.'),
                      actions: [
                        TextButton(
                          child: Text('Cancel',
                            style: TextStyle(
                            color: Colors.red, // Change the text color to red
                          ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Log In'),
                          onPressed: () {
                            // Navigate to your login page here or handle login logic
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              }
              },
          )
        ],
      ),

      body: GestureDetector(
        onTap: _removeFocus,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:15.0,right: 15.0,top: 155,bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    cursorColor: Colors.red ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email!';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                        return 'Please enter a valid email!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: _emailController.text.isNotEmpty && _formKey.currentState != null && _formKey.currentState!.validate() ? Colors.blueGrey : Colors.red),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Phone number, email or username',
                        hintText: 'Enter valid email id as abc@mjmamerica.com'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    obscureText: true,
                    enableSuggestions: true,
                    autocorrect: true,
                    cursorColor: Colors.red,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password!';
                      }
                      if (value.length <8) {
                        return 'Password must be at least 8 characters long!';
                      }
                      if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$').hasMatch(value)){
                        return 'Password must include at least one uppercase letter, '
                            'one lowercase letter, one digit, and one special character!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                  ),
                ),
                SizedBox(
                  height: 65,
                  //backgroundColor: Colors.white,
                  width: 150,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                          child: Text( 'Log in ', style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              side: const BorderSide(color: Colors.red,width: 1)
                          ),
                          onPressed: () async {
                            if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text
                                );
                                print('User UID: ${userCredential.user?.uid}');

                                // Get the user's role from Firestore
                                DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();

                                userDoc = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();

                                if (userDoc.exists) {
                                  String userRole = userDoc['Role'];
                                  print('User Role: $userRole');
                                  // Handle the user role here

                                  switch (userRole) {
                                    case 'admin':
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(userRole: 'admin')));
                                      break;
                                    case 'hr':
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RecruitmentManagement(userRole: 'hr')));
                                      break;
                                    case 'account':
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => PayrollManagement(userRole: 'account')));
                                      break;
                                    case 'employee':
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => TimeManagement(userRole: 'employee')));
                                      break;
                                    default:
                                      Navigator.pushNamed(context, '/default');
                                  }
                                  setState(() {
                                    userRole = userRole; // This line is important
                                  });
                                  _emailController.clear();
                                  _passwordController.clear();
                                  _emailFocus.unfocus();
                                  _passwordFocus.unfocus();
                                   FocusManager.instance.primaryFocus?.unfocus();
                                } else {
                                  // Handle the case where the user document does not exist
                                  print('User document does not exist');
                                  print('User document does not exist for UID: ${userCredential.user?.uid}');
                                }

                                _emailController.clear();
                                _passwordController.clear();
                                _emailFocus.unfocus();
                                _passwordFocus.unfocus();

                                } catch (e) {
                                if (e is FirebaseAuthException) {
                                  if (e.code == 'user-not-found') {
                                    print('User not found!');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('User not found! Please check the email address.'))
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    print('Password is wrong!');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Incorrect password. Please try again.'))
                                    );
                                  } else {
                                    print('Error: ${e.code}');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Authentication failed. Please try again.'))
                                    );
                                  }

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Authentication Failed! Please try again!'),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } else {
                                  print('Error: $e');
                                }
                              }
                            }
                          }
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height:45,
                ),
                Container(
                    child: Center(
                      child: Row(
                        children: [

                          const Padding(
                            padding: EdgeInsets.only(left: 53),
                            child: Text('Forgot your login details? '),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: InkWell(
                                onTap: (){
                                  print('hello');
                                },
                                child: const Text('Get help logging in.', style: TextStyle(fontSize: 14, color: Colors.red),)),
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



