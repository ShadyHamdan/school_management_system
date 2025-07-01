import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/home_student/Medal/Medal_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/Medal/Medal_state.dart';

class MedalsPage extends StatelessWidget {
  final int studentId;
  const MedalsPage({required this.studentId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MedalsCubit()..fetchMedals(studentId),
      child: Scaffold(
        body: BlocBuilder<MedalsCubit, MedalsState>(
          builder: (context, state) {
            if (state is MedalsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MedalsEmpty) {
              return Center(
                child: Text(
                  'لم يتم تحقيق أي أوسمة.',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else if (state is MedalsError) {
              return Center(
                child: Text(state.message, style: TextStyle(color: Colors.red)),
              );
            } else if (state is MedalsLoaded) {
              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: state.medals.length,
                itemBuilder: (context, index) {
                  final medal = state.medals[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.network(medal.imageUrl, width: 50, height: 50),
                          if (medal.count > 1)
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.amber,
                              child: Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                        ],
                      ),
                      title: Text(
                        medal.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(medal.description),
                      trailing:
                          medal.count > 1
                              ? Text(
                                'x${medal.count}',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              : null,
                    ),
                  );
                },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
