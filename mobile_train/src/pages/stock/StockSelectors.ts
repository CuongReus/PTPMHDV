import { createSelector } from 'reselect';
import { AppState } from '../../data/state';

const getStocks = (state: AppState) => {
  return state.liststock.stocks
};

const getSearch = (state: AppState) => state.liststock.searchNumber;

export const getFilteredStocks = createSelector(
  getStocks, getSearch,
  (stocks, searchNumber) => {
    if (!searchNumber) {
      return stocks;
    }
    return stocks.filter(stock => (stock.productId && stock.productId == searchNumber));
  }
)
