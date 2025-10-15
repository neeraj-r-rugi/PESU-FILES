import React, { createContext, useContext } from 'react';
import { View, Text } from 'react-native';

const UserContext = createContext<string>('');

function Component1() {
    const user = useContext(UserContext);
    return (
        <View>
            <Text>User: {user}</Text>
        </View>
    );
}

function Component2() {
    return (
        <View>
            <Text>hello</Text>
        </View>
    );
}

function Component3() {
    const user = useContext(UserContext);
    return (
        <View>
            <Text>hello --{user}</Text>
        </View>
    );
}
