import 'package:express_corner/Features/user/home%20page/presentation/widgets/restaurant_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:express_corner/Features/user/home page/presentation/views/home_page_view.dart';

void main() {
  testWidgets('HomePageView Widget Test', (WidgetTester tester) async {
    // Build the HomePageView widget
    await tester.pumpWidget(MaterialApp(home: HomePageView()));

    // Verify that the title texts are found
    expect(find.text('المطاعم القريبة منك'), findsOneWidget);
    expect(find.text('الصيدليات القريبة منك'), findsOneWidget);

    // Verify that the RestaurantListView widget is found
    expect(find.byType(RestaurantListView), findsOneWidget);

    // Uncomment the following line when you uncomment the PharmaciesListView in your widget
    // expect(find.byType(PharmaciesListView), findsOneWidget);
  });
}
