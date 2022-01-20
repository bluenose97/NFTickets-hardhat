pragma solidity ^0.8.0;

contract TicketFactory {

    event NewTicket(uint ticketId, uint eventId);

    struct Ticket {
      uint eventId;
      address owner;
    }
    
    Ticket[] internal tickets;

    function _createTicket(uint _eventId, address _owner) public returns(uint) {
        tickets.push(Ticket(_eventId, _owner));
        uint ticketId = tickets.length - 1;
        emit NewTicket(ticketId, _eventId);
        return ticketId;
    }
}
