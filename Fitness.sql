-- Create ExerciseCategories table
CREATE TABLE ExerciseCategories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Create UserPreferences table
CREATE TABLE UserPreferences (
    preference_id INT PRIMARY KEY,
    user_id INT,
    preferred_category_id INT,
    preferred_location VARCHAR(100),
    notification_enabled BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (preferred_category_id) REFERENCES ExerciseCategories(category_id)
);

-- Create PersonalBests table
CREATE TABLE PersonalBests (
    pb_id INT PRIMARY KEY,
    user_id INT,
    exercise_id INT,
    value DECIMAL(10, 2),
    date_achieved DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
);

-- Create WorkoutTemplates table
CREATE TABLE WorkoutTemplates (
    template_id INT PRIMARY KEY,
    template_name VARCHAR(100) NOT NULL,
    user_id INT,
    template_description TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create MealTracking table
CREATE TABLE MealTracking (
    meal_id INT PRIMARY KEY,
    user_id INT,
    meal_name VARCHAR(150) NOT NULL,
    meal_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create ExerciseSetsReps table
CREATE TABLE ExerciseSetsReps (
    set_rep_id INT PRIMARY KEY,
    workout_id INT,
    exercise_id INT,
    set_number INT,
    rep_count INT,
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
);

-- Insert sample data into ExerciseCategories
INSERT INTO ExerciseCategories (category_id, category_name)
VALUES (1, 'Cardio'), (2, 'Strength'), (3, 'Flexibility');

-- Insert sample data into UserPreferences
INSERT INTO UserPreferences (preference_id, user_id, preferred_category_id, preferred_location, notification_enabled)
VALUES (1, 1, 2, 'Gym', true);

-- Insert sample data into PersonalBests
INSERT INTO PersonalBests (pb_id, user_id, exercise_id, value, date_achieved)
VALUES (1, 1, 2, 50.0, '2023-07-15');

-- Insert sample data into WorkoutTemplates
INSERT INTO WorkoutTemplates (template_id, template_name, user_id, template_description)
VALUES (1, 'Full Body Workout', 1, 'A comprehensive workout targeting all major muscle groups.');

-- Insert sample data into MealTracking
INSERT INTO MealTracking (meal_id, user_id, meal_name, meal_date)
VALUES (1, 1, 'Breakfast', '2023-08-25');

-- Insert sample data into ExerciseSetsReps
INSERT INTO ExerciseSetsReps (set_rep_id, workout_id, exercise_id, set_number, rep_count)
VALUES (1, 1, 2, 1, 12);
