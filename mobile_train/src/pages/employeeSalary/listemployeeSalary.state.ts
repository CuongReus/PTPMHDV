import { EmployeeSalary } from "./EmployeeSalary";

type searchNumber = 0;

export interface ListEmployeeSalaryState {
  employeeSalarys: EmployeeSalary[];
  searchNumber? : number ;
};
