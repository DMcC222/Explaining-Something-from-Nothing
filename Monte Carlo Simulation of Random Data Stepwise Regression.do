***Commands to run a Monte Carlo Simulation of a stepwise regression of a random and normally distributed dataset

*Step One: Creating a program for a single iteration
program define random_stepwise,
drawnorm DV IV1-IV100, n(250) clear
stepwise, pr(.05): regress DV IV1-IV100
end

*Optional: Running a single iteration
set more off
random_stepwise

*Step Two: Running a Monte Carlo Simulation, and reporting mean R2 value and mean number of variables in a model
simulate r2=e(r2) variables=e(df_m), reps(25): random_stepwise
hist r2
sum

*Optional: Clean-up
program drop random_stepwise
