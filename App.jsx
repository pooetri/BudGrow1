import React, { useState } from 'react';
import { Text, View, StyleSheet, TouchableOpacity } from "react-native";
import Icon from 'react-native-vector-icons/FontAwesome';

function ListsScreen() {
    const foodItemsInitial = [
        { name: "Eggs", quantity: "1.5 kg", price: 15000, checked: false },
        { name: "Milk", quantity: "2 liters", price: 20000, checked: false },
        { name: "Bread", quantity: "1 loaf", price: 10000, checked: false },
    ];

    const [foodItems, setFoodItems] = useState(foodItemsInitial);

    const handleToggleCheck = (index) => {
        const updatedItems = [...foodItems];
        updatedItems[index].checked = !updatedItems[index].checked;
        setFoodItems(updatedItems);
    };

    const grandTotal = foodItems.reduce((total, item) => total + item.price, 0);

    return (
        <View>
            <View style={styles.headercard}>
                <View style={styles.headerContent}>
                    <Text style={styles.headingText}>My Grocery List</Text>
                    <Icon name="cog" size={30} color="#00806C" style={styles.icon} />
                </View>
            </View>

            <View style={styles.shadowContainer}>
                <View style={styles.headercard2}></View>
                <View style={styles.headercard3}>
                    <Text style={styles.tulisanlist}>List</Text>
                    <View style={styles.garis}></View>

                    {foodItems.map((item, index) => (
                        <View key={index} style={styles.itemContainer}>
                            <TouchableOpacity onPress={() => handleToggleCheck(index)}>
                                <Icon 
                                    name={item.checked ? "check-circle" : "circle"} 
                                    size={30} 
                                    color="#00806C" 
                                    style={styles.icon1} 
                                />
                            </TouchableOpacity>
                            <Text style={[styles.listItem, item.checked && styles.strikethrough]}>
                                {item.name}
                            </Text>
                            <Text style={[styles.harga, item.checked && styles.strikethrough]}>
                                {item.quantity} | Rp{item.price.toLocaleString('id-ID')}
                            </Text>
                        </View>
                    ))}

                    <View style={styles.garisbawah}></View>
                    <View style={styles.containertotal}>
                        <Text style={styles.grandtotal}>Grand total :</Text>
                        <Text style={styles.hargatotal}>Rp{grandTotal.toLocaleString('id-ID')},-</Text>
                    </View>
                </View>
            </View>

            <View style={styles.containerbutton}>
                <View style={styles.buttonadd}>
                    <Text style={styles.tulisanadd}>Add to Analytics</Text>
                </View>
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
        marginLeft: 60,
    },
    icon1:{
        marginTop:10,
        marginLeft: 20,
        marginBottom:5,
    },
    shadowContainer: {
        position: 'relative',
        width: 319,
        height: 400,
        marginLeft: 25,
        marginTop: 30,
        right: 10,
        top: 10
    },
    headercard2: {
        bottom:10,
        left: 10,
        backgroundColor: '#EFC645',
        width: 319,
        height: 400,
        borderRadius: 10,
        zIndex: 1,
    },
    headercard3: {
        position: 'absolute',
        top: 0,
        left: 0,
        backgroundColor: '#FFF6D9',
        width: 319,
        height: 400,
        borderRadius: 10,
        zIndex: 2,
    },
    tulisanlist:{
        fontWeight: 'medium',
        fontSize:24,
        marginLeft: 15,
        marginTop:10,
        color: '#000000',
    },
    garis:{
        height: 13,
        width:319,
        backgroundColor: '#F6E9BE',
        marginTop: 5,
        borderRadius: 10,
    },
    itemContainer: {
        flexDirection: 'row',
        alignItems: 'center',
        marginTop: 10,
    },
    listItem: {
        flex: 1,
        fontSize: 20,
        color: '#000000',
        marginLeft: 15,
    },
    strikethrough: {
        textDecorationLine: 'line-through',
        color: '#808080',
    },
    harga: {
        fontSize: 15,
        color: '#000000',
        marginRight:25,
    },
    garisbawah:{
        height: 13,
        width:319,
        backgroundColor: '#F6E9BE',
        marginTop: 110,
        borderRadius: 10,
    },
    containertotal:{
        marginLeft:15,
        marginTop:10,
        flexDirection: 'row'
    },
    grandtotal:{
        fontSize: 20,
        marginRight:75,
        fontWeight:'bold',
        color:'#000000'
    },
    hargatotal:{
        fontSize:20,
        fontWeight:'medium',
        color:'#000000'
    },
    containerbutton:{
        justifyContent:'center',
        alignItems:'center',
        marginTop:35,
    },
    buttonadd:{
        height:65,
        width:258,
        borderRadius:10,
        backgroundColor:'#00806C',
        position:'relative',
    },
    tulisanadd:{
        fontWeight:'medium',
        fontSize:25,
        color:'#F6E9BE',
        marginTop: 15,
        marginLeft:37
    },
});

export default ListsScreen;
