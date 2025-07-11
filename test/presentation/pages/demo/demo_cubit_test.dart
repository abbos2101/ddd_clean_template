import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_clean_template/application/var_status.dart';
import 'package:ddd_clean_template/domain/facades/fake_facade.dart';
import 'package:ddd_clean_template/domain/models/quote_model.dart';
import 'package:ddd_clean_template/presentation/pages/demo/demo_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MockFakeFacade extends Mock implements FakeFacade {}

class MockRefreshController extends Mock implements RefreshController {}

void main() {
  late MockFakeFacade mockFacade;
  late MockRefreshController mockController;
  late DemoCubit demoCubit;

  setUp(() {
    mockFacade = MockFakeFacade();
    mockController = MockRefreshController();
    demoCubit = DemoCubit(mockFacade);
  });

  group('DemoCubit', () {
    final testQuotes = [
      const QuoteModel(id: 1, quote: "Test quote 1", author: "Test author 1"),
      const QuoteModel(id: 2, quote: "Test quote 2", author: "Test author 2"),
    ];

    group('nextQuotes', () {
      blocTest<DemoCubit, DemoState>(
        "Successfully loads quotes",
        build: () {
          when(
            () => mockFacade.quotes(skip: any(named: 'skip')),
          ).thenAnswer((_) async => right(testQuotes));

          return demoCubit;
        },
        act: (cubit) => cubit.nextQuotes(mockController),
        expect: () {
          var state = const DemoState.initial();

          return [
            state = state.copyWith(quotesStatus: VarStatus.loading()),
            state = state.copyWith(
              quotesStatus: VarStatus.success(),
              quotes: testQuotes,
              skip: testQuotes.length,
            ),
          ];
        },
      );

      blocTest<DemoCubit, DemoState>(
        "Fails to loads quotes",
        build: () {
          when(() {
            return mockFacade.quotes(skip: any(named: 'skip'));
          }).thenAnswer((_) async => left('Xatolik'));

          return demoCubit;
        },
        act: (cubit) => cubit.nextQuotes(mockController),
        expect: () {
          var state = const DemoState.initial();

          return [
            state = state.copyWith(quotesStatus: VarStatus.loading()),
            state = state.copyWith(quotesStatus: VarStatus.fail('Xatolik')),
          ];
        },
      );
    });

    group('refresh', () {
      blocTest<DemoCubit, DemoState>(
        "Successfully loads quotes",
        build: () {
          // when(() => mockFacade.clearAllCache()).thenAnswer((_) async {});

          when(
            () => mockFacade.quotes(skip: any(named: 'skip')),
          ).thenAnswer((_) async => right(testQuotes));

          return demoCubit;
        },
        act: (cubit) => cubit.refresh(mockController,clearCache: false),
        expect: () {
          var state = const DemoState.initial();

          return [
            state = state.copyWith(skip: 0, quotes: []),
            state = state.copyWith(quotesStatus: VarStatus.loading()),
            state = state.copyWith(
              quotesStatus: VarStatus.success(),
              quotes: testQuotes,
              skip: testQuotes.length,
            ),
          ];
        },
      );

      blocTest<DemoCubit, DemoState>(
        "Fails to loads quotes",
        build: () {
          when(() => mockFacade.clearAllCache()).thenAnswer((_) async {});

          when(
            () => mockFacade.quotes(skip: any(named: 'skip')),
          ).thenAnswer((_) async => left('Xatolik'));

          return demoCubit;
        },
        act: (cubit) => cubit.refresh(mockController),
        expect: () {
          var state = const DemoState.initial();

          return [
            state = state.copyWith(skip: 0, quotes: []),
            state = state.copyWith(quotesStatus: VarStatus.loading()),
            state = state.copyWith(quotesStatus: VarStatus.fail('Xatolik')),
          ];
        },
      );
    });
  });
}
