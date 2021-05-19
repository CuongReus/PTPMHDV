import { combineReducers } from "redux";
import reduceReducers from 'reduce-reducers';
import { reducer as formReducer } from 'redux-form';
import auth from "./auth";
import commonReducer from "./common";
import personelReducer from '../views/personel/reducer';
import companyReducer from '../views/projectProgress/reducer';
import supplierReducer from '../views/Supplier/reducer';
import { routerReducer } from 'react-router-redux';
import { LOGOUT } from '../constants/action-types';

const combinedReducer = combineReducers({
    form: formReducer,
    auth,
    common: commonReducer,
    personelReducer: personelReducer,
    router: routerReducer,
    companyReducer: companyReducer,
    supplierReducer : supplierReducer
});

const crossSliceReducer = (state, action) => {
    switch (action.type) {
        case LOGOUT:
            // Modify state if needed. The LOGOUT is handled in each reducer now.
            return state;
        default: return state;
    }
};

const rootReducer = reduceReducers(combinedReducer, crossSliceReducer);

export default rootReducer;
