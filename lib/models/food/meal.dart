class Meal {
    static int _ordinalIndex = 0;

    final int ordinal;
    final String name;

    Meal._internal(this.name): ordinal = Meal._ordinalIndex++;

    static final Meal breakfast = Meal._internal('Breakfast');
    static final Meal lunch = Meal._internal('Lunch');
    static final Meal dinner = Meal._internal('Dinner');
    static final Meal lateNight = Meal._internal('Late Night');
    static final Meal lateNightSnacks = Meal._internal('Late Night Snacks');

    static final List<Meal> all = List.unmodifiable([
        breakfast,
        lunch,
        dinner,
        lateNight,
        lateNightSnacks
    ]);
}