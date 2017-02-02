const React = require('react');
const ReactDOM = require('react-dom');

//Router
const ReactRouter = require('react-router');
const Router = ReactRouter.Router;
const Route = ReactRouter.Route;
const IndexRoute = ReactRouter.IndexRoute;
const hashHistory = ReactRouter.hashHistory;

//Components
const App = require('./components/app');
const ProductList = require("./components/products/product_list");
const ProductItem = require("./components/products/product_item");


const appRouter = (
  <Router history={hashHistory}>
    <Route path="/" component={ App }>
      <IndexRoute component= {ProductList} />
      <Route path="products" component={ ProductList } />
      <Route path="products/:productId" component={ ProductItem } />
    </Route>
  </Router>
);


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  ReactDOM.render(appRouter, root);
});
