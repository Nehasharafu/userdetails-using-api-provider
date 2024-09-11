
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list2/provider.dart';
import 'user_provider.dart';
import 'model_class.dart';
import 'output_page.dart'; 


class UserFormScreen extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextField(userIdController, 'User ID'),
              _buildTextField(idController, 'ID'),
              _buildTextField(titleController, 'Title'),
              _buildTextField(bodyController, 'Body'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await Provider.of<UserProvider>(context, listen: false).createUser(
                      titleController.text,
                      bodyController.text,
                      idController.text,
                      userIdController.text,
                    );
                    final postingData = Provider.of<UserProvider>(context, listen: false).postingData;
                    if (postingData != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OutputPage(postingData: postingData),
                        ),
                      );
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $error')),
                    );
                  }
                },
                child: Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
