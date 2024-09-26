import 'package:bus_tracker_admin/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentSlide = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Carousel slider

            // CarouselSlider(
            //   options: CarouselOptions(
            //     enlargeCenterPage: true,
            //     enableInfiniteScroll: false,
            //     initialPage: 2,
            //     autoPlay: true,
            //     viewportFraction: 1,
            //     onPageChanged: (index, reason) {
            //       // setState(() {
            //       //   _currentSlide = index;
            //       // });
            //     },
            //   ),
            //   carouselController: _carouselController,
            //   items: Vehicle.vehicles
            //       .map((vehicle) => HeroCarouselWidget(vehicle: vehicle))
            //       .toList(),
            // ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryTile('Total Income', 'Rs. 5000', Icons.money),
                _buildSummaryTile(
                    'Total Expenses', 'Rs. 2000', Icons.money_off),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryTile('Routes Today', '4', Icons.route),
                _buildSummaryTile('Hires Today', '2', Icons.directions_bus),
              ],
            ),

            SizedBox(height: 24),

            // Income & Expense Overview Chart (Placeholder)
            CustomCardWidget(
              onTap: () {
                // Navigator.pushNamed(
                //     context, UpcomingAppointmentsScreen.routeName);
              },
              icon: Icons.analytics,
              heading: 'Monthly Report',
              description: 'you can view your monthy report',
            ),
            CustomCardWidget(
              onTap: () {
                // Navigator.pushNamed(
                //     context, UpcomingAppointmentsScreen.routeName);
              },
              icon: Icons.report,
              heading: 'Hire Report',
              description: 'you can view your monthy report',
            ),
            CustomCardWidget(
              onTap: () {
                // Navigator.pushNamed(
                //     context, UpcomingAppointmentsScreen.routeName);
              },
              icon: Icons.report,
              heading: 'Expense Report',
              description: 'you can view your monthy report',
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Helper function to build summary tiles
  Widget _buildSummaryTile(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 36),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

// class HeroCarouselWidget extends StatelessWidget {
//   final Vehicle vehicle;
//   const HeroCarouselWidget({Key? key, required this.vehicle}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5.0),
//       child: ClipRRect(
//         borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//         child: Stack(
//           children: <Widget>[
//             Image.file(vehicle.imageFile!, fit: BoxFit.cover, width: 1000.0),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Color.fromARGB(200, 0, 0, 0),
//                       Color.fromARGB(0, 0, 0, 0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   vehicle.vehicleModel,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
