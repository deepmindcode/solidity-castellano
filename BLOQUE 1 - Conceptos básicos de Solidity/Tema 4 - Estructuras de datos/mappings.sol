//Especificamos la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract Mappings {
    //Declaramos un mapping para elegir un numero
    mapping(address => uint256) public elegirNumero;

    function elegirNumero(uint256 _numero) public {
        elegirNumero[msg.sender] = _numero;
    }

    function consultarNumero() public view returns (uint256) {
        return elegirNumero[msg.sender];
    }

    //Declaramos un mapping que relaciona el nombre de una persona con su cantidad de dinero
    mapping(string => uint256) cantidadDinero;

    function Dinero(string _nombre, uint256 _cantidad) public {
        cantidadDinero[_nombre] = _cantidad;
    }

    function consultarDinero(string _nombre) public view returns (uint256) {
        return cantidadDinero[_nombre];
    }

    //Ejemplo de mapping con un tipo de dato complejo
    struct Persona {
        string nombre;
        uint256 edad;
    }

    mapping(uint256 => Persona) personas;

    function dni_Persona(
        uint256 _numeroDni,
        string _nombre,
        uint256 _edad
    ) public {
        personas[_numeroDni] = Persona(_nombre, _edad);
    }

    function VisualizarPersona(uint256 _dni) public view returns (Persona) {
        return personas[_dni];
    }
}
