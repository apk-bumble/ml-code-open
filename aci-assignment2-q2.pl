% Prolog file created from the CrayoDataset.csv dataset
:- dynamic patient/7.

% Facts
patient(1, 35, 12, 5, 1, 100, 0).
patient(2, 29, 7, 5, 1, 96, 1).
patient(3, 50, 8, 1, 3, 132, 0).
patient(4, 32, 11.75, 7, 3, 750, 0).
patient(5, 67, 9.25, 1, 1, 42, 0).
patient(6, 41, 8, 2, 2, 20, 1).
patient(7, 36, 11, 2, 1, 8, 0).
patient(8, 59, 3.5, 3, 3, 20, 0).
patient(9, 20, 4.5, 12, 1, 6, 1).
patient(10, 34, 11.25, 3, 3, 150, 0).
patient(11, 21, 10.75, 5, 1, 35, 0).
patient(12, 15, 6, 2, 1, 30, 1).
patient(13, 15, 2, 3, 1, 4, 1).
patient(14, 15, 3.75, 2, 3, 70, 1).
patient(15, 17, 11, 2, 1, 10, 0).
patient(16, 17, 5.25, 3, 1, 63, 1).
patient(17, 23, 11.75, 12, 3, 72, 0).
patient(18, 27, 8.75, 2, 1, 6, 0).
patient(19, 15, 4.25, 1, 1, 6, 1).
patient(20, 18, 5.75, 1, 1, 80, 1).
patient(21, 22, 5.5, 2, 1, 70, 1).
patient(22, 16, 8.5, 1, 2, 60, 1).
patient(23, 28, 4.75, 3, 1, 100, 1).
patient(24, 40, 9.75, 1, 2, 80, 0).
patient(25, 30, 2.5, 2, 1, 115, 1).
patient(26, 34, 12, 3, 3, 95, 0).
patient(27, 20, 0.5, 2, 1, 75, 1).
patient(28, 35, 12, 5, 3, 100, 0).
patient(29, 24, 9.5, 3, 3, 20, 0).
patient(30, 19, 8.75, 6, 1, 160, 1).
patient(31, 35, 9.25, 9, 1, 100, 1).
patient(32, 29, 7.25, 6, 1, 96, 1).
patient(33, 50, 8.75, 11, 3, 132, 0).
patient(34, 32, 12, 4, 3, 750, 0).
patient(35, 67, 12, 12, 3, 42, 0).
patient(36, 41, 10.5, 2, 2, 20, 1).
patient(37, 36, 11, 6, 1, 8, 0).
patient(38, 63, 2.75, 3, 3, 20, 0).
patient(39, 20, 5, 3, 1, 6, 1).
patient(40, 34, 12, 1, 3, 150, 0).
patient(41, 21, 10.5, 5, 1, 35, 0).
patient(42, 15, 8, 12, 1, 30, 1).

% Rules
% Rule 1: Male patients have a higher chance of treatment success if they have fewer than 3 warts.
treatment_success(PatientId) :-
    patient(PatientId, _, _, Number_of_Warts, _, _, Result_of_Treatment),
    patient(PatientId, 1, _, _, _, _, _),  % Check if patient is male
    Number_of_Warts < 3,
    Result_of_Treatment = 1.

% Rule 2: Female patients have a higher chance of treatment success if they have an area less than or equal to 50.
treatment_success(PatientId) :-
    patient(PatientId, _, _, _, _, Area, Result_of_Treatment),
    patient(PatientId, 2, _, _, _, _, _),  % Check if patient is female
    Area =< 50,
    Result_of_Treatment = 1.

% Query Examples:
% ?- treatment_success(1).
% Output: true (if patient 1 satisfies the conditions for treatment success)
%
% ?- treatment_success(2).
% Output: false (if patient 2 does not satisfy the conditions for treatment success)

2).

% Rules
% Rule 1: Patients with age greater than 30 and number of warts greater than 5 have a higher chance of treatment failure.
treatment_failure(PatientId) :-
    patient(PatientId, Age, _, Number_of_Warts, _, _, Result_of_Treatment),
    Age > 30,
    Number_of_Warts > 5,
    Result_of_Treatment = 0.

% Rule 2: Patients with an area greater than 100 have a higher chance of treatment failure.
treatment_failure(PatientId) :-
    patient(PatientId, _, _, _, _, Area, Result_of_Treatment),
    Area > 100,
    Result_of_Treatment = 0.

% Query Examples:
% ?- treatment_failure(1).
% Output: false (if patient 1 does not satisfy the conditions for treatment failure)
%
% ?- treatment_failure(4).
% Output: true (if patient 4 satisfies the conditions for treatment failure)
