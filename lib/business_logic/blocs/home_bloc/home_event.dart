part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TrendingMoviesLoaded extends HomeEvent {}

class TrendingMoviesLoading extends HomeEvent {}

class TrendingMoviesError extends HomeEvent {}
