import React from 'react';
import qs from 'query-string';
import { toast } from 'react-toastify';
import { translate } from 'react-i18next';
import { ScriptUtils, UrlUtils } from '../../utils/javascriptUtils';
import TablePagination from '../../components/TablePagination';
import agent from '../../services/agent';
import { Link } from 'react-router-dom';
import ModalPersonel from './ModalPersonel';
import SecuredComponent from '../../components/SecuredComponent';
import { connect } from 'react-redux';

const mapStateToProps = state => ({
    currentUser: state.common.currentUser,
});

const mapDispatchToProps = dispatch => ({
});

class PersonelList extends React.Component {
    constructor() {
        super();
        this.state = {
            listPersonel: null,
            isPersonelModalShown: false,
            listAllCompanys: [],
        }
        this.handleShowmodal = this.handleShowmodal.bind(this);
        this.handleHidemodal = () => {
            this.setState({ isPersonelModalShown: false });
            this.updateListPersonel();
        };
    };

    updateListPersonel() {
        var search = qs.parse(this.props.location.search).search;
        search = search ? search : "";
        var page = qs.parse(this.props.location.search).page;
        this.getListCompany();
        var company = qs.parse(this.props.location.search).company;
        company = company ? company : "ALL";
        let setStateInRequest = (list) => { this.setState({ listPersonel: list }) }
        return agent.asyncRequests.getPage('/user/findByCompanyIdAndFullNameOrPhoneOrEmail?companyId=' + company + "&fullNameOrPhoneOrEmail=" + search, page
        ).then(function (res) {
            var result = res.body.resultData;
            if (result) {
                setStateInRequest(result);
            } else {
                toast.error("Có lỗi khi tải dữ liệu. Lỗi: " + result.errorMessage, { autoClose: 15000 });
            }
        }, function (err) {
            toast.error("Có lỗi khi tải dữ liệu. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", { autoClose: 15000 });
        });
    }
    getListCompany() {
        let setStateInRequest = (list) => { this.setState({ listAllCompanys: list }) }
        return agent.asyncRequests.get("/company/listAll").then(function (res) {
            var result = res.body.resultData;
            if (result) {
                setStateInRequest(result);
            } else {
                toast.error("Có lỗi khi tải dữ liệu. Lỗi: " + result.errorMessage, { autoClose: 15000 });
            }
        }, function (err) {
            toast.error("Có lỗi khi tải dữ liệu. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", { autoClose: 15000 });
        });
    }
    componentWillMount() {
        var search = qs.parse(this.props.location.search).search;
        search = search ? search : "";
        var page = qs.parse(this.props.location.search).page;
        this.getListCompany();
        var company = qs.parse(this.props.location.search).company;
        company = company ? company : "ALL";
        let setStateInRequest = (list) => { this.setState({ listPersonel: list }) }
        return agent.asyncRequests.getPage('/user/findByCompanyIdAndFullNameOrPhoneOrEmail?companyId=' + company + "&fullNameOrPhoneOrEmail=" + search, page
        ).then(function (res) {
            var result = res.body.resultData;
            if (result) {
                setStateInRequest(result);
            } else {
                toast.error("Có lỗi khi tải dữ liệu. Lỗi: " + result.errorMessage, { autoClose: 15000 });
            }
        }, function (err) {
            toast.error("Có lỗi khi tải dữ liệu. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", { autoClose: 15000 });
        });
    };

