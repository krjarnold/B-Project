const React = require('react');


const InventoryItem = React.createClass({


  render() {
    const style = this.props.inventory.style;
    const waist = this.props.inventory.waist;
    const length = this.props.inventory.length;
    const count = this.props.inventory.count;

    return (
      <div className="inventory-item-container">
        <p className= "inventory-waist">W- {waist}</p>
        <p className= "inventory-length">L- {length}</p>
        <p className= "inventory-count">Amount- {count}</p>
      </div>
    );
  }
});


module.exports = InventoryItem;
