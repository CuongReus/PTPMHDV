import { ActionType } from '../../util/types';
import { asyncRequests } from '../../data/dataApi';
import { ListEmployeeSalaryState } from './listemployeeSalary.state';

export const loadListEmployeeSalary = () => async (dispatch: React.Dispatch<any>) => {
  const employeeSalarys = await asyncRequests.get("/employeeSalary/listAll");
  dispatch(setListEmployeeSalaryData({employeeSalarys:employeeSalarys}));
};

export const setListEmployeeSalaryData = (employeeSalarys: Partial<ListEmployeeSalaryState>) => ({
  type: 'set-list-employeeSalary-data',
  employeeSalarys
} as const);

export const setSearchNumber = (searchNumber ?: number) => ({ 
  type: 'set-search-number', 
  searchNumber 
} as const);

export type ListEmployeeSalaryActions =
  ActionType<typeof setListEmployeeSalaryData>   
| ActionType<typeof setSearchNumber>   
