import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';
import { withRouter } from 'react-router-dom';
import SecuredComponent from './SecuredComponent';

const mapStateToProps = state => ({
	currentUser: state.common.currentUser,
});

const mapDispatchToProps = dispatch => ({

});

class SideBar extends React.Component {
	constructor() {
		super();
	};
	render() {
		// viewChangeCounter is used to update the color active link of sidebar
		const { currentUser } = this.props;
		if (!currentUser) {
			return "";
		}
		return (
			<div className="sidebar sidebar-main">
				<div className="sidebar-content">
					<div className="sidebar-category sidebar-category-visible">
						<div className="category-content no-padding">
							<ul className="navigation navigation-main navigation-accordion">

								<li className="active">
									<Link to='/#'><i
										className="icon-user"></i> <span>Quản Lý Nhân Sự</span></Link>
									<ul>
										<SecuredComponent allowedPermission="admin.users.read">
											<li><Link to='/listPersonel'><i className="icon-users"></i>
												<span>Nhân Sự</span></Link>
											</li>
										</SecuredComponent>
										<SecuredComponent allowedPermission="admin.roles.read">
											<li><Link to='/listRole'><i className="icon-user-check"></i>
												<span>Phân Quyền Hệ Thống</span></Link>
											</li>
										</SecuredComponent>
										<SecuredComponent allowedPermission="admin.supplier.read">
										<li><Link to='/listSupplier'><i className="icon-user-check"></i>
												<span>Danh sách Nhà Cung Cấp</span></Link>
											</li>
										</SecuredComponent>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		);
	}
}
																																			
export default connect(mapStateToProps, mapDispatchToProps)(withRouter(SideBar));