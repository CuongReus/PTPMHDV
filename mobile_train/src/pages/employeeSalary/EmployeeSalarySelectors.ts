import { createSelector } from 'reselect';
import { AppState } from '../../data/state';

const getEmployeeSalary = (state: AppState) => {
  return state.listemployeeSalary.employeeSalarys
};

const getSearch = (state: AppState) => state.listemployeeSalary.searchNumber;

export const getFilteredEmployeeSalarys = createSelector(
  getEmployeeSalary, getSearch,
  (employeeSalarys, searchNumber) => {
    if (!searchNumber) {
      return employeeSalarys;
    }
    return employeeSalarys.filter(employeeSalary => (employeeSalary.userId && employeeSalary.userId == searchNumber));
  }
)
