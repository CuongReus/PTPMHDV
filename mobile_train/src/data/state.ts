import { combineReducers } from './combineReducers';
import { sessionsReducer } from './sessions/sessions.reducer';
import { userReducer } from './user/user.reducer';
import { listuserReducer } from '../pages/user/listuser.reducer';
import { liststockReducer } from '../pages/stock/liststock.reducer';
import { listemployeeSalaryReducer } from '../pages/employeeSalary/listemployeeSalary.reducer';


export const initialState: AppState = {
  data: {
    sessions: [],
    speakers: [],
    favorites: [],
    locations: [],
    allTracks: [],
    filteredTracks: [],
    mapCenterId: 0,
    loading: false
  },
  user: {
    hasSeenTutorial: false,
    darkMode: false,
    isLoggedin: false,
    loading: false
  },
  listuser: {
    users:[],
  },
  liststock: {
    stocks:[],
    searchNumber : 0,
  },
  listemployeeSalary: {
    employeeSalarys: [],
    searchNumber: 0,
  }
};

export const reducers = combineReducers({
  data: sessionsReducer,
  user: userReducer,
  listuser: listuserReducer,
  liststock: liststockReducer,
  listemployeeSalary: listemployeeSalaryReducer
});

export type AppState = ReturnType<typeof reducers>;