abstract class SingleCategoryStates {}

class SingleCategoryStateInitial extends SingleCategoryStates{}

class SingleCategoryStateLoading extends SingleCategoryStates{}

class SingleCategoryStateSuccess extends SingleCategoryStates{}

class SingleCategoryStateError extends SingleCategoryStates
{
  String error;

  SingleCategoryStateError(this.error);
}