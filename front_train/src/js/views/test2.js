import React from 'react';
 import qs from 'query-string';
 import { toast } from 'react-toastify';
 import { translate } from 'react-i18next';
 import { ScriptUtils, FormatterUtils,UrlUtils } from '../../utils/javascriptUtils';
 import TablePagination from '../../components/TablePagination';
 import agent from '../../services/agent';
 import { Link } from 'react-router-dom';
 import ModalStockMovementInput from '../stockMovementInput/ModalStockMovementInput';
 import ModalStockMovementOutput from '../stockMovementOutput/ModalStockMovementOutput';
 import { API_ROOT_DOWNLOAD } from '../../constants/ConfigConstants';
 
 
 
 
 const StockRow = (props) => {
     var sumInputQuantity = 0;
     var sumInputPrice = 0;
     var sumOuputQuantity = 0;
     var sumOuputPrice = 0;
     // For LocationStorage
     var sumInputQuantityOfTPHCMStorage = 0;
     var sumInputQuantityOfBDStorage = 0;
     var sumOutputQuantityOfTPHCMStorage = 0;
     var sumOutputQuantityOfBDStorage = 0;
     var sumTotalQuantityTPHCMStorage =0;
     var sumTotalQuantityBDStorage =0;
     var sumTotalPriceTPHCMStorage =0;
     var sumTotalPriceBDStorage =0;
 
     const { item, deleteStock, handleShowMovements,handleShowStockMovementInputModalEdit,handleShowStockMovementOutputModalEdit,handleShowStockMovementInputModalAddMore,
         handleShowStockMovementOutputModalAddMore, movementsByStockId,currentNo } = props;
     var mvRows = null;
     var quanityAndPriceSumRow = null;
     if (movementsByStockId && movementsByStockId.isShown) {
         mvRows = movementsByStockId.listMovements.map(movement => {
             ///////////--- Start Sum Quantity----/////////////
             if(movement.movementType == "NHAP_KHO"){
                 // SumTotal Quantity & Price InputStock
                 sumInputQuantity =  sumInputQuantity + movement.quantity;
                 sumInputPrice = sumInputPrice + movement.totalPrice
                 // Sumtotal Quantity & Price  InputStockTPHCM
                 if(movement.storageLocation == 'BINH_DUONG'){
                     sumInputQuantityOfBDStorage = sumInputQuantityOfBDStorage + movement.quantity;
                 }
                 else if(movement.storageLocation == 'TPHCM'){
                     sumInputQuantityOfTPHCMStorage = sumInputQuantityOfTPHCMStorage + movement.quantity
                 }
             }else if (movement.movementType == "XUAT_KHO"){
                 // SumTotal Quantity & Price  OutputStock
                 sumOuputQuantity = sumOuputQuantity + movement.quantity;
                 sumOuputPrice =  sumOuputPrice + movement.totalPrice;
                 // Sumtotal Quantity & Price  OutputStockBINHDUONG
                 if(movement.storageLocation == 'BINH_DUONG'){
                     sumOutputQuantityOfBDStorage = sumOutputQuantityOfBDStorage + movement.quantity;
                 }else if (movement.storageLocation == 'TPHCM'){
                     sumOutputQuantityOfTPHCMStorage =sumOutputQuantityOfTPHCMStorage +  movement.quantity;;
                 }
             }
            ///////////--- End Sum Quantity----/////////////
             sumTotalQuantityTPHCMStorage = sumInputQuantityOfTPHCMStorage - sumOutputQuantityOfTPHCMStorage;
             sumTotalQuantityBDStorage =  sumInputQuantityOfBDStorage - sumOutputQuantityOfBDStorage;
            
             
             return (<tr style={{ borderColor: "inherit" }} key={movement.id}>
                 <td colSpan='3'></td>
         {movement.movementType == "NHAP_KHO"  ?  <td> Người Nhập Kho:  {movement.user.fullName} </td> : <td> Người Xuất Kho: {movement.user.fullName} </td> } 
         <td>Trạng Thái: {movement.movementType == "NHAP_KHO" ? 
             <a onClick={() => handleShowStockMovementInputModalEdit(movement.id)}>{movement.movementType}</a> : 
             <a onClick={() => handleShowStockMovementOutputModalEdit(movement.id)}>{movement.movementType}</a> }
             </td>
                 <td>Ngày: {movement.movementDate}</td>
                 <td>{movement.storageLocation}</td>
                 <td>Số Lượng: {movement.quantity}</td>
                 <td>Tổng Tiền: {FormatterUtils.formatCurrency(movement.totalPrice)}</td>
                 <td colSpan='3'></td>
             </tr>)
         });
         quanityAndPriceSumRow =
 
         [<tr className="warning">
             <td colSpan="4"></td>
             <td><h6>Tổng Số Lượng Nhập: {sumInputQuantity}</h6></td>
             <td><h6>Tổng Tiền Nhập: {FormatterUtils.formatCurrency(sumInputPrice)}</h6> </td>
             <td><h6>Tổng Số Lượng Xuất: {sumOuputQuantity}</h6> </td>
             <td><h6>Tổng Tiền Xuất: {FormatterUtils.formatCurrency(sumOuputPrice)}</h6></td>
             <td colSpan="3"></td>
 
 
         </tr>]
     }
 
 
 
     
    
     return (
         [<tr key={item.id} className="success">
             <td>{currentNo}</td>
             {/* <td><img src={API_ROOT_DOWNLOAD+item.image} width={100} height={100}/></td> */}
             <td>{item.storageLocation.locationName}</td>
             <td>{item.product.name}</td>
             <td>{item.product.code}</td>
             <td>{item.product.unit}</td>
             <td>{item.product.productCategory.name}</td>
             <td>{item.product.size}</td>
             <td>{item.product.price}</td>
             <td>{item.totalQuantityOfTPHCMStock}</td>
             <td>{FormatterUtils.formatCurrency((item.product.price)*(item.totalQuantityOfTPHCMStock))}</td>
             <td>{item.totalQuantityOfBDStock}</td>
             <td>{FormatterUtils.formatCurrency((item.product.price)*(item.totalQuantityOfBDStock))}</td>
             <td><a onClick={() => handleShowMovements(item)}>{item.quantity}</a></td>
             <td>{FormatterUtils.formatCurrency(item.latestProductPrice)}</td>
             <td>{item.note}</td>
             <td className="text-center footable-visible footable-last-column">
                 <ul className="icons-list">
                     <li className="dropdown">
                         <a href="#" className="dropdown-toggle" data-toggle="dropdown">
                             <i className="icon-menu9"></i>
                         </a>
                         <ul className="dropdown-menu dropdown-menu-right">
                             {/* TODO Load Right Product Id that want to input or output Stock */}
                             <li><a onClick={() => handleShowStockMovementInputModalAddMore(item)}><i className="icon-plus3"></i>Nhập Kho</a></li>
                             <li><a onClick={() => handleShowStockMovementOutputModalAddMore(item)}><i className="icon-rotate-cw"></i>Xuất Kho</a></li>
                             <li><a onClick={() => deleteStock(item.id)}><i className="icon-cross2"></i>Xóa</a></li>
 
                         </ul>
                     </li>
                 </ul>
             </td>
         </tr>].concat(quanityAndPriceSumRow,mvRows)
     )
 }
 let getMovementsByStockId = (listMovementsByStockId, stockId) => {
     for (var i = 0; i < listMovementsByStockId.length; i++) {
         if (listMovementsByStockId[i].stockId == stockId) {
             return listMovementsByStockId[i];
         }
     }
     return null;
 }
 
 class StockList extends React.Component {
     constructor(props) {
         super(props);
         this.state = {
             listStock: null,
             listAllStorageLocation: [],
             listAllProductCategory: [],
             isStockMovementInputModalShown: false,
             isStockMovementOutputModalShown: false,
             stockDto: null,
             listMovementsByStockId: [],// [{stockId, listMovements,isShown}, ....]
             reloadNum: 1
         }
         this.handleShowStockMovementInputModalEdit = this.handleShowStockMovementInputModalEdit.bind(this);
         this.handleShowStockMovementOutputModalEdit = this.handleShowStockMovementOutputModalEdit.bind(this);
         this.handleShowStockMovementInputModalAddMore= this.handleShowStockMovementInputModalAddMore.bind(this);
         this.handleShowStockMovementOutputModalAddMore= this.handleShowStockMovementOutputModalAddMore.bind(this);
         this.updateListStock = this.updateListStock.bind(this);
         this.handleShowMovements = this.handleShowMovements.bind(this);
         this.handleHideStockMovementInputmodal = () => {
             this.setState({ isStockMovementInputModalShown: false });
             this.updateListStock();
         };
         this.handleHideStockMovementOutputmodal = () => {
             this.setState({ isStockMovementOutputModalShown: false });
             this.updateListStock();
         };
 
 
 
 
     };
     //TODO LOAD RIGTH ADD AND UPDATE LIST STOCK MOVEMENT 
     updateListStock() {
     var search = qs.parse(this.props.location.search).search;
         search = search ? search : "";
         var page = qs.parse(this.props.location.search).page;
         this.getListStorageLocation();
         this.getListProductCategory();
         //---------- 
         var productCategory = qs.parse(this.props.location.search).productCategory;
         productCategory = productCategory ? productCategory : "ALL";
         let setStateInRequest = (list) => { this.setState({ listStock: list }) }
         return agent.asyncRequests.getPage('/stock/findProductCategoryIdAndProductName?productCategoryId='+productCategory +  '&productName=' + search, page
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
     getListProductCategory() {
         let setStateInRequest = (list) => { this.setState({ listAllProductCategory: list }) }
         return agent.asyncRequests.get("/productCategory/listAll").then(function (res) {
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
        this.updateListStock();
     };
 
     componentDidUpdate() {
         ScriptUtils.loadFootable();
     }
     //Delete Stock Function
     deleteStock(id, fullName) {
 
         if (confirm("Bạn có chắc sẽ xoá Nhân Viên: " + "'" + fullName + "'")) {
             var url = `/stock/${id}`;
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
     handleShowMovements(stock) {
         // if(this.state.listMovementsByStockId){
         var listMv = this.state.listMovementsByStockId;
         var reloadNum = this.state.reloadNum;
 
         var mbs = getMovementsByStockId(listMv, stock.id);
         if (mbs && mbs.isShown) {
             mbs.isShown = false;
             this.setState({ reloadNum: reloadNum + 1 });
             return;
         }
         let setStateInRequest = (list) => {
             var movementsByStockId = getMovementsByStockId(this.state.listMovementsByStockId, stock.id)
             if (movementsByStockId) {
                 movementsByStockId.listMovements = list;
                 movementsByStockId.isShown = true;
             } else {
                 listMv.push({ stockId: stock.id, listMovements: list, isShown: true });
             }
             this.setState({ listMovementsByStockId: listMv });
             this.setState({ reloadNum: reloadNum + 1 });
         }
         return agent.asyncRequests.get('/stock/findMovementByProductId?productId=' + stock.product.id).then(function (res) {
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
     handleShowStockMovementInputModalEdit(id) {
         this.setState({
             isStockMovementInputModalShown: true,
             idStockMovementInput: id,
         });
     }
     handleShowStockMovementOutputModalEdit(id) {
         this.setState({
             isStockMovementOutputModalShown: true,
             idStockMovementOutput: id
         });
     }
     handleShowStockMovementInputModalAddMore(stockDto) {
         this.setState({
             isStockMovementInputModalShown: true,
             stockDto:stockDto,
             idStockMovementInput: null,
         });
     }
     handleShowStockMovementOutputModalAddMore(stockDto) {
         this.setState({
             isStockMovementOutputModalShown: true,
             stockDto:stockDto,
             idStockMovementOutput: null
         });
 
     }
     render() {
         var baseUrl = UrlUtils.getPathWithParamsNotPaging();
         const data = this.state.listStock;
         const dataProductCategory = this.state.listAllProductCategory;
         if (!data) {
             return null;
         }
         var currentNo = 0;
         var page = qs.parse(this.props.location.search).page;
         if(!page){
             page = 1;
         }
         var currentNo = ((page-1)* 20);
  var rows = data.content.map(item => {
  var rows = data.map(item => {
             currentNo++;
             return (<StockRow key={item.id} item={item}
                 currentNo={currentNo}
                  movementsByStockId={getMovementsByStockId(this.state.listMovementsByStockId, item.id)}
                 deleteStock={this.deleteStock}
                 handleShowStockMovementInputModalAddMore={this.handleShowStockMovementInputModalAddMore}
                 handleShowStockMovementOutputModalAddMore={this.handleShowStockMovementOutputModalAddMore}
                 handleShowStockMovementInputModalEdit={this.handleShowStockMovementInputModalEdit}
                 handleHideStockMovementInputmodal={this.handleHideStockMovementInputmodal}
                 handleShowStockMovementOutputModalEdit={this.handleShowStockMovementOutputModalEdit}
                 handleHideStockMovementOutputmodal={this.handleHideStockMovementOutputmodal}
                 handleShowMovements={this.handleShowMovements}></StockRow>)
         });
         var search = qs.parse(this.props.location.search).search;
         if (!search) {
             search = "";
         }
      
         var productCategory = qs.parse(this.props.location.search).productCategory;
         if (!productCategory) {
             productCategory = "ALL";
         }
         var optionProductCategory = [];
         dataProductCategory.map(item => {
             optionProductCategory.push({ label: item.name, value: item.id })
         })
         return (
 
             <div className="content-wrapper">
 
 
                 <div className="content">
                     <div className="page-header">
                         <h4>
                             <i className=" icon-paragraph-justify2 position-left"></i>
                             <span className="text-semibold">Danh sách Tồn Kho</span>
                             <span className="pull-right">
                              
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
                                                 <label className="control-label col-md-3" htmlFor="productCategory">Loại Sản Phẩm</label>
                                                 <div className="col-md-9">
                                                     <select placeholder="Tất cả" className="select form-control" name="productCategory" defaultValue={productCategory}>
                                                         <option key="ALL" value="ALL">Tất cả</option>
                                                         {optionProductCategory.map(productCategory => <option key={productCategory.value} value={productCategory.value}>{productCategory.label}</option>)}
                                                     </select>
                                                     </div>
                                             </div>
                                         </div>
                                         <div className="input-group content-group">
                                             <div className="has-feedback has-feedback-left">
                                                 <input type="text" className="form-control input-xlg" placeholder="" name="search" defaultValue={search} autoFocus={true} />
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
                             {this.state.isStockMovementInputModalShown ? <ModalStockMovementInput title="Nhập Kho" idStockMovementInput={this.state.idStockMovementInput} stockDto={this.state.stockDto} show={this.state.isStockMovementInputModalShown} onHide={this.handleHideStockMovementInputmodal} /> : null}
                             {this.state.isStockMovementOutputModalShown ? <ModalStockMovementOutput title="Xuất Kho" idStockMovementOutput={this.state.idStockMovementOutput}stockDto={this.state.stockDto}  show={this.state.isStockMovementOutputModalShown} onHide={this.handleHideStockMovementOutputmodal} /> : null}
 
                             <div className="panel panel-flat">
                                 <table className="table table-togglable table-hover">
                                  <thead>
                                      <tr className="bg-green">
                                          <th data-toggle="true">STT</th>
                                          <th data-hide="phone">Tên Sản Phẩm</th>
                                          <th data-hide="phone">Mã Sản Phẩm</th>
                                          <th data-hide="phone">Đơn Vị</th>
                                          <th data-hide="phone">Size</th>
                                          <th data-hide="phone">Giá Sản Phảm</th>
                                          <th data-hide="phone">Loại Sản Phẩm</th>
                                          <th data-hide="phone">Tổng Tồn Kho Trường Sa</th>
                                          <th data-hide="phone">Tổng Tiền Tồn Kho Trường Sa</th>
                                          <th data-hide="phone">Tổng Tồn Kho Bình Dương</th>
                                          <th data-hide="phone">Tổng Tiền Tồn Kho Bình Dương</th>
                                          <th data-hide="phone">Tổng Số Lượng Tồn (2 Kho)</th>
                                          <th data-hide="phone">Tổng Tiền Tồn Kho</th>
                                          <th data-hide="phone">Ghi Chú</th>
                                          <th className="text-center footable-visible footable-last-column" style={{ width: '30px' }}><i className="icon-menu-open2"></i></th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      {rows}
                                  </tbody>
                                 
                                 {thOfStorageLocation}

                                 </table>
                             </div>
                             <TablePagination data={data} baseUrl={baseUrl} />
