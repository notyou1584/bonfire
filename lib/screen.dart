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
              child: Stack(
                // Use a Stack to overlay widgets
                children: [
                  _buildImageSection(),
                  _buildProfileAndQuestion(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileAndQuestion(
      BuildContext context, StrollBonfireState state) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 350), // Adjust height as needed
          _buildProfileWidget(),
          _buildQuestionSection(context, state),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image:
              AssetImage('assets/images/sunset.PNG'), // Your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Stroll Bonfire',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(200, 199, 235, 1),
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time, color: Colors.white),
                SizedBox(width: 2.0),
                Text(
                  '${DateTime.now().hour}:${DateTime.now().minute}',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
                SizedBox(width: 10.0),
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 2.0),
                Text(
                  '120',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileWidget() {
    return Positioned(
      top: 440, // Adjust top position for desired placement
      child: Container(
        padding: EdgeInsets.zero, // Padding for inner content
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border:
                    Border.all(color: Colors.black, width: 2), // Black border
                borderRadius: BorderRadius.circular(30), // Rounded corners
              ),
              padding: EdgeInsets.all(2), // Padding for the image
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/images/angelina.jpg'),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2), // Padding for text
                    child: Text(
                      'Angelina, 28',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ], // Text color
                      ),
                    ),
                  ),
                  // Add more info if needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionSection(BuildContext context, StrollBonfireState state) {
    String selectedOption = '';
    if (state is StrollBonfireOptionSelected) {
      selectedOption = state.selectedOption;
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '        What is your favorite time of the day?',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.0),
          Text(
            '        "mine is definitely peace in the morning"',
            style: TextStyle(
              color: Color.fromRGBO(174, 172, 234, 0.5),
              fontSize: 15.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 8.0),
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
                  index: 0, // 'a'
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
                  index: 1, // 'b'
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
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
                  index: 2, // 'c'
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
                  index: 3, // 'd'
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Place at the end
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pick your option', // Text beside the microphone
                      style: TextStyle(fontSize: 12)),
                  Text(
                    'See who has similar mind.', // Text beside the microphone
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(width: 75.0),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromRGBO(139, 136, 239, 1), width: 1),
                ),
                child: IconButton(
                  icon: Icon(Icons.mic_outlined,
                      color: Color.fromRGBO(139, 136, 239, 1), size: 35),
                  onPressed: () {
                    // Handle microphone tap
                  },
                ),
              ),
              SizedBox(width: 20.0),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(139, 136, 239, 1),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromRGBO(139, 136, 239, 1), width: 1),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_outlined, color: Colors.black),
                  onPressed: () {
                    // Handle arrow tap
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

class OptionButton extends StatefulWidget {
  final String label;
  final String caption;
  final bool isSelected;
  final VoidCallback onTap;
  final int index; // Add index for letter

  const OptionButton({
    super.key,
    required this.label,
    this.caption = '',
    this.isSelected = false,
    required this.onTap,
    required this.index, // Pass the index
  });

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  @override
  Widget build(BuildContext context) {
    double fontSize = 16.0;
    if (widget.label.length > 10) {
      fontSize = 14.0;
    }
    if (widget.label.length > 15) {
      fontSize = 12.0;
    }
    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        elevation: 4.0, // Set the desired elevation here
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey[850],
            border: Border.all(
              color: widget.isSelected
                  ? const Color.fromRGBO(139, 136, 239, 1)
                  : const Color.fromRGBO(139, 136, 239, 0),
              width: widget.isSelected ? 2.0 : 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Container(
                width: 30.0,
                height: 30.0,
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.isSelected
                        ? const Color.fromRGBO(139, 136, 239, 1)
                        : Colors.grey,
                    width: widget.isSelected ? 2.0 : 1.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    String.fromCharCode(widget.index + 65),
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
