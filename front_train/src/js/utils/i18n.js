import i18n from 'i18next';
import LanguageDetector from 'i18next-browser-languagedetector';

// https://phraseapp.com/blog/posts/react-i18n-best-libraries/

i18n
    .use(LanguageDetector)
    .init({
        // we init with resources
        resources: {
            en: {
                translations: {
                    "Welcome to React.js": "Welcome to React.js",
                    "Declarative": "Declarative"
                    
                }
            },
            vi: {
                translations: {
                    "Welcome to React.js": "Chào mừng đến với React.js!",
                    "Declarative": "Khai báo",
                    
                    "admin.users": "Màn Hình Quản Lý Nhân Viên",
                    "admin.users.read": "Xem nhân viên",
                    "admin.users.create": "Thêm mới nhân viên",
                    "admin.users.update": "Sửa nhân viên",
                    "admin.users.delete": "Xóa nhân viên",
                    
                    "admin.roles": "Màn Hình Phân Quyền",
                    "admin.roles.read": "Xem phân quyền",
                    "admin.roles.create": "Thêm mới phân quyền",
                    "admin.roles.update": "Sửa phân quyền",
                    "admin.roles.delete": "Xóa phân quyền",
                    
                    "admin.stock": "Màn Hình Quản Lý Kho",
                    // "admin.stock.read": "Xem tồn kho",
                    // "admin.stock.create": "Thêm tồn kho",
                    // "admin.stock.update": "Cập nhật tồn kho",
                    // "admin.stock.delete": "Xóa tồn kho",
                    
                    "admin.stockLocation": "Màn Hình Địa Điểm Kho",
                    "admin.stockLocation.read": "Xem địa điểm kho",
                    "admin.stockLocation.create": "Thêm địa điểm kho",
                    "admin.stockLocation.update": "Sửa địa điểm kho",
                    "admin.stockLocation.delete": "Xóa địa điểm kho",
                    
                    "admin.holiday":"Ngày Phép",
                    "admin.holiday.read":"Xem Ngày Phép",
                    "admin.holiday.create":"Tạo Ngày Phép",
                    "admin.holiday.update":"Chỉnh Sửa Ngày Phép",
                    "admin.holiday.approvalLetter": "Quyền Duyệt Đơn",
                    "admin.holiday.delete":"Xoá Ngày Phép",

                    // "admin.stock":"Kho",
                    "admin.stock.read":"Xem Thông Tin Kho",
                    "admin.stock.create":"Nhập - Xuất Kho",
                    // "admin.stock.update",
                    // "admin.stock.delete":
                    "admin.product":"Màn Hình Sản Phẩm Sơn",
                    "admin.product.read":"Xem Sản Phẩm ",
                    "admin.product.create":"Thêm Mới Sản Phẩm",
                    "admin.product.update":"Chỉnh Sửa Sản Phẩm",
                    "admin.product.delete":"Xóa Sản Phẩm",
                    "admin.productCategory":"Màn Hình Phân Loại Sản Phẩm",
                    "admin.productCategory.read":"Xem Phân Loại Sản Phẩm",
                    "admin.productCategory.create":"Tạo Mới Loại Sản Phẩm",
                    "admin.productCategory.update":"Chỉnh Sửa Loại Sản Phẩm",
                    "admin.productCategory.delete":"Xóa Loại Sản Phẩm",
                    "admin.supplier":"Màn Hình Nhà Cung Cấp",
                     "admin.supplier.read":"Xem Nhà Cung Cấp",
                    "admin.supplier.create": "Tạo Mới Nhà Cung Cấp",
                    "admin.supplier.update":"Chỉnh Sửa Nhà Cung Cấp",
                    "admin.supplier.delete": "Xóa Nhà Cung Cấp",
                    "admin.company":"Màn Hình Dự Án Công Ty",
                    "admin.company.read":"Xem Danh Sách Công Ty",
                    "admin.company.create":"Tạo Mới Công Ty",
                    "admin.company.update":"Chỉnh Sửa Công Ty",
                    "admin.company.delete":"Xóa Công Ty",
                    "admin.labourSalary":"Lương Nhân Công",
                    "admin.labourSalary.read":"Xem Lương Nhân Công",
                    // "admin.labourSalary.create":,
                    "admin.labourSalary.update":"Chỉnh Sửa Lương Nhân Công",
                    // "admin.labourSalary.delete"

                    "admin.project" : "Màn Hình Quản Lý Dự Án",
                    "admin.project.read": "Xem thông Tin Dự Án",
                    "admin.project.create": "Thêm Mới Dự Án",
                    "admin.project.update": "Cập Nhật Dự Án",
                    "admin.project.delete": "Xoá Dự Án",

                    "admin.projectDetail": "Màn Hình Quản Lý Công Việc",
                    "admin.projectDetail.read": "Cho Phép Xem Công Việc",
                    "admin.projectDetail.create": "Cho Phép Thêm Mới Công Việc",
                    "admin.projectDetail.update": "Cho Phép Thay Đổi Công Việc",
                    "admin.projectDetail.delete": "Cho Phép Xoá Công Việc",

                    "admin.company.goToProjectYear": "Đi đến dự án theo năm",
                    "admin.projectProgress": "Quy Trình Dự Án",
                    "admin.projectProgress.read": "Xem Quy Trình",
                    "admin.projectProgress.quotationC&U"   : "Thao Tác Bước 1: Báo Giá",
                    "admin.projectProgress.approvalC&U"    : "Thao Tác Bước 2: Trạng Thái Duyệt",
                    "admin.projectProgress.contractC&U"    : "Thao Tác Bước 3: Hợp Đồng ",
                    "admin.projectProgress.invoiceVer1C&U" : "Thao Tác Bước 4: Hoá Đơn Lần 1",
                    "admin.projectProgress.efficientC&U"   : "Thao Tác Bước 5: Thực Hiện ",
                    "admin.projectProgress.invoiceVer2C&U" : "Thao Tác Bước 6: Hoá Đơn Lần 2",
                    "admin.projectProgress.completeC&U"    : "Thao Tác Bước 7: Hoàn Thành",
                    "admin.projectProgress.acceptanceC&U"  : "Thao Tác Bước 8: Nghiệm Thu",
                    "admin.projectProgress.invoiceVer3C&U" : "Thao Tác Bước 9: Hoá Đơn Lần 3",
                    "admin.projectProgress.incurredC&U"    : "Thao Tác Bước 10: Phát Sinh",
                    "admin.projectProgress.closeProjectC&U": "Thao Tác Bước 11: Đóng Dự Án",

                    "admin.labour": "Màn Hình Quản Lý Nhân Công",
                    "admin.labour.read": "Xem Nhân Công",
                    "admin.labour.create": "Thêm Mới Nhân Công",
                    "admin.labour.update": "Cập Nhật Nhân Công",
                    "admin.labour.delete": "Xoá Nhân Công",

                    //constructionTeam : Đội Thi Công
                    "admin.constructionTeam" : "Đội Thi Công",
                    "admin.constructionTeam.read" : "Cho phép xem",
                    "admin.constructionTeam.create" : "Cho phép thêm mới đội thi công",
                    "admin.constructionTeam.update" : "Cho phép chỉnh sửa đội thi công",
                    "admin.constructionTeam.delete" : "Cho phép xoá đội thi công",

                    "admin.labourAttendance": "Màn Hình Quản Lý Chấm Công",
                    "admin.labourAttendance.forSupervisor": "Thuộc Về Giám Sát",
                    "admin.labourAttendance.forAttendanceDepart": "Thuộc Về Bộ Phận Tổng Công",
                    "admin.labourAttendance.create": "Cho Phép Chấm Công",
                    "admin.labourAttendance.update": "Chỉnh Sửa Ngày Công",
                    "admin.labourAttendance.delete": "Xoá Ngày Công",

                    "admin.totalRevenue" : "Màn Hình Tổng Doanh Thu",
                    "admin.totalRevenue.check": "Hiện Tổng Doanh Thu",

                    "admin.Approval.check": "Cho Phép Duyệt",

                    //leaveType
                    "ANNUAL_HOLIDAY":"Nghỉ phép",
                    "ALTERNATIVE_LEAVE":"Nghỉ bù",
                    "SICK_LEAVE":"Nghỉ Bệnh(Có bảo hiểm)",
                    "MATERNITY_LEAVE":"Nghỉ thai sản",
                    "MARRIAGE_LEAVE":"Nghỉ cưới",
                    "MOURNING_LEAVE":"Nghỉ có tang",
                    "TANG_CA_THUONG_TOI": "Tăng Ca Thường",
                    "KHONG": "Không",
                    
                    
                  
                }
            }
        },
        fallbackLng: 'vi',
        debug: true,

        // have a common namespace used around the full app
        ns: ['translations'],
        defaultNS: 'translations',

        keySeparator: false, // we use content as keys

        interpolation: {
            escapeValue: false, // not needed for react!!
            formatSeparator: ','
        },

        react: {
            wait: true
        }
    });

export default i18n;
