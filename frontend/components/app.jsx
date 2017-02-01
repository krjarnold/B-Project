const React = require('react');
const ProductList = require('./products/product_list');


const App = React.createClass({


  render() {

    return (
      <div className="app-container">
        <header className="header">
          <nav className="navbar">
            <div className="nav-logo">
              BONOBOS
            </div>
          </nav>
        </header>
        <div className="app-product-list">
          <ProductList/>
        </div>
      </div>
    );
  }
});


module.exports = App;
