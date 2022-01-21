pragma solidity ^0.8.0;

import "./ticket-factory.sol";

contract EventFactory is TicketFactory {

    event NewEvent(uint eventId, string name, string location, uint32 capacity);

    struct Event {
      string name;
      string location;
      uint32 capacity;
      uint[] tickets;
    }

    Event[] public events;
    
    mapping (uint => address) public eventToOwner;

    function createEvent(string memory _name, string memory _location, uint32 _capacity) public returns (uint) {
        uint eventId = events.length;
        
        uint[] memory tickets = new uint[](_capacity);
        for (uint i = 0; i < _capacity; i++) {
          tickets[i] = _createTicket(eventId, msg.sender);
        }

        events.push(Event(_name, _location, _capacity, tickets));
        eventToOwner[eventId] = msg.sender;
        emit NewEvent(eventId, _name, _location, _capacity);

        return eventId;
    }

    function getNumberOfEvents() public view returns (uint) {
        return events.length;
    }

    function getEvents() public view returns (Event[] memory) {
        return events;
    }
}
