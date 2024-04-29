import 'package:busha_assessment/core/utils/exports.dart';
import 'package:busha_assessment/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<Asset> exploreAssets = [];
  List<Asset> exploreTodaysTopMovers = [];

  /// Enters the email and password credentials
  Future<void> enterCredentials(WidgetTester tester, String email, String password) async {
    // Verify that the email and password fields are displayed and functional
    await tester.enterText(find.byKey(const Key('emailAddressTextField')), email);
    await tester.enterText(find.byKey(const Key('passwordTextField')), password);
    await tester.pumpAndSettle();
  }

  /// Runs the app before login
  Future<void> runTheAppBeforeLogin(WidgetTester tester) async {
    // Run the Flutter app
    app.main();
    await tester.pumpAndSettle();

    // Wait for the splash view animation to complete
    await tester.pump(const Duration(seconds: 3));
    expect(find.byType(Material), findsOneWidget);
    await tester.pumpAndSettle();
  }

  /// Logs in the user
  Future<void> loggingIn(WidgetTester tester) async {
    await runTheAppBeforeLogin(tester);
    // Verify that navigation to login view occurred after the splash view
    expect(find.byType(LoginView), findsOneWidget);
    await tester.pumpAndSettle();

    await enterCredentials(tester, 'test@gmail.com', 'password');

    // Verify that the password field is initially obscured and the show/hide password button is displayed and functional
    expect(find.text('SHOW'), findsOneWidget);
    expect(find.text('HIDE'), findsNothing);
    // Verify that the show/hide password button toggles the visibility of the password field
    await tester.tap(find.byTooltip('Show password'));
    await tester.pumpAndSettle();
    // Verify that the password field is now visible
    expect(find.text('HIDE'), findsOneWidget);
    await tester.tap(find.byTooltip('Hide password'));
    await tester.pumpAndSettle();
    // Verify that the password field is now obscured
    expect(find.text('SHOW'), findsOneWidget);

    // Verify that the forgot password button is displayed and functional
    await tester.tap(find.byTooltip('Forgot password?'));
    await tester.pumpAndSettle();

    // Verify that the sign up button is displayed
    expect(find.textContaining('Don\'t have an account? Sign up', findRichText: true), findsOneWidget);
    await tester.pumpAndSettle();
    // Verify that the continue button is displayed and functional
    await tester.tap(find.byTooltip('Continue button'));
    await tester.pumpAndSettle();
  }

  /// Verifies the balance card
  Future<void> verifyBalanceCard(WidgetTester tester) async {
    // Verify that the balance is displayed
    expect(find.textContaining('\u20A6${NumberFormat('#,###').format(5000)}', findRichText: true), findsOneWidget);

    // Verify that the balance can be hidden
    await tester.tap(find.byTooltip('Hide balance'));
    await tester.pumpAndSettle();
    expect(find.textContaining('\u20A6${NumberFormat('#,###').format(5000)}', findRichText: true), findsNothing);
    expect(find.text('******'), findsOneWidget);

    // Verify that the balance can be shown
    await tester.tap(find.byTooltip('Show balance'));
    await tester.pumpAndSettle();
    expect(find.textContaining('\u20A6${NumberFormat('#,###').format(5000)}', findRichText: true), findsOneWidget);
    expect(find.text('******'), findsNothing);
  }

  /// Verifies the my assets card
  Future<void> verifyMyAssetsCard(WidgetTester tester) async {
    Asset currentAsset = exploreAssets[1];

    // Verify that explore's my assets are displayed
    expect(find.byKey(ValueKey(currentAsset.symbol)), findsOne);

    //  Verify that you can tap on an asset
    await tester.tap(find.byKey(ValueKey(currentAsset.symbol)));
    await tester.pumpAndSettle();

    if (currentAsset.symbol == 'BTC') {
      expect(find.byType(BtcTransactionsView), findsOneWidget);
    } else if (currentAsset.symbol == 'XTZ') {
      expect(find.byType(TezosBlocksView), findsOneWidget);
    }
  }

  /// Verifies the today's top movers card
  Future<void> verifyTodaysTopMoversCard(WidgetTester tester) async {
    Asset currentTodayTopMover = exploreTodaysTopMovers[0];

    // Verify that today's top movers are displayed
    expect(find.byKey(ValueKey(currentTodayTopMover.symbol)), findsOne);

    //  Verify that you can tap on an asset
    await tester.tap(find.byKey(ValueKey(currentTodayTopMover.symbol)));
    await tester.pumpAndSettle();

    if (currentTodayTopMover.symbol == 'BTC') {
      expect(find.byType(BtcTransactionsView), findsOneWidget);
    } else if (currentTodayTopMover.symbol == 'XTZ') {
      expect(find.byType(TezosBlocksView), findsOneWidget);
    }

    // Verify you can scroll horizontally
    await tester.fling(find.byType(ExploreTodaysTopMoversCard), const Offset(-300, 0), 3000);
  }

  group(
    'Busha assessment tests',
    () {
      setUpAll(() {
        final ProviderContainer container = ProviderContainer();
        exploreAssets.addAll(container.read(assetsProvider.notifier).state);
        exploreTodaysTopMovers.addAll(container.read(todayTopMoversProvider.notifier).state);
      });

      // Testing the splash view
      testWidgets('Splash view integration test', (WidgetTester tester) async {
        // Run the Flutter app
        app.main();
        // Ensure that Flutter app is rendered
        await tester.pumpAndSettle();

        // Verify that the splash view displays the correct text
        await tester.runAsync(
          () async {
            // Delay to allow text rendering
            await Future.delayed(const Duration(seconds: 1));
            // Verify that the splash view displays the correct text
            expect(find.textContaining('Busha', findRichText: true), findsOneWidget);
            expect(find.textContaining('Assessment', findRichText: true), findsOneWidget);
          },
        );

        // Wait for the splash view animation to complete
        await tester.pump(const Duration(seconds: 3));
        expect(find.byType(Material), findsOneWidget);
        await tester.pumpAndSettle();

        // Verify that navigation to login view occurred after the splash view
        expect(find.byType(LoginView), findsOneWidget);
        await tester.pumpAndSettle();
      });

      // Testing the login view
      testWidgets('Login view integration test', (WidgetTester tester) async {
        await loggingIn(tester);
      });

      // Testing the dashboard
      testWidgets('Dashboard integration test', (WidgetTester tester) async {
        await loggingIn(tester);

        // Verify that the Dashboard is displayed
        expect(find.byKey(const Key('bottomNavigationBar')), findsOneWidget);

        // Verify that the ExploreView is displayed by default
        expect(find.byType(ExploreView), findsOneWidget);

        // Verify that the view changes on bottom navigation item tap
        await tester.tap(find.text('Portfolio'));
        await tester.pumpAndSettle();
        expect(find.byType(EmptyPageView), findsOneWidget);

        await tester.tap(find.text('Earn'));
        await tester.pumpAndSettle();
        expect(find.byType(EmptyPageView), findsOneWidget);
      });

      // Test the explore view
      testWidgets(
        'Explore view integration test',
        (WidgetTester tester) async {
          await loggingIn(tester);

          // Verify that the ExploreView is displayed
          expect(find.byType(ExploreView), findsAny);

          // Verify that the balance card is displayed
          await verifyBalanceCard(tester);

          // Verify that the my assets card is displayed
          await verifyMyAssetsCard(tester);

          // Verify that the today's top movers card is displayed
          await verifyTodaysTopMoversCard(tester);

          // Verify that the trending news card is displayed
          expect(find.byType(ExploreTrendingNewsCard), findsOne);

          // Verify that the ExploreView has three cards with 3 see all buttons
          expect(find.text('See all'), findsNWidgets(3));

          // Verify that clicking on see all buttons navigates to the correct view
          await tester.tap(find.text('See all').first);
          await tester.pumpAndSettle();
          expect(find.byType(AllMyAssetsView), findsOneWidget);
        },
      );

      // Testing the empty page view
      testWidgets('Empty page view integration test', (WidgetTester tester) async {
        await loggingIn(tester);

        await tester.tap(find.text('Portfolio'));
        await tester.pumpAndSettle();

        // Verify that the EmptyPageView is displayed
        expect(find.byType(EmptyPageView), findsOneWidget);

        // Verify that the EmptyPageView has the correct texts
        expect(find.text('Empty Page'), findsOneWidget);
        expect(find.text('This page is empty for now. Please check back later.'), findsOneWidget);
        expect(find.text('Empty Page'), findsOneWidget);

        // Verify that the sign out button is displayed and functional
        await tester.tap(find.byKey(const Key('signOutButton')));
        await tester.pumpAndSettle();
      });

      // Testing the BTC transactions view and Tezos blocks view
      testWidgets(
        'BTC transactions/Tezos blocks view integration test',
        (WidgetTester tester) async {
          await loggingIn(tester);

          Asset currentAsset = exploreAssets[0];

          await tester.tap(find.byKey(ValueKey(currentAsset.symbol)));
          await tester.pumpAndSettle();

          if (currentAsset.symbol == 'BTC') {
            expect(find.byType(BtcTransactionsView), findsOneWidget);

            await tester.pumpAndSettle();

            if (TransactionsController().btcTransactionsList != null && TransactionsController().btcTransactionsList!.isNotEmpty) {
              // Verify that the transactions are displayed
              await tester.runAsync(
                () async {
                  expect(find.textContaining('Hash', findRichText: true), findsOneWidget);
                },
              );
            } else {
              // Verify that there is no transaction to display
              await tester.runAsync(
                () async {
                  expect(find.textContaining('Hash', findRichText: true), findsNothing);
                },
              );
            }
          } else if (currentAsset.symbol == 'XTZ') {
            expect(find.byType(TezosBlocksView), findsOneWidget);

            await tester.pumpAndSettle();

            if (TransactionsController().tezosBlocksList != null && TransactionsController().tezosBlocksList!.isNotEmpty) {
              // Verify that the blocks are displayed
              await tester.runAsync(
                () async {
                  expect(find.textContaining('Hash', findRichText: true), findsOneWidget);
                },
              );
            } else {
              // Verify that there is no block to display
              await tester.runAsync(
                () async {
                  expect(find.textContaining('Hash', findRichText: true), findsNothing);
                },
              );
            }
          }
        },
      );

      tearDownAll(() {
        exploreAssets.clear();
        exploreTodaysTopMovers.clear();
      });
    },
  );
}
