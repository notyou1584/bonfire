// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bonfire_cubit.dart';

class StrollBonfireScreen extends StatelessWidget {
  const StrollBonfireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: StrollBonfireCubit(),
      child: Scaffold(
        body: BlocBuilder<StrollBonfireCubit, StrollBonfireState>(
          builder: (context, state) {
            return SingleChildScrollView(
              // Added here!
              child: Column(
                children: [
                  // Add the image and time/location information
                  _buildImageSection(),
                  // Add the question and options
                  _buildQuestionSection(context, state),
                  // Add the bottom bar
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/sunset.PNG'), // Your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stroll Bonfire',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust text color for visibility
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, color: Colors.white),
                SizedBox(width: 10.0),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context, StrollBonfireState state) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width: 8.0),
              Text(
                'Angelina,28',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'What is your favorite time of the day?',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: OptionButton(
                  label: 'The peace in the early mornings',
                  isSelected: state is StrollBonfireOptionSelected &&
                      state.selectedOption == 'The peace in the early mornings',
                  onTap: () {
                    context
                        .read<StrollBonfireCubit>()
                        .selectOption('The peace in the early mornings');
                  },
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: OptionButton(
                  label: 'The magical golden hours',
                  isSelected: state is StrollBonfireOptionSelected &&
                      state.selectedOption == 'The magical golden hours',
                  onTap: () {
                    context
                        .read<StrollBonfireCubit>()
                        .selectOption('The magical golden hours');
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: OptionButton(
                  label: 'Wind-down time after dinners',
                  isSelected: state is StrollBonfireOptionSelected &&
                      state.selectedOption == 'Wind-down time after dinners',
                  onTap: () {
                    context
                        .read<StrollBonfireCubit>()
                        .selectOption('Wind-down time after dinners');
                  },
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: OptionButton(
                  label: 'The serenity past midnight',
                  isSelected: state is StrollBonfireOptionSelected &&
                      state.selectedOption == 'The serenity past midnight',
                  onTap: () {
                    context
                        .read<StrollBonfireCubit>()
                        .selectOption('The serenity past midnight');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String label;
  final String caption;
  final bool isSelected;
  final VoidCallback onTap;

  // ignore: use_key_in_widget_constructors
  const OptionButton({
    required this.label,
    this.caption = '',
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: ListTile(
          title: Text(label),
          subtitle: caption.isNotEmpty ? Text(caption) : null,
        ),
      ),
    );
  }
}
