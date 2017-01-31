const ProductApiUtil = {
  fetchProducts (cb) {
    $.ajax({
      url: "api/products",
      success (products) {
        cb(products);
      }
    });
  },

  getProduct (id, cb) {
    $.ajax({
      url: `api/products/${id}`,
      success (products) {
        cb(products);
      }
    });
  }
};

module.exports= ProductApiUtil;
