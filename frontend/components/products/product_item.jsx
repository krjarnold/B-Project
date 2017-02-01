const React = require('react');
const ProductStore = require('../../stores/product_store');
const ProductActions = require('../../actions/product_actions');
const hashHistory = require('react-router').hashHistory;

const ProductItem = React.createClass({

  getInitialState() {
    const potentialProduct = ProductStore.find(this.props.product.product_id);
    return {product: potentialProduct ? potentialProduct : {} };
  },

  componentDidMount() {
    this.token = ProductStore.addListener(this.getProduct);
    ProductActions.getProduct(Number(this.props.product.product_id));
  },

  componentWillUnmount() {
    this.token.remove();
  },

  getProduct() {
    const potentialProduct = ProductStore.find(this.props.product.product_id);
    this.setState({ product: potentialProduct ? potentialProduct : {} });
  },



  render() {

    if (!this.state.product) {
      return <div>Loading!</div>;
    } else {
      const productName = this.props.product.product_name;
      const productImage = this.props.product.product_image;
      const description = this.props.product.description;

      return(
        <div className= "product-container">
          {productName}
            <br />
          <img src= {productImage}></img>
            <br />
          {description}
        </div>
      );
    }
  }
});

module.exports = ProductItem;
