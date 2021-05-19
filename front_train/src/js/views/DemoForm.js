import React from 'react';
import { connect } from 'react-redux';
import {Field, reduxForm, formValueSelector} from 'redux-form';
import {RenderInput, RenderSelect, RenderMultiSelect, RenderDatePicker, RenderPlainCheckbox,  RenderInputMultiFile, RenderRadio} from '../components/formInputs';
import moment from 'moment';
import qs from 'query-string';
import agent from '../services/agent';
import {toast} from 'react-toastify';

import ListFile from '../components/ListFile';
const data = {
    firstName: 'Logsik',
    lastName: 'Company',
    email: 'contact@logsik.com',
    province: 'hochiminh',
    uploadfile: null
};

const validate = values => {
    const errors = {};
    if (!values.firstName) {
        errors.firstName = 'Please input first name';
    }
    if (!values.lastName) {
        errors.lastName = 'Please input last name';
    }
    if (!values.email) {
        errors.email = 'Please input email';
    }
    return errors;
}

const selector = formValueSelector('DemoForm');

const mapStateToProps = state => {
    return {
        initialValues: data,
        email: selector(state, "email"),
    };
};

const mapDispatchToProps = dispatch => ({
    // sendMailTest: payload =>
    //     dispatch({type: "SEND_MAIL_TEST", payload})
});
class DemoForm extends React.Component {
    constructor(props) {
        super(props);
        this.showResults = this.showResults.bind(this);
    }

    showResults (values){
        var url = '/uploadMultipleFiles';
        var formData = new FormData();
        var files = values.uploadfile;
    for(var index = 0; index < files.length; index++) {
        formData.append("files", files[index]);
    }
        

        return agent.asyncRequests.post(url, formData                
        ).then(function(res) {
            var result = res.body;
            if (result) {
                //backToList();
                alert('upload success');
            } else {
                toast.error("Có lỗi khi lưu trữ. Lỗi: " + result.errorMessage, {autoClose: 15000});
            }
        }, function(err) {
            toast.error("Có lỗi khi lưu trữ. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", {autoClose: 15000});
        });
    }

    componentWillMount() {
    }

    render() {
        const {
            handleSubmit,
            submitting,
            email
        } = this.props;

        var testParam = qs.parse(this.props.location.search).testParam;
        var testId = this.props.match.params.testId;

        var selectOptions = [
            { value: 'hanoi', label: 'Hà Nội' },
            { value: 'hochiminh', label: 'Hồ Chí Minh' }
        ];
        var defaultProvince = 'hochiminh';
        var currentValue = 'hanoi';
        // var defaultProvince = { value: 'hochiminh', label: 'Hồ Chí Minh' };

        return <form onSubmit={handleSubmit(this.showResults)}>
            <span>Test param: {testParam}</span>
            <span>Test Id: {testId}</span>
            <fieldset className="content-group">
                <Field name="firstName" label="First Name" placeholder="First Name 1" component={RenderInput}></Field>
                <Field name="lastName" label="Last Name" component={RenderInput}></Field>
                <Field name="email" label="Email" iconClass="icon-mail5" component={RenderInput}></Field>
                {/*<Field name="password" iconClass="icon-lock2" component={RenderPassword}></Field>*/}
                <Field name="province" label="Province" defaultValue={defaultProvince} options={selectOptions} component={RenderSelect}></Field>
                <Field name="province2" label="Province2" defaultValue={[]} options={selectOptions} component={RenderMultiSelect}></Field>
                <Field name="province3" label="Province3" options={selectOptions} component={RenderRadio}></Field>
                <Field name="birthday" label="Birthday" defaultValue={moment()} dateFormat={"DD/MM/YYYY"} component={RenderDatePicker}></Field>
                <Field name="uploadfile" abc={"hello"} component={ListFile}></Field>   
                <label className="checkbox-inline">
                    <div className="checker">

                        <Field name="remember" className="styled" checked="checked" component={RenderPlainCheckbox}></Field>

                    </div>
                    Tự động đăng nhập.
                </label>
                <button type="submit" disabled={submitting}>
                    Submit
                </button>
            </fieldset>
        </form>
    }
}

export default connect(
    mapStateToProps, mapDispatchToProps)(
    reduxForm({
        form: 'DemoForm',
        destroyOnUnmount: false,
        enableReinitialize: true,
        validate
})(DemoForm));