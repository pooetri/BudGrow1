import React, { useState } from 'react';
import { Text, View, StyleSheet, TextInput, FlatList, Alert } from "react-native";
import Icon from 'react-native-vector-icons/FontAwesome';

const App = () => {
    const [searchKey, setSearchKey] = useState('');
    const [searchResults, setSearchResults] = useState([]);

    const handleSearch = async () => {
        try {
            const response = await fetch(`http://10.0.2.2:3009/search?q=${searchKey}`);
            if (response.ok) {
                const data = await response.json();
                setSearchResults(data);
                if (data.length > 0) {
                    const product = data[0];
                    Alert.alert('Product Found', `${product.groceryName} - ${product.brand} - ${product.weight} - ${product.groceryPrice}`);
                } else {
                    Alert.alert('Not Found', 'Product not found');
                }
            } else {
                setSearchResults([]);
                Alert.alert('Not Found', 'Product not found');
            }
        } catch (error) {
            console.error(error);
            Alert.alert('Network Error', 'Network request failed');
        }
    };

    return (
        <View>
            <View style={styles.headercard}>
                <View style={styles.headerContent}>
                    <Text style={styles.headingText}> Price Comparison</Text>
                    <Icon name="cog" size={30} color="#00806C" style={styles.icon} />
                </View>
            </View>
            <View style={styles.container}>
                <View style={[styles.card, styles.searchbar]}>
                    <Icon name="search" size={20} color="#383A49" style={styles.iconsearch} />
                    <TextInput
                        style={styles.searchtulisan}
                        placeholder="Search"
                        value={searchKey}
                        onChangeText={setSearchKey}
                        onSubmitEditing={handleSearch}
                    />
                </View>
            </View>
            <View style={[styles.recently, styles.recentlyContainer]}>
                <Text style={styles.tulisanrecentlysearched}> Recently Searched</Text>
            </View>
            <View style={styles.containermakanan}>
                <FlatList
                    data={searchResults}
                    keyExtractor={(item, index) => index.toString()}
                    renderItem={({ item }) => (
                        <View style={[styles.cardmakanan, styles.searchbar]}>
                            <Text style={styles.tulisanmakanan}>
                                {item.groceryName} - {item.brand} - {item.weight} - ${item.groceryPrice}
                            </Text>
                            <Icon name="plus" size={20} color="#EFC645" style={styles.iconplus} />
                        </View>
                    )}
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    headercard: {
        backgroundColor: '#F6E9BE',
        height: 110,
        width: 390,
        justifyContent: 'center',
    },
    headerContent: {
        flexDirection: 'row',
        alignItems: 'center',
        paddingHorizontal: 20,
    },
    headingText: {
        fontSize: 32,
        fontWeight: 'bold',
        color: '#000000',
    },
    icon: {
        marginLeft: 30,
    },
    iconsearch: {
        marginLeft: 10,
    },
    iconplus: {
        marginRight: 10,
    },
    tulisanrecentlysearched: {
        fontSize: 22,
        fontWeight: 'medium',
        color: '#000000',
        marginBottom: 10
    },
    tulisanmakanan: {
        fontSize: 20,
        fontWeight: 'medium',
        color: '#000000',
        marginLeft: 25,
        flex: 1,
    },
    recentlyContainer: {
        marginTop: 10,
        marginLeft: 20,
    },
    recently: {
        color: '#000000',
        marginTop: 400,
    },
    containermakanan: {},
    cardmakanan: {
        backgroundColor: '#FFF6D9',
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        width: 318,
        height: 44,
        borderRadius: 20,
        marginTop: 15,
        marginBottom: 15,
        marginLeft: 25,
        paddingHorizontal: 10,
    },
    container: {},
    searchtulisan: {
        fontSize: 22,
        marginLeft: 10,
    },
    card: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'flex-start',
        width: 318,
        height: 44,
        borderRadius: 20,
        margin: 25,
    },
    searchbar: {
        backgroundColor: '#FFF6D9',
    },
});

export default App;
