const React = require('react');
const ProductStore = require('../../stores/product_store');
const ProductActions = require('../../actions/product_actions');
const hashHistory = require('react-router').hashHistory;

const ProductItem = React.createClass({

  getInitialState() {
    const potentialProduct = ProductStore.find(this.props.params.productId);
    return {product: potentialProduct ? potentialProduct : {} };
  },

  componentDidMount() {
    this.token = ProductStore.addListener(this.getProduct);
    ProductActions.getProduct(Number(this.props.params.productId));
  },

  componentWillUnmount() {
    this.token.remove();
  },

  getProduct() {
    const potentialProduct = ProductStore.find(this.props.params.productId);
    this.setState({ product: potentialProduct ? potentialProduct : {} });
  },



  render() {
    if (!this.state.product) {
      return <div>Loading!</div>;
    } else {
      return(
        <div className= "product-container">check what to put here
        </div>
      );
    }
  }
});

module.exports = ProductItem;
