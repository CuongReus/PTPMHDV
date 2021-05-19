import React from 'react';
import { connect } from 'react-redux';
import agent from '../../services/agent';
import { Modal } from 'react-bootstrap';
import { RenderInputWithDiv, RenderInputWithGen, RenderTextArea, RenderDatePicker,RenderCheckbox, RenderSelect, RenderMultiSelect, RenderNumberInput, RenderInputPassword } from '../../components/formInputs';
import { Field, reduxForm } from 'redux-form';
import isEmail from 'sane-email-validation';
import { StringUtils, SecurityUtils } from '../../utils/javascriptUtils';
import { toast } from 'react-toastify';
import { translate } from 'react-i18next';
import { LoadingScreen } from '../../components/commonWidgets';
import {LOAD_UPDATING_PERSONEL} from './action-types';
import {FIRE_REDIRECT } from '../../constants/action-types';
import { isNull } from 'util';
import moment from 'moment';
import UserAvatar from '../../components/UserAvatar';
import SecuredComponent from '../../components/SecuredComponent';
import ListFile from '../../components/ListFile';

const validate = values => {

    var today = new Date();
    var birthdaymin = moment(today, "DD/MM/YYYY").add(-18, 'years');
    const errors = {};
    if (!values.email) {
        errors.email = 'Vui lòng nhập email.';
    } else if (!isEmail(values.email)) {
        errors.email = 'Email không hợp lệ.';
    };
    if (!values.id&&!values.password) {
        errors.password = 'Vui lòng nhập mật khẩu.';
    };
    if (values.leaveDayYear > 36) {
        errors.leaveDayYear = 'Vui lòng nhập nhỏ hơn 36 ngày';
    }else if(values.password){
        if(values.password.length < 6){
            errors.password = "Để bảo mật, mật khẩu phải chứa 6 ký tự trở lên.";
        }
    };
    if (!values.code) {
        errors.code = 'Vui lòng nhập mã nhân viên!';
    };
    if (!values.fullName) {
        errors.fullName = 'Vui lòng nhập họ tên!';
    };
    // if (!values.phone) {
    //     errors.phone = 'Vui lòng nhập số điện thoại!';
    // }else if(values.phone){
    //     if(values.phone.length > 10){
    //         errors.phone = "Số điện thoại chưa đúng";
    //     }
    // }
    if (!values.company ||!values.company.id ){
        errors.company= {id:"Vui lòng chọn công ty làm việc!"}
    };
    // if(values.birthday){
    //     var today = new Date();
    //     var standardAge = moment(today).format("YYYY")-18;
    //     if(moment(values.birthday).format("YYYY")>standardAge){
    //     }
    // }
    if(values.birthday){
    if(moment(values.birthday).format("YYYY")> moment(birthdaymin).format("YYYY")){
        errors.birthday= "Tuổi của Nhân viên chưa đúng. Vui lòng nhập năm sinh nhỏ hơn hoặc bằng năm " + moment(birthdaymin).format("YYYY");
    }
    }
    return errors;
}

const mapStateToProps = state => {
    var updateValue = {
        ...state.personelReducer.updatingPersonel, 
        birthday: state.personelReducer.updatingPersonel && state.personelReducer.updatingPersonel.birthday ? moment(state.personelReducer.updatingPersonel.birthday) : null,
        roles: state.personelReducer.updatingPersonel && state.personelReducer.updatingPersonel.roles ? state.personelReducer.updatingPersonel.roles.map(role => {return {label: role.name, value: role.id}}) : null,
        active: state.personelReducer.updatingPersonel && state.personelReducer.updatingPersonel.active ? state.personelReducer.updatingPersonel.active : 1,
        startWorkDate: state.personelReducer.updatingPersonel && state.personelReducer.updatingPersonel.startWorkDate ? moment(state.personelReducer.updatingPersonel.startWorkDate) : null,
        issuedDate: state.personelReducer.updatingPersonel && state.personelReducer.updatingPersonel.issuedDate ? moment(state.personelReducer.updatingPersonel.issuedDate) : null
    };
    return {
        initialValues: updateValue,
        currentUser: state.common.currentUser,
    };
};