    componentDidUpdate() {
        ScriptUtils.loadFootable();
    }
    //Delete Personel Function
    deletePersonel(id, fullName) {

        if (confirm("Bạn có chắc sẽ xoá Nhân Viên: " + "'" + fullName + "'")) {
            var url = `/user/${id}`;
            return agent.asyncRequests.del(url
            ).then(function (res) {
                var result = res.body.resultData;
                if (result && !result.error) {
                    alert("Xoá Thành Công Nhân Viên: " + fullName);
                    window.location.reload(true);
                } else {
                    toast.error("Có lỗi khi xóa dữ liệu. Lỗi: " + result.errorMessage, { autoClose: 15000 });
                }
            }, function (err) {
                toast.error("Không thể xóa dữ liệu đang được sử dụng từ màn hình khác! ", { autoClose: 15000 });
            });


        } else {
        }
    }
    handleShowmodal(id) {
        this.setState({
            
            isPersonelModalShown: true,
            idUser: id
        });

    }
    render() {
        var baseUrl = UrlUtils.getPathWithParamsNotPaging()
        const data = this.state.listPersonel;
        if (!data) {
            return null;
        }
      
        var currentNo = 0;
        var page = qs.parse(this.props.location.search).page;
        if (!page) {
            page = 1;
        }
        var currentNo = ((page - 1) * 20);
        var rows = data.content.map(item => {
            currentNo++
            return (
                <tr key={item.id}>
                    <td>{currentNo}</td>
                    {/* <td><img src={API_ROOT_DOWNLOAD+item.image} width={100} height={100}/></td> */}
                    <td>{item.email}
                    </td>
                    <td style={{whiteSpace:'nowrap'}} >{item.code} || {item.fullName}</td>
                    <td >{item.roles.map(role=>{
                        return role.name 
                    })}</td>
                    <td>{item.currentAddress}</td>
                    {/* <td>{item.permanentAddress}</td> */}
                    <td>{item.position}</td>
                    <td>{item.company ? item.company.name : null}</td>
                    <td>{item.phone}</td>
                    <td>{item.leaveDayYear}</td>
                    <td className="active-font" target={item.active ? "Đang Hoạt Động" : "Vô Hiệu Hoá"}>{item.active ? "Đang Hoạt Động" : "Vô Hiệu Hoá"}</td>
                    <td className="text-center footable-visible footable-last-column">
                        <ul className="icons-list">
                            <li className="dropdown">
                                <a href="#" className="dropdown-toggle" data-toggle="dropdown">
                                    <i className="icon-menu9"></i>
                                </a>
                                <ul className="dropdown-menu dropdown-menu-right">
                                    <SecuredComponent allowedPermission="admin.users.update">
                                        <li><a onClick={() => this.handleShowmodal(item.id)}><i className="icon-pencil"></i>Sửa</a></li>
                                    </SecuredComponent>
                                    <SecuredComponent allowedPermission="admin.users.delete">
                                        <li><a onClick={() => this.deletePersonel(item.id, item.fullName)}><i className="icon-cross2"></i>Xóa</a></li>
                                    </SecuredComponent>

                                </ul>
                            </li>
                        </ul>
                    </td>
                </tr>);
        });

        const dataCompany = this.state.listAllCompanys;
        if (!dataCompany) {
            return null;
        }
        var search = qs.parse(this.props.location.search).search;
        var company = qs.parse(this.props.location.search).company;
        if (!company) {
            company = "ALL";
        }
        var optionCompany = [];
        dataCompany.map(item => {
            optionCompany.push({ label: item.name, value: item.id })
        })
        return (

            <div className="content-wrapper">


                <div className="content">
                    <div className="page-header">
                        <h4>
                            <i className=" icon-paragraph-justify2 position-left"></i>
                            <span className="text-semibold">Danh sách Nhân Viên</span>
                            <span className="pull-right">
                            <SecuredComponent allowedPermission="admin.users.create">
                                <button className="btn bg-green" onClick={() => this.handleShowmodal()}>Thêm Mới</button>
                                </SecuredComponent>
                            </span>
                        </h4>
                    </div>

                    <div className="row">
                        <div className="col-md-12">
                            <div className="panel panel-flat">

                                <div className="panel-body">
                                    <form className="main-search" role="form">
                                        <div className="col-md-4">
                                            <div className="form-group">
                                                <label className="control-label col-md-3" htmlFor="company">Công Ty</label>
                                                <div className="col-md-9">
                                                    <select placeholder="Tất cả" className="select form-control" name="company" defaultValue={company}>
                                                        <option key="ALL" value="ALL">Tất cả</option>
                                                        {optionCompany.map(company => <option key={company.value} value={company.value}>{company.label}</option>)}
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="input-group content-group">
                                            <div className="has-feedback has-feedback-left">
                                                <input type="text" className="form-control input-xlg" placeholder="Tìm kiếm theo: Tên nhân viên,Số điện thoại,Email" name="search" defaultValue={search} autoFocus={true} />
                                                <div className="form-control-feedback">
                                                    <i className="icon-search4 text-muted text-size-base"></i>
                                                </div>
                                            </div>

                                            <div className="input-group-btn">
                                                <button type="submit" className="btn bg-green btn-xlg">Tìm</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            {this.state.isPersonelModalShown ? <ModalPersonel title="Nhân Viên" idUser={this.state.idUser} show={this.state.isPersonelModalShown} onHide={this.handleHidemodal} /> : null}
                            <div className="panel panel-flat">
                                <table style={{textAlign: 'center'}} className="table table-xxs">
                                    <thead>
                                        <tr className="bg-green">
                                            <th data-toggle="true">STT</th>
                                            {/* <th data-hide="phone">Hình Ảnh</th> */}
                                            <th data-toggle="true"><center>Email</center></th>
                                            <th data-hide="phone"><center>Mã Nhân Viên & Họ Tên</center></th>
                                            <th data-hide="phone"><center>Thuộc Bộ Phận</center></th>
                                            <th data-hide="phone"><center>Địa chỉ Hiện Tại</center></th>
                                            {/* <th data-hide="phone">Địa chỉ Thường Trú</th> */}
                                            <th data-hide="phone"><center>Chức Vụ </center></th>
                                            <th data-hide="phone"><center>Công Ty </center></th>
                                            <th data-hide="phone"><center>Điện thoại</center></th>
                                            <th data-hide="phone"><center>Ngày Phép / Năm</center></th>
                                            <th data-hide="phone"><center>Trạng Thái</center></th>
                                            <th className="text-center footable-visible footable-last-column" style={{ width: '30px' }}><i className="icon-menu-open2"></i></th>
                                        </tr>
                                        
                                    </thead>
                                    <tbody>
                                        {rows}
                                    </tbody>
                                   
                                </table>
                            </div>
                            <TablePagination data={data} baseUrl={baseUrl} />
                        </div>
                    </div>
                </div>

            </div>
        );
    }

}

export default translate('translations')(connect(
    mapStateToProps, mapDispatchToProps)(PersonelList));