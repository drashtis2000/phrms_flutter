import 'package:flutter/material.dart';
import 'package:phrms/ManageCategory.dart';
import 'package:phrms/PayrollManagement.dart';
import 'package:phrms/RecruitmentManagement.dart';
import 'package:phrms/TimeManagement.dart';
import 'HomePage.dart';
import 'RoleModel.dart';

class NavBar extends StatelessWidget {
  final String userRole;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

   NavBar({
     required this.userRole,
     required this.emailController,
     required this.passwordController,
     required this.emailFocus,
     required this.passwordFocus,
   });

  final Map<String, Widget> roleDestinations = {
    Role.admin: HomePage(userRole: 'admin',),
    Role.hr: RecruitmentManagement(userRole: 'hr',),
    Role.account: PayrollManagement(userRole: 'account',),
    Role.employee: TimeManagement(userRole: 'employee',),
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: const Text('MJM America'), accountEmail: const Text('salomon@mjmamerica.com'),
            currentAccountPicture: Center(
              child: Image.asset('assets/images/phrmslogo.png', fit: BoxFit.fill),
            ),
            decoration: const BoxDecoration(
              color: Colors.redAccent,
              // image: DecorationImage(image: AssetImage('assets/images/lightbluehr.jpg'), fit: BoxFit.cover)
            ),
          ),

          ListTile(
            leading: const Icon(Icons.file_upload),
            
            title: const Text('Upload'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ManageCategories()));
              emailFocus.unfocus();
              passwordFocus.unfocus();
              emailController.clear();
              passwordController.clear();
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Admin'),
            onTap: (){
              switch (userRole) {
                case Role.admin:
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => roleDestinations[userRole]!));
                  break;
                default:
                // Handle unknown role or error
                  break;
              }
              emailFocus.unfocus();
              passwordFocus.unfocus();
              emailController.clear();
              passwordController.clear();
              },
          ),
          ListTile(
            leading: const Icon(Icons.how_to_reg_sharp),
            title: const Text('HR'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => roleDestinations[userRole]!));
              emailFocus.unfocus();
              passwordFocus.unfocus();
              emailController.clear();
              passwordController.clear();
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text('Account'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => roleDestinations[userRole]!));
              emailFocus.unfocus();
              passwordFocus.unfocus();
              emailController.clear();
              passwordController.clear();
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Emplyoee'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => roleDestinations[userRole]!));
              emailFocus.unfocus();
              passwordFocus.unfocus();
              emailController.clear();
              passwordController.clear();
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () => print('Open your messages here!'),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () => print('Share your application here!'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('Notification'),
            onTap: () => print('Check your notification here!'),
            trailing: ClipOval(
              child: Container(
                  color: Colors.red,
                  width: 20, height: 20,
                  child: const Center(
                    child: Text('8', style: TextStyle(color: Colors.white,
                        fontSize: 12),
                    ),
                  )
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.add_call),
            title: const Text('Contact'),
            onTap: () => print('You can contact here'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print('Go to the setting page!'),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policies'),
            onTap: () => print('It is a comapanies policy'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () => print('Bye Bye!'),
          ),
          ListTile(
            leading: const Icon(Icons.question_mark),
            title: const Text('about and help'),
            onTap: () => print('How can I help you!!'),
          ),
        ],
      ),
    );
  }
}