const mapDispatchToProps = dispatch => ({
        loadPersonel: (payload) => 
        dispatch({ type: LOAD_UPDATING_PERSONEL, payload: payload }),
        updateField: (fieldName, value) =>
        dispatch({
            meta: { form: "ModalPersonel", field: fieldName },
            payload: value,
            type: "@@redux-form/CHANGE"
        })

    });


class ModalPersonel extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            listAllCompanys:[],
            listAllRoles:[],
            disableDataManipulation: true
        }
        this.handleAdd = this.handleAdd.bind(this);
        this.handleHideAndClear = this.handleHideAndClear.bind(this);
    }
    
  componentWillMount() {
        const { loadPersonel } = this.props;
        var id = this.props.idUser;
        const dataPromise = agent.UserApi.getPersonel(id);
        loadPersonel(Promise.resolve(dataPromise)); 
       
        return(
                this.getListCompany(),
                this.getListRoles()
        )
        
    }

    getListCompany(){
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

    getListRoles(){
        let setStateInRequest = (list) => { this.setState({ listAllRoles: list }) }
        return agent.asyncRequests.get("/role/listAll").then(function (res) {
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

    handleAdd(values) {
        const {currentUser} = this.props; 
        var onHide = this.props.onHide;
        var id = this.props.idUser;
        var url = '/user/add';
        var bodyObject = {
            imageUpload: values.imageUpload,
            image : values.image,
            email: values.email,
            password: values.password,
            fullName: values.fullName,
            company: values.company,
            phone: values.phone, 
            role:"ADMIN",
            roles:values.roles.map(item => {return {id: item.value};}),
            address: values.address, 
            birthday: values.birthday,
            active: values.active,
            leaveDayYear: values.leaveDayYear,
            labourContract: values.labourContract,
            department: values.department,
            // Profile in File
            profiles: values.profiles,
            // End Profile in File
            identityCardNumber: values.identityCardNumber,
            issuedDate: values.issuedDate,
            issuedAt: values.issuedAt,
            permanentAddress: values.permanentAddress,
            currentAddress: values.currentAddress,
            startWorkDate: values.startWorkDate,
            position: values.position,
            numberOfYear: values.numberOfYear,
            jobDescription: values.jobDescription,
            degree: values.degree,
            trainingPlace: values.trainingPlace,
            profession: values.profession,
            graduationYear: values.graduationYear,
            foreignLanguageSkill: values.foreignLanguageSkill,
            level: values.level,
            familyInformation: values.familyInformation,
            gender : values.gender,
            code: values.code,
            createdUserEmail: !id ? currentUser.email : values.createdUserEmail,
            lastedUpdateUserEmail: id && values.lastedUpdateUserEmail ? values.lastedUpdateUserEmail:  currentUser.email 
         
        };
        if (id) {
            url = '/user/update';
            bodyObject.id = id;
        }

        return agent.asyncRequests.post(url, bodyObject
        ).then(function (res) {
            var result = res.body.resultData;
            if (result && result.id) {
              onHide();
            } else {
                
                toast.error("Có lỗi khi lưu trữ. Lỗi: " + res.body.errorMessage, { autoClose: 15000 });
            }
        }, function (err) {
            toast.error("Có lỗi khi lưu trữ. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", { autoClose: 15000 });
        });
    
    }

    ///Hide and Clean Value
    handleHideAndClear(){
       const{destroy,onHide} = this.props;
        // event.preventDefault();
        onHide();
        destroy();
    }
    render() {
       // const { objectUser, listfile, title, onHide } = this.props;
        
       const {handleSubmit,submitting, title,invalid,currentUser } = this.props;
        const modalConfig = { backdrop: 'static',show: this.props.show,bsSize:"sm",  onHide:this.props.onHide,submitting: this.props.submitting};
        var dataCompany = this.state.listAllCompanys;
        var disableDataManipulation = this.state.disableDataManipulation;
        var id = this.props.idUser;
        if(SecurityUtils.hasPermission(currentUser, "admin.users.update")){
            disableDataManipulation  = false
        }
        var optionCompanies = []; 
        dataCompany.map(item=>{
            optionCompanies.push({label:item.code +  "-" + item.name,value:item.id})
        })

        var optionUserRoles = []; 
        this.state.listAllRoles.map(item=>{
            optionUserRoles.push({label:item.name,value:item.id})
        })
        // optionEmployees = [];
        // dataEmployee.map(item => {
        //     optionEmployees.push({ label: item.fullName + "( " +item.phone +" )", value: item.id })
        // });
        var newModal = null;
        var dateNoew = new Date();
        var optionGender = [
            {label: "Nam", value: "MALE" },
            {label: "Nữ", value: "FEMALE" },
            {label: "Khác", value: "OTHER" }
        ];
       
            newModal =
            <div style={{ width: '30%' }}>
                <Modal
                    {...modalConfig}
                    aria-labelledby="contained-modal-title-lg"
                >
                    <Modal.Header closeButton>
                        <Modal.Title id="contained-modal-title-sm"><center>{title}</center> </Modal.Title>
                    </Modal.Header>
                    <Modal.Body>
                    {submitting ? <LoadingScreen /> :
                                <form className="form-horizontal" role="form" onSubmit={handleSubmit(this.handleAdd)}>
                                    <fieldset disabled={disableDataManipulation}>
                                    <div className="form-group">
                                    <div className="row" style={{marginLeft:'0px',width:"378px"}}>

                                         <Field name="imageUpload"  component={UserAvatar}></Field></div>


                                    <div className="form-group"> 
                                        <br/>
                                        {/* <label>Thông Tin Cá Nhân</label> */}
                                        <div className="row">
                                            <div className="col-md-6">
                                                
                                                <Field name="id" type={"hidden"} component={RenderInputWithDiv}></Field>
                                                <Field name="fullName" label="Họ Tên(*)" placeholder="Nhập họ tên người dùng..." component={RenderInputWithDiv}></Field>
                                                <Field name="email" type="email" label="Email(*)" placeholder="Nhập email người dùng..." component={RenderInputWithDiv}></Field>
                                                <Field name="phone"  label="Số Điện Thoại" placeholder="Nhập số điện thoại..." component={RenderNumberInput}></Field>  
                                                <Field name="company.id" label="Thuộc công ty(*)" options={optionCompanies} component={RenderSelect} ></Field>
                                                {/* <Field name="birthday" dateFormat="DD/MM/YYYY" label="Ngày Sinh"  isBirthday={true} component={RenderDisableRangeDatePicker}></Field> */}
                                                <Field name="birthday" dateFormat="DD/MM/YYYY" label="Ngày Sinh"  component={RenderDatePicker}></Field>
                                                <Field name="position" label="Chức Vụ" placeholder="Nhập chức vụ..." component={RenderInputWithDiv}></Field>
                                                <Field name="labourContract" label="Loại HĐLD" placeholder="Nhập loaị Hợp Đồng Lao Động..." component={RenderInputWithDiv}></Field>
                                                <Field name="active" label="Trạng Thái" checkLabel="Đang Làm Việc"  component={RenderCheckbox}></Field>
                                                {/* <Field name="address"  label="Địa Chỉ" placeholder="Nhập Địa Chỉ..." rows={3} component={RenderTextArea}></Field>                              */}
                                            </div>
                                            <div className="col-md-6">
                                                <Field name="code" label="Mã Nhân Viên(*)" placeholder="Nhập mã nhân viên..." component={RenderInputWithDiv}></Field>
                                                <Field name="gender" label="Giới Tính" options={optionGender} component={RenderSelect}></Field>
                                                <Field name="password" label="Mật khẩu(*)" placeholder="Nhập mật khẩu..." component={RenderInputPassword}></Field>
                                                <Field name="roles" label="Bộ Phận" placeholder="Chọn bộ phận..." options={optionUserRoles} component={RenderMultiSelect}></Field>
                                                <Field name="startWorkDate" label="Ngày Vào Công Ty" dateFormat="DD/MM/YYYY"  component={RenderDatePicker}></Field>  
                                                {/* <Field name="department"  label="Phòng Ban" placeholder="Nhập tên phòng ban..." component={RenderInputWithDiv}></Field> */}
                                                <Field name="numberOfYear" label="Số Năm" placeholder="Nhập số năm làm việc..." component={RenderNumberInput}></Field>
                                                <Field name="leaveDayYear" label="Số Ngày Phép / Năm" placeholder="Nhập số ngày phép của nhân viên / năm..."  component={RenderNumberInput}></Field>
                                                <Field name="jobDescription" label="Mô Tả Công Việc Đang Làm" placeholder="Nhập mô tả công việc đang làm..." row={3} component={RenderTextArea}></Field>
                                            </div>
                                        </div>
                                        <hr/>
                                        <div className="row">
                                            <div className="col-md-6">
                                                <Field name="identityCardNumber" label="Số CMND" placeholder="Nhập số chứng minh nhân dân..." component={RenderNumberInput}></Field>
                                            </div>
                                        </div>
                                        <div className="row">
                                            <br/>
                                            <div className="col-md-6">
                                                <Field name="issuedAt" label="Nơi Cấp" placeholder="Nhập nơi cấp..." component={RenderInputWithDiv}></Field>
                                            </div>
                                            <div className="col-md-6">
                                                <Field name="issuedDate" label="Ngày Cấp" dateFormat="DD/MM/YYYY"  maxDate={dateNoew} component={RenderDatePicker}></Field>
                                            </div>
                                        </div>
                                        <div className="col-md">
                                            <br/>
                                            <Field name="permanentAddress" label="Địa Chỉ Thường Trú" placeholder="Nhập dịa chỉ thường trú..." component={RenderInputWithDiv}></Field>
                                        </div>
                                        <div className="col-md">
                                            <br/>
                                            <Field name="currentAddress" label="Địa Chỉ Hiện Tại" placeholder="Nhập địa chỉ hiện tại..." component={RenderInputWithDiv}></Field>
                                        </div>
                                        <div className="row">
                                            <div className="col-md-12">
                                                <h5>Bằng Cấp</h5>
                                                <Field name="degree" label="Bằng Cấp Chuyên Ngành" placeholder="Nhập bằng cấp chuyên ngành..." component={RenderInputWithDiv}></Field>
                                                <Field name="trainingPlace" label="Nơi Đào Tạo" placeholder="Nhập nơi đào tạo..." component={RenderInputWithDiv}></Field>
                                                <Field name="profession" label="Chuyên Ngành" placeholder="Nhập chuyên ngành..." component={RenderInputWithDiv}></Field>
                                                <Field name="graduationYear" label="Năm Tốt Nghiệp" placeholder="Nhập năm tốt nghiệp..." component={RenderNumberInput}></Field>
                                                <Field name="foreignLanguageSkill" label="Ngoại Ngữ" placeholder="Nhập Ngoại Ngữ..." component={RenderInputWithDiv}></Field>
                                                <Field name="level" label="Cấp Độ" placeholder="Nhập cấp độ..." component={RenderInputWithDiv}></Field>
                                                <Field name="familyInformation" label="Thông Tin Gia Đình" placeholder="Nhập thông tin gia đình..." row={3} component={RenderTextArea}></Field>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                                    <div className="col-md">
                                        <Field name="profiles"  component={ListFile} modalUrl="/uploadUserProfile" labelUploadFile={'Hồ Sơ Nhân Viên'}></Field>
                                    </div>
                                    <div className="text-right">
                                        <button type="button" className="btn btn-link" onClick={this.handleHideAndClear} >Hủy</button>
                                        <button type="submit" className="btn bg-orange" disabled={submitting || invalid}>Lưu</button>
                                    </div>
                                    </fieldset>
                                </form>
                            }
                    </Modal.Body>
                </Modal>
            </div>
        return newModal;
    }
};


export default translate('translations')(connect(
    mapStateToProps, mapDispatchToProps)(
        reduxForm({
            form: 'ModalPersonel',
            destroyOnUnmount: true,
            enableReinitialize: true,
            validate
        })(ModalPersonel)));
