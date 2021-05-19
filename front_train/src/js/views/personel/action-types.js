import { SecurityUtils } from "../../utils/javascriptUtils";

export const LOAD_UPDATING_PERSONEL = 'LOAD_UPDATING_PERSONEL';
export const LOAD_UPDATING_ROLE = 'LOAD_UPDATING_ROLE';

export const ALL_ROLES = [
    {
        moduleName: "Nhân Sự",
        entities: [
            {
                entityName: "admin.users",
                keys: [
                    "admin.users.read",
                    "admin.users.create",
                    "admin.users.update",
                    "admin.users.delete"
                ]
            },
            {
                entityName: "admin.roles",
                keys: [
                    "admin.roles.read",
                    "admin.roles.create",
                    "admin.roles.update",
                    "admin.roles.delete"
                ]
            }
        ]
    },
    {
        moduleName: "Quản lý Nhà Cung Cấp",
        entities: [
            {
                entityName: "admin.supplier",
                keys: [
                    "admin.supplier.read",
                    "admin.supplier.create",
                    "admin.supplier.update",
                    "admin.supplier.delete"
                ]
            }
        ]
    },
    
  
]

