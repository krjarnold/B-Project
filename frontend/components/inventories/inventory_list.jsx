const React = require('react');
const InventoryItem = require('./inventory_item');

const InventoryList = React.createClass({


  render() {

    // let listOfInventory = this.props.inventory.map( (inventory, i) => {
    //   return (<InventoryItem key={i} inventory={inventory} />);
    // });

    let listOfInventory = this.props.inventory;

    let groupedInventory = {};
    listOfInventory.forEach( (item) => {
      if (groupedInventory.hasOwnProperty(item.style)) {
        groupedInventory[item.style].push(item);
      } else {
        groupedInventory[item.style] = [];
        groupedInventory[item.style].push(item);
      }

    });

    let styleGroup = Object.keys(groupedInventory).map( (key) => {
      return [key, []];
    });
    styleGroup.forEach( (item, i) => {
      let invItems = groupedInventory[item[0]].map( (inventory, i) => {
        return (<InventoryItem key={i} inventory={inventory} />);
      });
      item[1] = invItems;
    });




    return (
      <div className="inventory-list-container">Inventory list
        {styleGroup}
      </div>
    );
  }
});


module.exports = InventoryList;
