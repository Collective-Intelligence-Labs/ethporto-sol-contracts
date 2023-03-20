pragma solidity >=0.8.0 <0.9.0;

import "./Ownable.sol";
import "./EventStore.sol";
import "./Aggregate.sol";
import "./NFTsAggregate.sol";
import "./proto/event.proto.sol";
import "./proto/command.proto.sol";


contract AggregateRepository is Ownable {

    EventStore public eventstore;
    Aggregate public aggregate;
    
    uint constant BATCH_LIMIT = 1000; // for demo purposes only

    constructor(address eventstore_) {
        eventstore = EventStore(eventstore_);
        aggregate = new NFTsAggregate(); // for demo purposes only
    }

    function get() external onlyOwner returns (Aggregate) {

        DomainEvent[] memory evnts = eventstore.pull(address(aggregate), 0, BATCH_LIMIT);
        aggregate.setup(evnts);

        return aggregate;
    }

    function save(Aggregate ag) external onlyOwner returns (DomainEvent[] memory) {

        DomainEvent[] memory changes = new DomainEvent[](ag.getChangesLength());

        for (uint i = 0; i < ag.getChangesLength(); i++) {
            DomainEvent memory evnt = ag.getChange(i);
            eventstore.append(address(ag), evnt);
            changes[i] = evnt;
        }

        ag.reset();

        return changes;
    }
}