const React = require('react');
const InventoryItem = require('./inventory_item');

const InventoryList = React.createClass({

  createHeaders (style) {
    const headers =
      <div className = "inventory-headers">
        <p className= "inventory-headers-waist">Waist</p>
        <p className= "inventory-headers-length">Length</p>
        <p className= "inventory-headers-count">Amount</p>
      </div>;
      let styles =
        <li className= "inventory-style-name">
          <h3>{style}</h3>
          {headers}
        </li>;
        return styles;
  },


  render() {

    let listOfInventory = this.props.inventory;

    //Groups the inventories by stype
    let groupedInventory = {};
    listOfInventory.forEach( (item) => {
      if (groupedInventory.hasOwnProperty(item.style)) {
        groupedInventory[item.style].push(item);
      } else {
        groupedInventory[item.style] = [];
        groupedInventory[item.style].push(item);
      }

    });

    //Creates an array of styles
    let styleGroup = Object.keys(groupedInventory).map( (key) => {
      return [key, []];
    });


    //Creates an InventoryItem component for each listing in the style group
    styleGroup.forEach( (item, i) => {
      let invItems = groupedInventory[item[0]].map( (inventory, i) => {
        return (<InventoryItem key={i} inventory={inventory} />);
      });
      let headers = this.createHeaders(item[0]);
      item[0] = headers;
      item[1] = invItems;
    });

    return (
      <div className="inventory-list-container">
        <div className= "inventory-list">
          <ul className= "inventory-list-style">
            {styleGroup}
          </ul>
        </div>
      </div>
    );
  }
});


module.exports = InventoryList;
