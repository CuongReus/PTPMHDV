import React, { useState, useRef, useEffect } from 'react';
import { IonToolbar, IonContent, IonPage, IonButtons, IonMenuButton, IonSegment, IonSegmentButton, IonButton, IonIcon, IonSearchbar, IonRefresher, IonRefresherContent, IonToast, IonModal, IonHeader, getConfig, IonTitle, IonList, IonItem, IonLabel, IonItemSliding, IonAvatar } from '@ionic/react';
import { connect } from '../../data/connect';
import { options } from 'ionicons/icons';
import '../ListPage.scss'
import * as stockselectors from './StockSelectors';
import { Stock } from './Stock';
import { loadListStock } from './liststock.actions';
import { setSearchNumber} from './liststock.actions';


interface OwnProps { }

interface StateProps {
  listStocks: Stock[];
  mode: 'ios' | 'md'
}

interface DispatchProps {
  setSearchNumber: typeof setSearchNumber;
  loadListStock: typeof loadListStock;
}

type ListStockPageProps = OwnProps & StateProps & DispatchProps;

const ListStockPage: React.FC<ListStockPageProps> = ({ listStocks, setSearchNumber,loadListStock, mode }) => {
  const [showFilterModal, setShowFilterModal] = useState(false);
  const ionRefresherRef = useRef<HTMLIonRefresherElement>(null);
  const [showCompleteToast, setShowCompleteToast] = useState(false);

  const doRefresh = () => {
    setTimeout(() => {
      ionRefresherRef.current!.complete();
      setShowCompleteToast(true);
    }, 2500)
  };

  // const listStocks = [{id: 1, name: "Nguyễn Văn A", email: "nguyenvana@gmail.com", phone: "0909825783"},
  //                 {id: 2, name: "Nguyễn Văn B", email: "nguyenvana@gmail.com", phone: "0909825783"},
  //                 {id: 3, name: "Nguyễn Văn C", email: "nguyenvana@gmail.com", phone: "0909825783"}];

  useEffect(() => {
    loadListStock();
  }, []);

  return (
    <IonPage id="list-stock-page" className="list-page">
      <IonHeader>
        <IonToolbar>
          <IonButtons slot="start">
            <IonMenuButton />
          </IonButtons>

          <IonTitle>Danh Sách Nhân Viên</IonTitle>

        </IonToolbar>

        <IonToolbar>
          <IonSearchbar
            placeholder="Tìm tên, email, phone"
            onIonChange={(e: CustomEvent) => setSearchNumber(e.detail.value)}
          />
        </IonToolbar>
      </IonHeader>

      <IonContent>
        <IonRefresher slot="fixed" ref={ionRefresherRef} onIonRefresh={doRefresh}>
          <IonRefresherContent />
        </IonRefresher>
        {/* <IonToast
          isOpen={showCompleteToast}
          message="Refresh complete"
          duration={2000}
          onDidDismiss={() => setShowCompleteToast(false)}
        /> */}

        <IonList>
        {listStocks.map((stock, index: number) => (
          <IonItemSliding key={stock.id}>
            <IonItem routerLink={`/editStock/${stock.id}`}> 
              <IonLabel>
                <h3> Mã {stock.product.code} - Loại {stock.product.productCategory.name}</h3>
                <p>
                Tên: {stock.product.name}
                </p>
                <p>
                Kho: {stock.storageLocation.locationName} - Tồn : {stock.quantity}
                </p>
                
              </IonLabel>
            </IonItem>
          </IonItemSliding>
          
        ))}
      </IonList>
      </IonContent>

      <IonModal
        isOpen={showFilterModal}
        onDidDismiss={() => setShowFilterModal(false)}
      >
      </IonModal>

    </IonPage>
  );
};

export default connect<OwnProps, StateProps, DispatchProps>({
  mapStateToProps: (state) => ({
    listStocks: stockselectors.getFilteredStocks(state),
    mode: getConfig()!.get('mode')
  }),
  mapDispatchToProps: {
    setSearchNumber, loadListStock
  },
  component: React.memo(ListStockPage)
});