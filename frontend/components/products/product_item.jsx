const React = require('react');
const ProductStore = require('../../stores/product_store');
const ProductActions = require('../../actions/product_actions');
const InventoryList = require('../inventories/inventory_list');
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

      const inventory = this.props.product.inventory;
      // let listOfInventory = this.props.product.inventory.map( (inventory, i) => {
      //   return (<InventoryList key={i} inventory={inventory} />);
      // });

      return(
        <div className= "product-container">
          {productName}
            <br />
          <img src= {productImage}></img>
            <br />
          {description}
          <br />
          <InventoryList inventory= {inventory} />
        </div>
      );
    }
  }
});

module.exports = ProductItem;
