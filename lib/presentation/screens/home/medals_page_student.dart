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
              return Center(child: Text('لم يتم تحقيق أي أوسمة.'));
            } else if (state is MedalsError) {
              return Center(child: Text(state.message));
            } else if (state is MedalsLoaded) {
              return ListView.builder(
                itemCount: state.medals.length,
                itemBuilder: (context, index) {
                  final medal = state.medals[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Stack(
                        children: [
                          Image.network(medal.imageUrl, width: 50, height: 50),
                          if (medal.count > 1)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                        ],
                      ),
                      title: Text(medal.title),
                      subtitle: Text(medal.description),
                      trailing:
                          medal.count > 1
                              ? Text(
                                'x${medal.count}',
                                style: TextStyle(color: Colors.amber),
                              )
                              : null,
                    ),
                  );
                },
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
