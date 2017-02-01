const React = require('react');
const ProductStore = require('../../stores/product_store.js');
const ProductActions = require('../../actions/product_actions');
const ProductItem = require('./product_item');
const hashHistory = require('react-router').hashHistory;

const ProductList= React.createClass({

  getInitialState() {
      return { products: [] };
    },

    componentDidMount() {
      this.token = ProductStore.addListener(this.getProducts);
      ProductActions.fetchProducts();
    },

    componentWillUnmount() {
      this.token.remove();
    },

    getProducts() {
      this.setState({ products: ProductStore.all() });
    },

    render() {
      let listOfProducts = this.state.products.map( (product, i) => {
        return (<ProductItem key={i} product={product} />);
      });
    
      // if (listOfProducts.length <= 0) {
      //   listOfProducts = <li>Hang on, our products will be here momentarily</li>;
      // }

      return(
        <div className= "product-list-container">products
          <ul className= "product-list">
            {listOfProducts}
          </ul>
        </div>
      );

    }


});

module.exports = ProductList;
