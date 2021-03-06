const ProductApiUtil = require('../util/product_api_util');
const AppDispatcher = require('../dispatcher/dispatcher');
const hashHistory = require('react-router').hashHistory;

const ProductActions = {
  fetchProducts() {
    ProductApiUtil.fetchProducts(this.receiveAll);
  },

  getProduct(id) {
    ProductApiUtil.getProduct(id, this.receiveProduct);
  },

  receiveAll (products) {
    AppDispatcher.dispatch({
      actionType: "RECEIVED_PRODUCTS",
      products: products
    });
  },

  receiveProduct (product) {
    AppDispatcher.dispatch({
      actionType: "RECEIVED_PRODUCT",
      product: product
    });
  }
};

module.exports = ProductActions;
