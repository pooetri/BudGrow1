import * as React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import App from './App';
import Profile from './Profile';

const Stack = createStackNavigator();

function MyNavigator() {
  return (
    <Stack.Navigator>
      <Stack.Screen name="slide3" component={slide3} />
      <Stack.Screen name="slide5" component={slide5} />
    </Stack.Navigator>
  );
}

export default MyNavigator;