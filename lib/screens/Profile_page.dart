
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/pic.jpg'), // Replace with your profile picture asset
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Ashu Patel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'ashupatelofficial@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            _buildProfileInfoCard(
              title: 'Location',
              value: 'Patna, Bihar',
              icon: Icons.location_on,
            ),
            _buildProfileInfoCard(
              title: 'Phone',
              value: '+91 7645990825',
              icon: Icons.phone,
            ),
            _buildProfileInfoCard(
              title: 'Date of Birth',
              value: 'November 18, 2000',
              icon: Icons.date_range,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Add action here
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Add action here
              },
              icon: const Icon(Icons.logout,color: Colors.white,),
              label: const Text('Logout',style:TextStyle(color:Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 19, 40, 205),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoCard({required String title, required String value, required IconData icon}) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          value,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}

