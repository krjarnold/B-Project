const React = require('react');
const InventoryItem = require('./inventory_item');

const InventoryList = React.createClass({

  createHeaders (style, i) {
    const headers =
      <div className = "inventory-headers" key={i} >
        <p className= "inventory-headers-waist">Waist</p>
        <p className= "inventory-headers-length">Length</p>
        <p className= "inventory-headers-count">Count</p>
      </div>;
      let styles =
        <span className= "inventory-style-name" key={i}>
          <h3>{style}</h3>
          {headers}
        </span>;
        return styles;
  },

  createColumns (styles) {
    let columns =
        <div className= "inventory-list-container">
          <span className = "inventory-list-style" key="1" >
            {styles.slice(0,3)}
          </span>
          <span className = "inventory-list-style" key="2">
            {styles.slice(3,6)}
          </span>
          <span className = "inventory-list-style" key="3">
            {styles.pop()}
          </span>
        </div>;
      return columns;
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
      let headers = this.createHeaders(item[0], i);
      item[0] = headers;
      item[1] = invItems;
    });

    const groups = this.createColumns(styleGroup);

    // debugger
    return (
      <div className="inventory-container">
            {groups}
      </div>
    );
  }
});


module.exports = InventoryList;
