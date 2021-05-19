import React from 'react';
import qs from 'query-string';
import { toast } from 'react-toastify';
import { translate } from 'react-i18next';
import { ScriptUtils } from '../../utils/javascriptUtils';
import TablePagination from '../../components/TablePagination';
import agent from '../../services/agent';
import { Link } from 'react-router-dom';
import { API_ROOT_DOWNLOAD } from '../../constants/ConfigConstants';


class CompanyProjectList extends React.Component {
    constructor() {
        super();
        this.state = {
            listCompanyProject: null,
            isProjectYearModalShown: false,
            projectYearListRows: [],
            companyDto: null

        }
        this.handleShowmodal = this.handleShowmodal.bind(this);
        this.handleHidemodal = this.handleHidemodal.bind(this);



    };


    loadCompany(id) {
        let setStateInRequest = (list) => { this.setState({ companyDto: list }) }
        agent.asyncRequests.get("/company/" + id
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
    loadProjectYear(id) {
        let setStateInRequest = (list) => { this.setState({ projectYearListRows: list }) }
        agent.asyncRequests.get("/projectYear/listFindByCompany?company=" + id
            // /detailItem/list?search=
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
    componentWillMount() {
        var id = this.props.match.params.id;
        return (
            this.loadCompany(id),
            this.loadProjectYear(id)
        )
    };

    componentDidUpdate() {
        ScriptUtils.loadFootable();
    }

    handleShowmodal(id) {
        this.setState({
            isProjectYearModalShown: true,
            idProjectYear: id
        })
    }
    handleHidemodal(id) {
        var id = this.props.match.params.id;
        this.setState({
            isProjectYearModalShown: false
        })
        this.loadCompany(id),
        this.loadProjectYear(id)

    }


    render() {
        const projectYearListRows = this.state.projectYearListRows;
        const companyDto  = this.state.companyDto;
        if (!companyDto) {
            return null;
        }
     
        var rows = projectYearListRows.map(item => {

    

            return (
                <ProjectYearRows key={"projectYear_" + item.id}  companyDto={this.state.companyDto} yearDto={item}></ProjectYearRows>
            )
        });

        return (

            <div className="content-wrapper">


                <div className="content">
                    <div className="page-header">
                        <h4>
                            <i className=" icon-paragraph-justify2 position-left"></i>
                            <span className="text-semibold"></span>
                            <span className="pull-right">
                                <button className="btn bg-green" onClick={() => this.handleShowmodal()}>Thêm Mới</button>
                            </span>
                        </h4>
                    </div>

                    <div className="row">
                        <div className="col-md-12">
                            {this.state.isProjectYearModalShown ? <ModalProjectYear title="Năm" companyDto={companyDto} idProjectYear={this.state.idProjectYear} show={this.state.isProjectYearModalShown} onHide={this.handleHidemodal} /> : null}

                            <div className="panel panel-flat">
                            <center>
                                    <h1>Quy Trình Dự Án</h1>
                                    <h5>Công Ty: {companyDto.name} </h5></center>
                                <table className="table table-togglable">
                                    <thead>
                                        <tr className="bg-green">
                                        <td colSpan="15"></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {rows}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        );
    }

}

export default translate('translations')(CompanyProjectList);