import React from 'react';
 import { connect } from 'react-redux';
 import agent from '../../services/agent';
 import { Modal } from 'react-bootstrap';
 import { RenderInputWithDiv, RenderInputWithGen, RenderTextArea, RenderDatePicker, RenderCheckbox, RenderSelect, RenderNumberInput, RenderMoneyFormat } from '../../components/formInputs';
 import { Field, reduxForm, formValueSelector } from 'redux-form';
 import isEmail from 'sane-email-validation';
 import { StringUtils } from '../../utils/javascriptUtils';
 import { toast } from 'react-toastify';
 import { translate } from 'react-i18next';
 import { LoadingScreen } from '../../components/commonWidgets';
 import { LOAD_UPDATING_STOCK_MOVEMENT_OUT } from './action-types';
 import { FIRE_REDIRECT } from '../../constants/action-types';
 import StockMovementOutputReport from '../../components/StockMovementOutputReport';
 import { isNull } from 'util';
 import moment from 'moment';
 const validate = values => {
     const errors = {};
     if (!values.quantity) {
         errors.quantity = 'Vui lòng nhập khối lượng xuất kho !';
     }
     if (!values.movementDate) {
         errors.movementDate =  "Vui lòng chọn ngày xuất kho !.";
     }
     if(!values.movementProductPrice){
         errors.movementProductPrice = "Giá thành sản phẩm không được để trống ! "
     }
     if(parseInt(values.preQuantity) < parseInt(values.quantity)){
         errors.quantity = "Số lượng xuất kho KHÔNG ĐƯỢC lớn hơn số lượng tồn kho!"
     }
     if(!values.movementType){
         errors.movementType = "Vui lòng chọn trạng thái xuất kho!"
     }
     return errors;
 }
 const selector = formValueSelector('ModalStockMovementOutput');
 const mapStateToProps = state => {
     var updateValue = {
         ...state.stockMovementOutputReducer.updatingStockMovementOutput,
         movementDate: state.stockMovementOutputReducer.updatingStockMovementOutput && state.stockMovementOutputReducer.updatingStockMovementOutput.movementDate ? moment(state.stockMovementOutputReducer.updatingStockMovementOutput.movementDate) : null,
         movementType:state.stockMovementOutputReducer.updatingStockMovementOutput && state.stockMovementOutputReducer.updatingStockMovementOutput.movementType ? moment(state.stockMovementOutputReducer.updatingStockMovementOutput.movementType) : "XUAT_KHO"
     };
     return {
         initialValues: updateValue,
         currentUser: state.common.currentUser,
         productId: selector(state, "product.id"),
         storageLocationId: selector(state,"storageLocationId"),
         movementProductPrice: selector(state,"movementProductPrice"),
         quantity: selector(state,"quantity")
 
     };
 };
 
 const mapDispatchToProps = dispatch => ({
     loadStockMovement: (payload) =>
         dispatch({ type: LOAD_UPDATING_STOCK_MOVEMENT_OUT, payload: payload }),
     updateField: (fieldName, value) =>
         dispatch({
             meta: { form: "ModalStockMovementOutput", field: fieldName },
             payload: value,
             type: "@@redux-form/CHANGE"
         })
 });
 
 
 class ModalStockMovementOutput extends React.Component {
     constructor(props) {
         super(props);
         this.state = {
             listAllProducts: [],
             listAllStorageLocation: [],
             listAllStock: [],
             listAllUsers: []
         }
         this.handleAdd = this.handleAdd.bind(this);
         this.handleHideAndClear = this.handleHideAndClear.bind(this);
         this.handleLoadProductPrice = (productId,storageLocationId) => {  
             const dataProduct = this.state.listAllProducts;
             const dataStock = this.state.listAllStock;
             const { updateField } = this.props;
             // var priceOfProduct = null;
             for (var i = 0; i < dataProduct.length; i++) {
                 if (dataProduct[i].id == productId) {
                     updateField("movementProductPrice", dataProduct[i].price);
                     break;
                 }
             }
             
          if (dataStock) {
             var productStock = null;
                     for (var i = 0; i < dataStock.length; i++) {
                         if (dataStock[i].product.id == productId && dataStock[i].storageLocation.id == storageLocationId) {
                             productStock = dataStock[i]
                             break;
                         };
                     }
                     if(productStock){
                         updateField("preQuantity", productStock.quantity);
                     }else{
                         updateField("preQuantity", '0');
                     }
                 }
            
         }
         this.handleTotalProductPrice = (quantity, movementProductPrice) => {
                 const { updateField } = this.props;
                 if (quantity && movementProductPrice) {
                     updateField("totalPrice", parseFloat(quantity) * parseInt(movementProductPrice));
                 }
             }
 
 
         }
     
 
     getListProduct() {
         let setStateInRequest = (list) => { this.setState({ listAllProducts: list }) }
         return agent.asyncRequests.get("/product/listAll").then(function (res) {
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
     getListStock() {
         let setStateInRequest = (list) => { this.setState({ listAllStock: list }) }
         return agent.asyncRequests.get("/stock/listAll").then(function (res) {
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
     getListStorageLocation() {
         let setStateInRequest = (list) => { this.setState({ listAllStorageLocation: list }) }
         return agent.asyncRequests.get("/storageLocation/listAll").then(function (res) {
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

     getListUser() {
         const { updateField,currentUser } = this.props;
         let setStateInRequest = (list) => { this.setState({ listAllUsers: list }) }
         return agent.asyncRequests.get("/user/listAll").then(function (res) {
             var result = res.body.resultData;
             if (result) {
                 if(currentUser){
                     updateField("user.id",currentUser.id)
                 }
                 setStateInRequest(result);
             } else {
                 toast.error("Có lỗi khi tải dữ liệu. Lỗi: " + result.errorMessage, { autoClose: 15000 });
             }
         }, function (err) {
             toast.error("Có lỗi khi tải dữ liệu. Quý khách vui lòng kiểm tra kết nối internet và thử lại. Hoặc liên hệ quản trị viên.", { autoClose: 15000 });
         });
     }

     componentWillMount() {
         const { loadStockMovement } = this.props;
      
         var id = this.props.idStockMovementOutput;
         const dataPromise = agent.StockMovementOutputApi.getStockMovementOutput(id);
         loadStockMovement(Promise.resolve(dataPromise));
         
         
         
         return (
             this.getListProduct(),
             this.getListStorageLocation(),
             this.getListStock(),
             this.getListUser()
 
         )
     }
 
 
     handleAdd(values) {
         var onHide = this.props.onHide;
         var id = this.props.idStockMovementOutput;
         var url = '/stockMovementOutput/add';
         if(values.quantity>0){
             values.quantity=  0 - values.quantity
         }
         if(values.totalPrice>0){
             values.totalPrice=  0 - values.totalPrice
         }
         var bodyObject = {
             product: values.product,
             movementDate: values.movementDate,
             preQuantity: values.preQuantity,
             quantity:values.quantity,
             user: values.user,
             movementStockOutputReportFile: values.movementStockOutputReportFile,
             stockMovementReport:values.stockMovementReport,
             movementProductPrice: values.movementProductPrice,
             totalPrice: values.totalPrice,
             invoiceNumber: values.invoiceNumber,
             storageLocation: values.storageLocation,
             movementType: values.movementType,
             note: values.note
         };
         if (id) {
             url = '/stockMovementOutput/update';
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
     handleHideAndClear() {
         const { destroy, onHide } = this.props;
         // event.preventDefault();
         onHide();
         destroy();
     }
     render() {
         // const { objectStockMovement, listfile, title, onHide } = this.props;
 
         const { handleSubmit, submitting, title, invalid, productId,quantity,storageLocationId, movementProductPrice } = this.props;
          const modalConfig = { show: this.props.show, bsSize: 'medium', onHide: this.props.onHide, submitting: this.props.submitting };
         var id = this.props.idStockMovement;
         const dataProduct = this.state.listAllProducts;
         const dataStorageLocation = this.state.listAllStorageLocation;
         const dataPersonels = this.state.listAllUsers;
         if (!dataProduct) {
             return null;
         }
         var optionPersonels = [];
         dataPersonels.map(item => {
             optionPersonels.push({ label: "Tên: " + item.fullName + " || " + "Email: "+ item.email, value: item.id })
         })
         var optionProducts = [];
         dataProduct.map(item => {
             optionProducts.push({ label: item.name, value: item.id })
         })
         var optionStorageLocation = [];
         dataStorageLocation.map(item => {
             optionStorageLocation.push({ label: item.locationName, value: item.id })
         })
 
        
         var optionMovementType = [{label:"Xuất Kho",value:"XUAT_KHO"},{label:"Hàng Hư" , values:"HANG_HU"}]
         var newModal = null;
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
                                  <Field name="user.id" label="Người Nhập Kho" placeholder="Chọn tên nhân viên..." options={optionPersonels} component={RenderSelect}></Field>
                                 <Field name="product.id" label="Tên Sản Phẩm" placesholder="Chọn tên sản phẩm..." options={optionProducts} onChangeAction={(value) => this.handleLoadProductPrice(value,storageLocationId)}  component={RenderSelect}></Field>
                                 <Field name="storageLocation.id" label="Địa Điểm Kho" placeholder="Chọn Địa Điểm Kho" options={optionStorageLocation} onChangeAction={(value) => this.handleLoadProductPrice(productId,value)}  component={RenderSelect}></Field>
                                 <Field name="movementDate" label="Ngày Xuất Kho" placeholder="Chọn ngày xuất kho..." component={RenderDatePicker}></Field>
                                 <Field name="movementStockOutputReportFile" label="Báo Cáo Xuất Kho" component={StockMovementOutputReport}></Field>
                                 <Field name="preQuantity" disabled={true} label="Số Lượng Trong Kho Hiện Tại" component={RenderNumberInput}></Field>
                                 <Field name="quantity" label="Số Lượng Xuất" placeholder="Số lượng xuất..." onChangeAction={(value) => this.handleTotalProductPrice(value,movementProductPrice)} component={RenderNumberInput}></Field>
                                 <Field name="movementProductPrice" label="Giá Sản Phẩm" placeholder="Nhập giá sản phẩm..." thousandSeparator={true} onChangeAction={(value) => this.handleTotalProductPrice(quantity,value)} component={RenderMoneyFormat}></Field>
                                 <Field name="totalPrice" label="Tổng Giá Sản Phẩm" placeholder="Nhập tổng giá sản phẩm..." thousandSeparator={true} component={RenderMoneyFormat}></Field>
                                 <Field name="invoiceNumber" label="Số Hoá Đơn" placeholder="Nhập số hoá đơn..." component={RenderInputWithDiv}></Field>
                                 <Field name="movementType" label="Trạng Thái Xuất" placeholder="Chọn Trạng Thái Xuất Kho..." options={optionMovementType} component={RenderSelect}></Field>
                                 <Field name="note" label="Ghi Chú" placeholder="Nhập ghi chú..." rows={3} component={RenderTextArea}></Field>
                                 <div className="text-right">
                                     <button type="button" className="btn btn-link" onClick={this.handleHideAndClear} >Hủy</button>
                                     <button type="submit" className="btn bg-orange" disabled={submitting || invalid}>Lưu</button>
                                 </div>
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
             form: 'ModalStockMovementOutput',
             destroyOnUnmount: true,
             enableReinitialize: true,
             validate
         })(ModalStockMovementOutput)));