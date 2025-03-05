import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gym_tracker_app/common/app_theme/snackbar.dart';
import 'package:gym_tracker_app/features/workout/domain/usecases/work_out_usecase.dart';
import 'package:gym_tracker_app/features/workout/presentation/cubit/workout_state.dart';

class WorkoutCubit extends Cubit<WorkOutState> {
  WorkOutUsecase workOutUsecase;
  
  // Track filters internally if they're not in the state
  String _currentBodyPart = 'ALL';
  String _currentDifficulty = 'ALL';
  
  WorkoutCubit({required this.workOutUsecase}) : super(WorkOutState.initially());

  fetchWorkList(BuildContext context) async {
    emit(state.copyWith(isLoadingState: true));
    
    var result = await workOutUsecase.call(null);
    result.fold((error) {
      emit(state.copyWith(isLoadingState: false));
      
      showMySnackBar(context, message: 'Something went wrong');
    }, (data) {
      emit(state.copyWith(isLoadingState: false));
      emit(state.copyWith(
        workOutList: data,
        workOutListIntial: data,
        workOutBodyPartsList: ['ALL', ...data.map((e) => e.bodyPart!).toSet().toList()],
        workOutLevelsList: ['ALL', ...data.map((e) => e.difficulty!).toSet().toList()],
      ));
      
      // Reset filters when data is loaded
      _currentBodyPart = 'ALL';
      _currentDifficulty = 'ALL';
    });
  }

  // Filter by body part
  filterBodyParts(String selectedPart) {
    _currentBodyPart = selectedPart;
    _applyFilters();
  }

  // Filter by difficulty level
  filterDifficultyLevel(String selectedDifficulty) {
    _currentDifficulty = selectedDifficulty;
    _applyFilters();
  }

  // Combined filter function to apply both filters
  void _applyFilters() {
    if (_currentBodyPart.toLowerCase() == 'all' && 
        _currentDifficulty.toLowerCase() == 'all') {
      // If both filters are set to ALL, just use the original list
      emit(state.copyWith(workOutList: state.workOutListIntial));
      return;
    }
    
    final filteredList = state.workOutListIntial?.where((workout) {
      bool matchesBodyPart = _currentBodyPart.toLowerCase() == 'all' || 
                           workout.bodyPart?.toLowerCase() == _currentBodyPart.toLowerCase();
      
      bool matchesDifficulty = _currentDifficulty.toLowerCase() == 'all' || 
                             workout.difficulty?.toLowerCase() == _currentDifficulty.toLowerCase();
      
      return matchesBodyPart && matchesDifficulty;
    }).toList();

    emit(state.copyWith(workOutList: filteredList));
  }
}