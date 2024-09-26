import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingCalendarScreen extends StatefulWidget {
  static const routeName = 'add_booking_screen';
  @override
  _BookingCalendarScreenState createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // Sample bookings for demo
  Map<DateTime, List<String>> _bookings = {
    DateTime(2024, 9, 29): ['Hire - Rs. 300'],
    DateTime(2024, 9, 30): ['Route - Rs. 200', 'Hire - Rs. 500'],
  };

  List<String> _getBookingsForDay(DateTime day) {
    return _bookings[day] ?? [];
  }

  void _addBooking(String bookingType) {
    setState(() {
      if (_bookings[_selectedDay] != null) {
        _bookings[_selectedDay]!.add(bookingType);
      } else {
        _bookings[_selectedDay] = [bookingType];
      }
    });
  }

  void _showAddBookingDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Booking'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.money_rounded),
                title: Text('Hire Booking'),
                onTap: () {
                  Navigator.pop(context);
                  _addBooking('Hire Booking');
                },
              ),
              ListTile(
                leading: Icon(Icons.route),
                title: Text('Route Booking'),
                onTap: () {
                  Navigator.pop(context);
                  _addBooking('Route Booking');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings Calendar'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookingDialog,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueGrey[300],
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueGrey[700],
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                color: Colors.white,
              ),
              weekendDecoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.blueGrey),
              rightChevronIcon:
                  Icon(Icons.chevron_right, color: Colors.blueGrey),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: _getBookingsForDay(_selectedDay).isEmpty
                ? Center(
                    child: Text(
                      'No bookings for this day',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _getBookingsForDay(_selectedDay).length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: ListTile(
                          title: Text(
                            _getBookingsForDay(_selectedDay)[index],
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios,
                              color: Colors.blueGrey),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
