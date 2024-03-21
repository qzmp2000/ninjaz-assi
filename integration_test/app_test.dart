import 'package:assignment/main.dart' as ninjaz;
import 'package:assignment/ui/more.dart';
import 'package:assignment/ui/posts/posts.dart';
import 'package:assignment/ui/profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('Verify Tabs', () {
    testWidgets('Verify Posts Tabs', (tester) async{
      ninjaz.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Posts'));
      await tester.pumpAndSettle();
      expect(find.byType(PostsWidget), findsOneWidget);
    });

    testWidgets('Verify Tab 1', (tester) async{
      ninjaz.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tab 1'));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileWidget), findsOneWidget);
    });

    testWidgets('Verify Tab 2', (tester) async{
      ninjaz.main();
      await tester.pumpAndSettle();
      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();
      expect(find.byType(MoreWidget), findsOneWidget);
    });
  });
}