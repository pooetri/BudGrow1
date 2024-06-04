import { Text, View, StyleSheet } from "react-native";
import Icon from 'react-native-vector-icons/FontAwesome';
// import { MaterialCommunityIcons } from '@expo/vector-icons';
// import AntDesign from 'react-native-vector-icons/AntDesign';

function CompareScreen1() {
    return (
        <View>
            <View style={styles.headercard}>
                <View style={styles.headerContent}>
                    <Text style={styles.headingText}>mparison</Text>
                    <Icon name="cog" size={30} color="#00806C" style={styles.icon} />
                </View>
            </View>
            <View style={styles.container}>
                <View style={[styles.card, styles.searchbar]}>
                    <Icon name="search" size={20} color="#383A49" style={styles.iconsearch} />
                    <Text style={styles.searchtulisan}> Search </Text>
                </View>
            </View>
            <View style={[styles.recently, styles.recentlyContainer]}>
                <Text style={styles.tulisanrecentlysearched}> Recently Searched</Text>
            </View>
            <View style={styles.containermakanan}>
                <View style={[styles.cardmakanan, styles.searchbar]}>
                    <Text style={styles.tulisanmakanan}>Baby Corn</Text>
                    <Icon name="plus" size={20} color="#EFC645" style={styles.iconplus} />
                </View>
                <View style={[styles.cardmakanan, styles.searchbar]}>
                    <Text style={styles.tulisanmakanan}>Corn</Text>
                    <Icon name="plus" size={20} color="#EFC645" style={styles.iconplus} />
                </View>
                <View style={[styles.cardmakanan, styles.searchbar]}>
                    <Text style={styles.tulisanmakanan}>Eggplant</Text>
                    <Icon name="plus" size={20} color="#EFC645" style={styles.iconplus} />
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
        marginBottom:10
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

export default CompareScreen1;
