const Store = require('flux/utils').Store;
const AppDispatcher = require('../dispatcher/dispatcher');

const ProductStore = new Store(AppDispatcher);

let _products = {};

ProductStore.all = function () {
  return Object.keys(_products).map( (key) => {
    return _products[key];
  });
};

ProductStore.find = function (id) {
  return _products[id];
};


ProductStore.addManyProducts = function (products) {
  _products = {};
  products.forEach( (product) => {
    _products[product.product_id] = product;
  });
};

ProductStore.__onDispatch = function (payload) {
  switch(payload.actionType) {
    case "RECEIVED_PRODUCTS":
      ProductStore.addManyProducts(payload.products);
      ProductStore.__emitChange();
      break;
  }
};

module.exports = ProductStore;
