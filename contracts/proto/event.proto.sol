// File automatically generated by protoc-gen-sol v0.2.0
// SPDX-License-Identifier: CC0
pragma solidity >=0.8.0 <9.0.0;
pragma experimental ABIEncoderV2;

import "@lazyledger/protobuf3-solidity-lib/contracts/ProtobufLib.sol";

enum DomainEventType { UNSPECIFIED, NFT_MINTED, NFT_TRANSFERED }

struct DomainEvent {
    uint64 evnt_idx;
    DomainEventType evnt_type;
    bytes evnt_payload;
}

library DomainEventCodec {
    function decode(uint64 initial_pos, bytes memory buf, uint64 len) internal pure returns (bool, uint64, DomainEvent memory) {
        // Message instance
        DomainEvent memory instance;
        // Previous field number
        uint64 previous_field_number = 0;
        // Current position in the buffer
        uint64 pos = initial_pos;

        // Sanity checks
        if (pos + len < pos) {
            return (false, pos, instance);
        }

        while (pos - initial_pos < len) {
            // Decode the key (field number and wire type)
            bool success;
            uint64 field_number;
            ProtobufLib.WireType wire_type;
            (success, pos, field_number, wire_type) = ProtobufLib.decode_key(pos, buf);
            if (!success) {
                return (false, pos, instance);
            }

            // Check that the field number is within bounds
            if (field_number > 3) {
                return (false, pos, instance);
            }

            // Check that the field number of monotonically increasing
            if (field_number <= previous_field_number) {
                return (false, pos, instance);
            }

            // Check that the wire type is correct
            success = check_key(field_number, wire_type);
            if (!success) {
                return (false, pos, instance);
            }

            // Actually decode the field
            (success, pos) = decode_field(pos, buf, len, field_number, instance);
            if (!success) {
                return (false, pos, instance);
            }

            previous_field_number = field_number;
        }

        // Decoding must have consumed len bytes
        if (pos != initial_pos + len) {
            return (false, pos, instance);
        }

        return (true, pos, instance);
    }

    function check_key(uint64 field_number, ProtobufLib.WireType wire_type) internal pure returns (bool) {
        if (field_number == 1) {
            return wire_type == ProtobufLib.WireType.Varint;
        }

        if (field_number == 2) {
            return wire_type == ProtobufLib.WireType.Varint;
        }

        if (field_number == 3) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        return false;
    }

    function decode_field(uint64 initial_pos, bytes memory buf, uint64 len, uint64 field_number, DomainEvent memory instance) internal pure returns (bool, uint64) {
        uint64 pos = initial_pos;

        if (field_number == 1) {
            bool success;
            (success, pos) = decode_1(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        if (field_number == 2) {
            bool success;
            (success, pos) = decode_2(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        if (field_number == 3) {
            bool success;
            (success, pos) = decode_3(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        return (false, pos);
    }

    // DomainEvent.evnt_idx
    function decode_1(uint64 pos, bytes memory buf, DomainEvent memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 v;
        (success, pos, v) = ProtobufLib.decode_uint64(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (v == 0) {
            return (false, pos);
        }

        instance.evnt_idx = v;

        return (true, pos);
    }

    // DomainEvent.evnt_type
    function decode_2(uint64 pos, bytes memory buf, DomainEvent memory instance) internal pure returns (bool, uint64) {
        bool success;

        int32 v;
        (success, pos, v) = ProtobufLib.decode_enum(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (v == 0) {
            return (false, pos);
        }

        // Check that value is within enum range
        if (v < 0 || v > 2) {
            return (false, pos);
        }

        instance.evnt_type = DomainEventType(v);

        return (true, pos);
    }

    // DomainEvent.evnt_payload
    function decode_3(uint64 pos, bytes memory buf, DomainEvent memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.evnt_payload = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.evnt_payload[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // Holds encoded version of message
    struct DomainEvent__Encoded {
        bytes evnt_idx__Key;
        bytes evnt_idx;
        bytes evnt_type__Key;
        bytes evnt_type;
        bytes evnt_payload__Key;
        bytes evnt_payload__Length;
        bytes evnt_payload;
    }

    // Holds encoded version of nested message
    struct DomainEvent__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(DomainEvent memory instance) internal pure returns (bytes memory) {
        DomainEvent__Encoded memory encodedInstance;
        uint64 len;
        uint64 index;

        // Omit encoding evnt_idx if default value
        if (uint64(instance.evnt_idx) != 0) {
            // Encode key for evnt_idx
            encodedInstance.evnt_idx__Key = ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.Varint));
            // Encode evnt_idx
            encodedInstance.evnt_idx = ProtobufLib.encode_uint64(instance.evnt_idx);
        }

        // Omit encoding evnt_type if default value
        if (uint64(instance.evnt_type) != 0) {
            // Encode key for evnt_type
            encodedInstance.evnt_type__Key = ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.Varint));
            // Encode evnt_type

            // protoc-gen-sol didn't manage to bypass this, the following code was added manually
            DomainEventType evnt_type = instance.evnt_type;
            int256 evnt_type_i256 = int256(uint(evnt_type));
            int32 evnt_type_i32 = int32(int(evnt_type_i256));

            encodedInstance.evnt_type = ProtobufLib.encode_int32(evnt_type_i32);
        }

        // Omit encoding evnt_payload if default value
        if (bytes(instance.evnt_payload).length > 0) {
            // Encode key for evnt_payload
            encodedInstance.evnt_payload__Key = ProtobufLib.encode_key(3, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode evnt_payload
            encodedInstance.evnt_payload__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.evnt_payload).length));
            encodedInstance.evnt_payload = bytes(instance.evnt_payload);
        }

        bytes memory finalEncoded;
        index = 0;
        len = 0;
        len += uint64(encodedInstance.evnt_idx.length);
        len += uint64(encodedInstance.evnt_type.length);
        len += uint64(encodedInstance.evnt_payload.length);
        finalEncoded = new bytes(len);

        uint64 j;
        j = 0;
        while (j < encodedInstance.evnt_idx.length) {
            finalEncoded[index++] = encodedInstance.evnt_idx[j];
        }
        j = 0;
        while (j < encodedInstance.evnt_type.length) {
            finalEncoded[index++] = encodedInstance.evnt_type[j];
        }
        j = 0;
        while (j < encodedInstance.evnt_payload.length) {
            finalEncoded[index++] = encodedInstance.evnt_payload[j];
        }

        return finalEncoded;
    }

    // Encode a nested DomainEvent, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, DomainEvent memory instance) internal pure returns (DomainEvent__Encoded__Nested memory) {
        DomainEvent__Encoded__Nested memory wrapped;

        wrapped.nestedInstance = encode(instance);

        uint64 len = uint64(wrapped.nestedInstance.length);
        if (len > 0) {
            wrapped.key = ProtobufLib.encode_key(field_number, 2);
            wrapped.length = ProtobufLib.encode_uint64(len);
        }

        return wrapped;
    }

}

struct NFTMintedPayload {
    bytes hash;
    bytes owner;
}

library NFTMintedPayloadCodec {
    function decode(uint64 initial_pos, bytes memory buf, uint64 len) internal pure returns (bool, uint64, NFTMintedPayload memory) {
        // Message instance
        NFTMintedPayload memory instance;
        // Previous field number
        uint64 previous_field_number = 0;
        // Current position in the buffer
        uint64 pos = initial_pos;

        // Sanity checks
        if (pos + len < pos) {
            return (false, pos, instance);
        }

        while (pos - initial_pos < len) {
            // Decode the key (field number and wire type)
            bool success;
            uint64 field_number;
            ProtobufLib.WireType wire_type;
            (success, pos, field_number, wire_type) = ProtobufLib.decode_key(pos, buf);
            if (!success) {
                return (false, pos, instance);
            }

            // Check that the field number is within bounds
            if (field_number > 2) {
                return (false, pos, instance);
            }

            // Check that the field number of monotonically increasing
            if (field_number <= previous_field_number) {
                return (false, pos, instance);
            }

            // Check that the wire type is correct
            success = check_key(field_number, wire_type);
            if (!success) {
                return (false, pos, instance);
            }

            // Actually decode the field
            (success, pos) = decode_field(pos, buf, len, field_number, instance);
            if (!success) {
                return (false, pos, instance);
            }

            previous_field_number = field_number;
        }

        // Decoding must have consumed len bytes
        if (pos != initial_pos + len) {
            return (false, pos, instance);
        }

        return (true, pos, instance);
    }

    function check_key(uint64 field_number, ProtobufLib.WireType wire_type) internal pure returns (bool) {
        if (field_number == 1) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        if (field_number == 2) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        return false;
    }

    function decode_field(uint64 initial_pos, bytes memory buf, uint64 len, uint64 field_number, NFTMintedPayload memory instance) internal pure returns (bool, uint64) {
        uint64 pos = initial_pos;

        if (field_number == 1) {
            bool success;
            (success, pos) = decode_1(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        if (field_number == 2) {
            bool success;
            (success, pos) = decode_2(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        return (false, pos);
    }

    // NFTMintedPayload.hash
    function decode_1(uint64 pos, bytes memory buf, NFTMintedPayload memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.hash = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.hash[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // NFTMintedPayload.owner
    function decode_2(uint64 pos, bytes memory buf, NFTMintedPayload memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.owner = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.owner[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // Holds encoded version of message
    struct NFTMintedPayload__Encoded {
        bytes hash__Key;
        bytes hash__Length;
        bytes hash;
        bytes owner__Key;
        bytes owner__Length;
        bytes owner;
    }

    // Holds encoded version of nested message
    struct NFTMintedPayload__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(NFTMintedPayload memory instance) internal pure returns (bytes memory) {
        NFTMintedPayload__Encoded memory encodedInstance;
        uint64 len;
        uint64 index;

        // Omit encoding hash if default value
        if (bytes(instance.hash).length > 0) {
            // Encode key for hash
            encodedInstance.hash__Key = ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode hash
            encodedInstance.hash__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.hash).length));
            encodedInstance.hash = bytes(instance.hash);
        }

        // Omit encoding owner if default value
        if (bytes(instance.owner).length > 0) {
            // Encode key for owner
            encodedInstance.owner__Key = ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode owner
            encodedInstance.owner__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.owner).length));
            encodedInstance.owner = bytes(instance.owner);
        }

        bytes memory finalEncoded;
        index = 0;
        len = 0;
        len += uint64(encodedInstance.hash.length);
        len += uint64(encodedInstance.owner.length);
        finalEncoded = new bytes(len);

        uint64 j;
        j = 0;
        while (j < encodedInstance.hash.length) {
            finalEncoded[index++] = encodedInstance.hash[j];
        }
        j = 0;
        while (j < encodedInstance.owner.length) {
            finalEncoded[index++] = encodedInstance.owner[j];
        }

        return finalEncoded;
    }

    // Encode a nested NFTMintedPayload, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, NFTMintedPayload memory instance) internal pure returns (NFTMintedPayload__Encoded__Nested memory) {
        NFTMintedPayload__Encoded__Nested memory wrapped;

        wrapped.nestedInstance = encode(instance);

        uint64 len = uint64(wrapped.nestedInstance.length);
        if (len > 0) {
            wrapped.key = ProtobufLib.encode_key(field_number, 2);
            wrapped.length = ProtobufLib.encode_uint64(len);
        }

        return wrapped;
    }

}

struct NFTTransferedPayload {
    bytes hash;
    bytes from;
    bytes to;
}

library NFTTransferedPayloadCodec {
    function decode(uint64 initial_pos, bytes memory buf, uint64 len) internal pure returns (bool, uint64, NFTTransferedPayload memory) {
        // Message instance
        NFTTransferedPayload memory instance;
        // Previous field number
        uint64 previous_field_number = 0;
        // Current position in the buffer
        uint64 pos = initial_pos;

        // Sanity checks
        if (pos + len < pos) {
            return (false, pos, instance);
        }

        while (pos - initial_pos < len) {
            // Decode the key (field number and wire type)
            bool success;
            uint64 field_number;
            ProtobufLib.WireType wire_type;
            (success, pos, field_number, wire_type) = ProtobufLib.decode_key(pos, buf);
            if (!success) {
                return (false, pos, instance);
            }

            // Check that the field number is within bounds
            if (field_number > 3) {
                return (false, pos, instance);
            }

            // Check that the field number of monotonically increasing
            if (field_number <= previous_field_number) {
                return (false, pos, instance);
            }

            // Check that the wire type is correct
            success = check_key(field_number, wire_type);
            if (!success) {
                return (false, pos, instance);
            }

            // Actually decode the field
            (success, pos) = decode_field(pos, buf, len, field_number, instance);
            if (!success) {
                return (false, pos, instance);
            }

            previous_field_number = field_number;
        }

        // Decoding must have consumed len bytes
        if (pos != initial_pos + len) {
            return (false, pos, instance);
        }

        return (true, pos, instance);
    }

    function check_key(uint64 field_number, ProtobufLib.WireType wire_type) internal pure returns (bool) {
        if (field_number == 1) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        if (field_number == 2) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        if (field_number == 3) {
            return wire_type == ProtobufLib.WireType.LengthDelimited;
        }

        return false;
    }

    function decode_field(uint64 initial_pos, bytes memory buf, uint64 len, uint64 field_number, NFTTransferedPayload memory instance) internal pure returns (bool, uint64) {
        uint64 pos = initial_pos;

        if (field_number == 1) {
            bool success;
            (success, pos) = decode_1(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        if (field_number == 2) {
            bool success;
            (success, pos) = decode_2(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        if (field_number == 3) {
            bool success;
            (success, pos) = decode_3(pos, buf, instance);
            if (!success) {
                return (false, pos);
            }

            return (true, pos);
        }

        return (false, pos);
    }

    // NFTTransferedPayload.hash
    function decode_1(uint64 pos, bytes memory buf, NFTTransferedPayload memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.hash = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.hash[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // NFTTransferedPayload.from
    function decode_2(uint64 pos, bytes memory buf, NFTTransferedPayload memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.from = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.from[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // NFTTransferedPayload.to
    function decode_3(uint64 pos, bytes memory buf, NFTTransferedPayload memory instance) internal pure returns (bool, uint64) {
        bool success;

        uint64 len;
        (success, pos, len) = ProtobufLib.decode_bytes(pos, buf);
        if (!success) {
            return (false, pos);
        }

        // Default value must be omitted
        if (len == 0) {
            return (false, pos);
        }

        instance.to = new bytes(len);
        for (uint64 i = 0; i < len; i++) {
            instance.to[i] = buf[pos + i];
        }

        pos = pos + len;

        return (true, pos);
    }

    // Holds encoded version of message
    struct NFTTransferedPayload__Encoded {
        bytes hash__Key;
        bytes hash__Length;
        bytes hash;
        bytes from__Key;
        bytes from__Length;
        bytes from;
        bytes to__Key;
        bytes to__Length;
        bytes to;
    }

    // Holds encoded version of nested message
    struct NFTTransferedPayload__Encoded__Nested {
        bytes key;
        bytes length;
        bytes nestedInstance;
    }

    function encode(NFTTransferedPayload memory instance) internal pure returns (bytes memory) {
        NFTTransferedPayload__Encoded memory encodedInstance;
        uint64 len;
        uint64 index;

        // Omit encoding hash if default value
        if (bytes(instance.hash).length > 0) {
            // Encode key for hash
            encodedInstance.hash__Key = ProtobufLib.encode_key(1, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode hash
            encodedInstance.hash__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.hash).length));
            encodedInstance.hash = bytes(instance.hash);
        }

        // Omit encoding from if default value
        if (bytes(instance.from).length > 0) {
            // Encode key for from
            encodedInstance.from__Key = ProtobufLib.encode_key(2, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode from
            encodedInstance.from__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.from).length));
            encodedInstance.from = bytes(instance.from);
        }

        // Omit encoding to if default value
        if (bytes(instance.to).length > 0) {
            // Encode key for to
            encodedInstance.to__Key = ProtobufLib.encode_key(3, uint64(ProtobufLib.WireType.LengthDelimited));
            // Encode to
            encodedInstance.to__Length = ProtobufLib.encode_uint64(uint64(bytes(instance.to).length));
            encodedInstance.to = bytes(instance.to);
        }

        bytes memory finalEncoded;
        index = 0;
        len = 0;
        len += uint64(encodedInstance.hash.length);
        len += uint64(encodedInstance.from.length);
        len += uint64(encodedInstance.to.length);
        finalEncoded = new bytes(len);

        uint64 j;
        j = 0;
        while (j < encodedInstance.hash.length) {
            finalEncoded[index++] = encodedInstance.hash[j];
        }
        j = 0;
        while (j < encodedInstance.from.length) {
            finalEncoded[index++] = encodedInstance.from[j];
        }
        j = 0;
        while (j < encodedInstance.to.length) {
            finalEncoded[index++] = encodedInstance.to[j];
        }

        return finalEncoded;
    }

    // Encode a nested NFTTransferedPayload, wrapped in key and length if non-default
    function encodeNested(uint64 field_number, NFTTransferedPayload memory instance) internal pure returns (NFTTransferedPayload__Encoded__Nested memory) {
        NFTTransferedPayload__Encoded__Nested memory wrapped;

        wrapped.nestedInstance = encode(instance);

        uint64 len = uint64(wrapped.nestedInstance.length);
        if (len > 0) {
            wrapped.key = ProtobufLib.encode_key(field_number, 2);
            wrapped.length = ProtobufLib.encode_uint64(len);
        }

        return wrapped;
    }

}

