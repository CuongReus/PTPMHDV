import superagentPromise from 'superagent-promise';
import _superagent from 'superagent';
import { CacheService } from './middleware';

const superagent = superagentPromise(_superagent, global.Promise);

const API_ROOT = 'http://localhost:8080/api';
const API_TOKEN = 'http://localhost:8080/oauth/token';
// const API_ROOT = 'http://125.212.243.69:8080/api';
// const API_TOKEN = 'http://125.212.243.69:8080/oauth/token';

const encode = encodeURIComponent;
const responseBody = res => res.body;

let token = null;
const tokenPlugin = req => {
    if (token) {
        req.set('Authorization', `Bearer ${token}`); // TODO: Check how to set request header
    }
};

const requests = {
    del: url =>
        superagent.del(`${API_ROOT}${url}`).withCredentials().use(tokenPlugin).then(responseBody),
    get: url =>
        superagent.get(`${API_ROOT}${url}`).withCredentials().use(tokenPlugin).then(responseBody),
    put: (url, body) =>
        superagent.put(`${API_ROOT}${url}`, body).withCredentials().use(tokenPlugin).then(responseBody),
    post: (url, body) =>
        superagent.post(`${API_ROOT}${url}`, body).withCredentials().use(tokenPlugin).then(responseBody),
    getPage: (url, page) => {
        var size = 20;
        if (!page) {
            page = 0;
        } else {
            page = page - 1; // to look url same as pagination
        }
        if (url.indexOf('?') != -1) {
            return superagent.get(`${API_ROOT}${url}` + '&page=' + encode(page) + '&size=' + encode(size)).withCredentials().use(tokenPlugin)
        } else {
            return superagent.get(`${API_ROOT}${url}` + '?page=' + encode(page) + '&size=' + encode(size)).withCredentials().use(tokenPlugin)
        }
    }

};

const asyncRequests = {
    del: url =>
        superagent.del(`${API_ROOT}${url}`).withCredentials().use(tokenPlugin),
    get: url =>
        superagent.get(`${API_ROOT}${url}`).withCredentials().use(tokenPlugin),
    put: (url, body) =>
        superagent.put(`${API_ROOT}${url}`, body).withCredentials().use(tokenPlugin),
    post: (url, body) =>
        superagent.post(`${API_ROOT}${url}`, body).withCredentials().use(tokenPlugin),
    getPage: (url, page) => {
            var size = 20;
            if (!page) {
                page = 0;
            } else {
                page = page - 1; // to look url same as pagination
            }
            if (url.indexOf('?') != -1) {
                return superagent.get(`${API_ROOT}${url}` + '&page=' + encode(page) + '&size=' + encode(size)).withCredentials().use(tokenPlugin)
            } else {
                return superagent.get(`${API_ROOT}${url}` + '?page=' + encode(page) + '&size=' + encode(size)).withCredentials().use(tokenPlugin)
            }
        }
};

const AuthService = {
    current: () =>
        requests.get('/auth/getCurrentUser'),
    login: (email, password) => {
        return superagent.post(`${API_TOKEN}`, `username=${encode(email)}&password=${encode(password)}&grant_type=password`)
            .set('Content-Type', 'application/x-www-form-urlencoded')
            .set('Authorization', 'Basic ' + btoa("loghisclientid1:TK7umcdNzl1002"))
            .withCredentials().then(responseBody);
    },
    loginRememberMe: (refreshToken) =>
        superagent.post(`${API_TOKEN}`, `refresh_token=${encode(refreshToken)}&grant_type=refresh_token`)
            .set('Content-Type', 'application/x-www-form-urlencoded')
            .set('Authorization', 'Basic ' + btoa("loghisclientid1:TK7umcdNzl1002"))
            .withCredentials().then(responseBody),
};

const UserApi = {
    listPersonel: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/user/list?search=' + encode(search), page, 20);
    },
    listAllPersonel: () => requests.get('/user/listAll'),
    getPersonel: (id) => requests.get('/user/' + id),
    getRole: (id) => requests.get('/role/' + id),
};

const LeaveDayApi = {
    listLeaveDay: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/leaveLetter/listLeaveDay?fullName=' + encode(search), page, 20);
    },
    listAllLeaveDay: () => requests.get('/user/listAll')
    // getPersonel: (id) => requests.get('/user/' + id)
};

const LeaveLetterApi = {
    getLeaveLetter: (id) => requests.get('/leaveLetter/' + id)
};
const StockMovementApi = {
    getStockMovement: (id) => requests.get('/stockMovement/' + id)
};
const ProductApi = {
    listProduct: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/product/list?search=' + encode(search), page, 20);
    },
    listAllProduct: () => requests.get('/product/listAll'),
    getProduct: (id) => requests.get('/product/' + id)
};
const ProductCategoryApi = {
    listProductCategory: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/productCategory/list?search=' + encode(search), page, 20);
    },
    listAllProductCategory: () => requests.get('/productCategory/listAll'),
    getProductCategory: (id) => requests.get('/productCategory/' + id)
};
const StockApi = {
    listStock: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/stock/list?search=' + encode(search), page, 20);
    },
    listAllStock: () => requests.get('/stock/listAll'),
    getStock: (id) => requests.get('/stock/' + id)
};
const StorageLocationApi = {
    listStorageLocation: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/storageLocation/list?search=' + encode(search), page, 20);
    },
    listAllStorageLocation: () => requests.get('/storageLocation/listAll'),
    getStorageLocation: (id) => requests.get('/storageLocation/' + id)
};


const ProjectApi = {
    listProject: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/project/list?search=' + encode(search), page, 20);
    },
    listAllProject: () => requests.get('/project/listAll'),
    getProject: (id) => requests.get('/project/' + id)
};

const ProjectDetailApi = {
    listProjectDetail: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/projectDetail/list?search=' + encode(search), page, 20);
    },
    listAllProjectDetail: () => requests.get('/projectDetail/listAll'),
    getProjectDetail: (id) => requests.get('/projectDetail/' + id)
};
const ProjectYearApi = {
    listProjectYear: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/projectYear/list?search=' + encode(search), page, 20);
    },
    listAllProjectYear: () => requests.get('/projectYear/listAll'),
    getProjectYear: (id) => requests.get('/projectYear/' + id)
};

const CompanyApi = {
    listCompany: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/company/list?search=' + encode(search), page, 20);
    },
    listAllCompany: () => requests.get('/company/listAll'),
    getCompany: (id) => requests.get('/company/' + id)
};

const SupplierApi = {
    listSupplier: (search, page) => {
        if (!search) {
            search = "";
        }
        return requests.getPage('/supplier/list?search=' + encode(search), page, 20);
    },
    listAllSupplier: () => requests.get('/supplier/listAll'),
    getSupplier: (id) => requests.get('/supplier/' + id)
};

export default {
    asyncRequests,
    AuthService,
    UserApi,
    CompanyApi,
    SupplierApi,
    setToken: _token => { token = _token }
}