const React = require('react');
const ProductList = require('./products/product_list');


const App = React.createClass({


  render() {
  
    return (
      <div className="app-container">BonobosHW
        <ProductList/>
      </div>
    );
  }
});


module.exports = App;
