import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:phrms/CoreHRManagement.dart';
import 'package:phrms/DashBoard.dart';
import 'package:phrms/EmplyoeeManagement.dart';
import 'package:phrms/ExitManagement.dart';
import 'package:phrms/IntegrationManagement.dart';
import 'package:phrms/InvoiceManagement.dart';
import 'package:phrms/ManageCategory.dart';
import 'package:phrms/ManageItem.dart';
import 'package:phrms/PayrollManagement.dart';
import 'package:phrms/PerformanceManagement.dart';
import 'package:phrms/ResourceManagement.dart';
import 'package:phrms/RiskManagement.dart';
import 'package:phrms/RoleModel.dart';
import 'package:phrms/TimeManagement.dart';
import 'package:phrms/TroubleManagement.dart';
import 'package:phrms/UserManagement.dart';
import 'FinanceManagement.dart';
import 'RecruitmentManagement.dart';

class HomePage extends StatefulWidget {
  static const String id = "Home-Page";

  final String userRole;
  const HomePage({Key? key, required this.userRole}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget _selectedScreen = DashBoardScreen();

  void currentScreen(item){
    switch(item.route) {
      case DashBoardScreen.id :
        setState(() {
          _selectedScreen = DashBoardScreen();
        });
        break;
      case RecruitmentManagement.id:
        setState(() {
          _selectedScreen = RecruitmentManagement(userRole: Role.hr);
          Navigator.pushNamed(context, '/${RecruitmentManagement.id}');
        });
        break;
      case CoreHRManagement.id:
        setState(() {
          _selectedScreen = CoreHRManagement();
          Navigator.pushNamed(context, '/${CoreHRManagement.id}');
        });
        break;
      case EmplyoeeManagement.id:
        setState(() {
          _selectedScreen = EmplyoeeManagement();
          Navigator.pushNamed(context, '/${EmplyoeeManagement.id}');
        });
        break;
      case TimeManagement.id:
        setState(() {
          _selectedScreen = TimeManagement(userRole: Role.employee,);
          Navigator.pushNamed(context, '/${TimeManagement.id}');
        });
        break;
      case PayrollManagement.id:
        setState(() {
          _selectedScreen = PayrollManagement(userRole: Role.account,);
          Navigator.pushNamed(context, '/${PayrollManagement.id}');
        });
        break;
      case PerformanceManagement.id:
        setState(() {
          _selectedScreen = PerformanceManagement();
          Navigator.pushNamed(context, '/${PerformanceManagement.id}');
        });
        break;
      case FinanceManagement.id:
        setState(() {
          _selectedScreen = FinanceManagement();
          Navigator.pushNamed(context, '/${FinanceManagement.id}');
        });
        break;
      case TroubleManagement.id:
        setState(() {
          _selectedScreen = TroubleManagement();
          Navigator.pushNamed(context, '/${TroubleManagement.id}');
        });
        break;
      case ResourceManagement.id:
        setState(() {
          _selectedScreen = ResourceManagement();
          Navigator.pushNamed(context, '/${ResourceManagement.id}');
        });
        break;
      case IntegrationManagement.id:
        setState(() {
          _selectedScreen = IntegrationManagement();
          Navigator.pushNamed(context, '/${IntegrationManagement.id}');
        });
        break;
      case InvoiceManagement.id:
        setState(() {
          _selectedScreen = InvoiceManagement();
          Navigator.pushNamed(context, '/${InvoiceManagement.id}');
        });
        break;
      case UserManagement.id:
        setState(() {
          _selectedScreen = UserManagement();
          Navigator.pushNamed(context, '/${UserManagement.id}');
        });
        break;
      case RiskManagement.id:
        setState(() {
          _selectedScreen = RiskManagement();
          Navigator.pushNamed(context, '/${RiskManagement.id}');
        });
        break;
      case ExitManagement.id:
        setState(() {
          _selectedScreen = ExitManagement();
          Navigator.pushNamed(context, '/${ExitManagement.id}');
        });
        break;
      case ManageCategories.id :
        setState(() {
          _selectedScreen = ManageCategories();
        });
        break;
      case ManageItemScreen.id :
        setState(() {
          _selectedScreen = ManageItemScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.red, // Change the primary color here
      ),
      child: AdminScaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 20,
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/microsoftteamsimage.png',width: 40),
              SizedBox(width: 20),
              Text('Admin Panel',style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
        sideBar: SideBar(
          items: [
            AdminMenuItem(
              title: 'Dashboard',
              route: DashBoardScreen.id,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Recruitment Management',
              route: RecruitmentManagement.id,
              icon: Icons.how_to_reg,
            ),
            AdminMenuItem(
              title: 'Core HR Management',
              route: CoreHRManagement.id,
              icon: Icons.handshake_rounded,
            ),
            AdminMenuItem(
              title: 'Emplyoee Management',
              route: EmplyoeeManagement.id,
              icon: Icons.emoji_people_outlined,
            ),
            AdminMenuItem(
              title: 'Time Management',
              route: TimeManagement.id,
              icon: Icons.timer_sharp,
            ),
            AdminMenuItem(
              title: 'Payroll Management',
              route: PayrollManagement.id,
              icon: Icons.payments,
            ),
            AdminMenuItem(
              title: 'Performance Management',
              route: PerformanceManagement.id,
              icon: Icons.volunteer_activism,
            ),
            AdminMenuItem(
              title: 'Finance Management',
              route: FinanceManagement.id,
              icon: Icons.payment,
            ),
            AdminMenuItem(
              title: 'Trouble Management',
              route: TroubleManagement.id,
              icon: Icons.troubleshoot,
            ),
            AdminMenuItem(
              title: 'Resource Management',
              route: ResourceManagement.id,
              icon: Icons.storage_sharp,
            ),
            AdminMenuItem(
              title: 'Integration Management',
              route: IntegrationManagement.id,
              icon: Icons.integration_instructions,
            ),
            AdminMenuItem(
              title: 'Invoice Management',
              route: InvoiceManagement.id,
              icon: Icons.pages,
            ),
            AdminMenuItem(
              title: 'User Management',
              route: UserManagement.id,
              icon: Icons.verified_user,
            ),
            AdminMenuItem(
              title: 'Risk Management',
              route: RiskManagement.id,
              icon: Icons.dangerous,
            ),
            AdminMenuItem(
              title: 'Exit Management',
              route: ExitManagement.id,
              icon: Icons.exit_to_app,
            ),
            AdminMenuItem(
              title: 'Manage Category',
              route: ManageCategories.id,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Manage Item',
              route: ManageItemScreen.id,
              icon: Icons.pages_rounded,
            ),
          ],
          selectedRoute: HomePage.id,
          onSelected: (item)
          {
            currentScreen(item);
            // if (item.route != null) {
            //   Navigator.of(context).pushNamed(item.route!);
          //  }
          },
          header: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'footer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: _selectedScreen,
        ),
      ),
    );
  }
}