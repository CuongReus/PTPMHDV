import React from "react";
import { connect } from 'react-redux';
import {reduxForm} from 'redux-form';
import { BrowserRouter, Router, Route, Link, Switch, Redirect} from 'react-router-dom';
import { store, history } from './store/index';
import agent from './services/agent';
import { push } from 'react-router-redux';
import {ToastContainer, toast} from 'react-toastify';
import ReactDOM from "react-dom";
import {APP_LOAD, REDIRECT, FIRE_REDIRECT, LOGIN} from './constants/action-types';
import Login from './views/login';
import Script from 'react-load-script';

import TopBar from "./components/TopBar";
import SideBar from "./components/SideBar";
import PersonelList from "./views/personel/PersonelList";
import RoleList from "./views/personel/RoleList";
import RoleEdit from "./views/personel/RoleEdit";
import CompanyList from "./views/projectProgress/CompanyList";
import CompanyProjectList from "./views/projectProgress/CompanyProjectList";

import UserChangePassword from "./views/personel/UserChangePassword";
import SupplierList from "./views/Supplier/SupplierList";

const mapStateToProps = state => {
    return {
        appLoaded: state.common.appLoaded,
        currentUser: state.common.currentUser,
        redirectTo: state.common.redirectTo
    }};

const mapDispatchToProps = dispatch => ({
    onLoad: (payload, token) =>
    dispatch({ type: APP_LOAD, payload: payload, token: token, skipTracking: true }),
    onRedirect: () =>
        dispatch({ type: REDIRECT }),
    fireRedirect: (url) =>
        dispatch({ type: FIRE_REDIRECT, toUrl: url }),
    loginRememberMe: (refreshToken, isRequiredRedirect) =>
        dispatch({ type: LOGIN, payload: agent.AuthService.loginRememberMe(refreshToken), rememberMe: true, isRequiredRedirect}),

});

class App extends React.Component {
    componentWillReceiveProps(nextProps) {
        if (nextProps.redirectTo) {
            if (nextProps.redirectTo == "/login" || nextProps.redirectTo == "/") {
                // Full load the index page using the window.location to ensure scripts are executed
                window.location.href = nextProps.redirectTo;
            } else {
                store.dispatch(push(nextProps.redirectTo));
                this.props.onRedirect();
            }
        }
    }

    componentWillMount() {
        const token = window.sessionStorage.getItem('jwt');
        const expiredTime = window.sessionStorage.getItem('jwtExpiredTime');
        var now = new Date();
        var currentUrl = this.props.location.pathname;
        if (token && now.getTime() < expiredTime) {
            agent.setToken(token);
            this.props.onLoad(agent.AuthService.current(), token);
        } else {
            const refreshToken = window.localStorage.getItem('remember_jwt');
            if (refreshToken) {
                // Only login need to redirect to dashboard page
                var isRequiredRedirect = currentUrl.indexOf("/login") != -1;
                this.props.loginRememberMe(refreshToken, isRequiredRedirect);
            } else {
                if (currentUrl.indexOf("/login") == -1 &&
                    currentUrl.indexOf("/quen-mat-khau") == -1 &&
                    currentUrl.indexOf("/validateLeave") == -1 &&
                    currentUrl.indexOf("/doi-mat-khau") == -1) {
                    this.props.fireRedirect("/login");
                }
            }
        }
    }

    componentDidUpdate() {
        ReactDOM.render(
            <div>
                <Script url="/assets/js/core/app.js"/>
                <Script url="/assets/js/pages/form_layouts.js"/>
            </div>,
            document.getElementById("addedLibs"));
    }

    render() {
        const {currentUser} = this.props;
        return (
           // <BrowserRouter history={history} basename='/#'>
           // --history-api-fallback is used to make /login working when refresh browser.
                <div>
                    <ToastContainer  autoClose={8000} position={toast.POSITION.TOP_CENTER}/>
                    <TopBar/>
                    <div className="page-container" style={{minHeight:'721px'}}>
                        <div className="page-content">
                            <SideBar/>
                            <Switch>
                                <Route exact path="/" render={() => {
                                    const token = window.sessionStorage.getItem('jwt') ? window.sessionStorage.getItem('jwt') : window.localStorage.getItem('jwt');
                                    if (token) {
                                        return (<Redirect to="/listPersonel" />);
                                    } else {
                                        return (<Redirect to="/login" />)
                                    }
                                    }
                                } />
                                <Route path="/login" component={Login}/>
                                <Route path="/listPersonel" component={PersonelList}/>
                                <Route path="/listRole" component={RoleList}/>
                                <Route path="/editRole/:id" component={RoleEdit}/>
                                <Route path="/UserChangePassword" component={UserChangePassword}/>
                                <Route path="/listCompany" component={CompanyList}/>
                                <Route path="/projectProgress/:id" component={CompanyProjectList}/>
                                <Route path="/listSupplier" component={SupplierList}/>
                            </Switch>
                        </div>
                    </div>
                </div>
        );
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(reduxForm({
    form: 'MainApp',
    destroyOnUnmount: false
})(App));
