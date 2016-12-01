class Map extends React.Component {
  render () {
    return (
      <div>
        <div>Name: {this.props.name}</div>
      </div>
    );
  }
}

Map.propTypes = {
  name: React.PropTypes.string
};
