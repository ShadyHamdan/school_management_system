import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/settings_student/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('الإعدادات')),
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final cubit = context.read<SettingsCubit>();

            return ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '⚙️ إعدادات الحساب',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('تغيير كلمة المرور'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const ListTile(
                  leading: Icon(Icons.email),
                  title: Text('تغيير البريد الإلكتروني'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text('تفعيل التحقق بخطوتين'),
                  trailing: Icon(Icons.toggle_on),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '🌐 إعدادات اللغة والثيم',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: const Text('اختيار اللغة'),
                  trailing: DropdownButton<String>(
                    value: state.language,
                    items: const [
                      DropdownMenuItem(
                        value: 'العربية',
                        child: Text('العربية'),
                      ),
                      DropdownMenuItem(
                        value: 'English',
                        child: Text('English'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) cubit.changeLanguage(value);
                    },
                  ),
                ),
                SwitchListTile(
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('الوضع الليلي'),
                  value: state.isDarkMode,
                  onChanged: cubit.toggleDarkMode,
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '🔔 إشعارات التطبيق',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SwitchListTile(
                  secondary: const Icon(Icons.notifications),
                  title: const Text('تفعيل الإشعارات'),
                  value: state.notificationsEnabled,
                  onChanged: cubit.toggleNotifications,
                ),
                const ListTile(
                  leading: Icon(Icons.tune),
                  title: Text('نوع الإشعارات'),
                  subtitle: Text('درجات، ملاحظات، رحلات...'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'ℹ️ معلومات عامة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('حول التطبيق'),
                ),
                const ListTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('سياسة الخصوصية'),
                ),
                const ListTile(
                  leading: Icon(Icons.rule),
                  title: Text('شروط الاستخدام'),
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    '🚨 أزرار مهمة',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: Text(
                    'تسجيل الخروج',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.delete_forever, color: Colors.red),
                  title: Text(
                    'حذف الحساب',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.support_agent),
                  title: Text('التواصل مع الدعم الفني'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
