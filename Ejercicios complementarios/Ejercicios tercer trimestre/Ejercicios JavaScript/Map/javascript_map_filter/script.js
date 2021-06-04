const DOM = {
    divResultado:  document.getElementById("resultado")
}    

const autos = [
    {marca: 'BMW',  modelo: 'Serie 3', year: 2012, precio: 30000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Audi', modelo: 'A4',  year: 2018, precio: 40000, puertas: 4, color: 'Negro', transmision: 'automatico'},
    {marca: 'Ford', modelo: 'Mustang',  year: 2015, precio: 20000, puertas: 2, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Audi', modelo: 'A6',  year: 2010, precio: 35000, puertas: 4, color: 'Negro', transmision: 'automatico'},
    {marca: 'BMW', modelo: 'Serie 5',  year: 2016, precio: 70000, puertas: 4, color: 'Rojo', transmision: 'automatico'},
    {marca: 'Mercedes Benz', modelo: 'Clase C',  year: 2015, precio: 25000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Chevrolet', modelo: 'Camaro',  year: 2018, precio: 60000, puertas: 2, color: 'Rojo', transmision: 'manual'},
    {marca: 'Ford', modelo: 'Mustang',  year: 2019, precio: 80000, puertas: 2, color: 'Rojo', transmision: 'manual'},
    {marca: 'Dodge', modelo: 'Challenger',  year: 2017, precio: 40000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Audi', modelo: 'A3',  year: 2017, precio: 55000, puertas: 2, color: 'Negro', transmision: 'manual'},
    {marca: 'Dodge', modelo: 'Challenger',  year: 2012, precio: 25000, puertas: 2, color: 'Rojo', transmision: 'manual'},
    {marca: 'Mercedes Benz', modelo: 'Clase C',  year: 2018, precio: 45000, puertas: 4, color: 'Azul', transmision: 'automatico'},
    {marca: 'BMW', modelo: 'Serie 5',  year: 2019, precio: 90000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Ford', modelo: 'Mustang',  year: 2017, precio: 60000, puertas: 2, color: 'Negro', transmision: 'manual'},
    {marca: 'Dodge', modelo: 'Challenger',  year: 2015, precio: 35000, puertas: 2, color: 'Azul', transmision: 'automatico'},
    {marca: 'BMW', modelo: 'Serie 3',  year: 2018, precio: 50000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'BMW', modelo: 'Serie 5',  year: 2017, precio: 80000, puertas: 4, color: 'Negro', transmision: 'automatico'},
    {marca: 'Mercedes Benz', modelo: 'Clase C',  year: 2018, precio: 40000, puertas: 4, color: 'Blanco', transmision: 'automatico'},
    {marca: 'Audi', modelo: 'A4',  year: 2016, precio: 30000, puertas: 4, color: 'Azul', transmision: 'automatico'}
];


let resultado="";
autos.filter(el=> el.modelo.length < 10)
    .map(el=>{
        return {cochem: el.marca, cochec: el.color};
    })
    .forEach( e =>{
        console.log(e);
        resultado += e.cochem + " " + e.cochec + "; "; 
    })

    //.reduce( (acumulado,elemento)=>  acumulado + " Fabricante: " + elemento.cochem + " tonalidad: " + elemento.cochec , "Lista tonos: ");
    // observar que el patrón de reduce es:   reduce(  Función: (acumulador, elementoActual )=>return  , Parámetro: valorinicialacumulado )


DOM.divResultado.innerHTML = resultado;




//Vamos a usar una clase y rellenar un nuevo array con esa clase
class Coche{
    constructor(ma,mo,ye,pr,pu,co,tr){
        this.marca = ma;
        this.modelo = mo;
        this.year = ye;
        this.precio = pr;
        this.puertas = pu;
        this.color = co;
        this.transmision = tr; 
    }

    toString(){
        return " marca: " + this.marca + "; modelo: " + this.modelo + "; año: " +  this.year;
    }
}


let coches = [];

autos.forEach( e => coches.push( new Coche(e.marca, e.modelo,e.year, e.precio, e.puertas, e.color, e.transmision) ) );

DOM.divResultado.innerHTML +=  coches.reduce( 
    //esta es la función que recibe reduce
    (a,e)=> {                       
        console.log(e)
        return a + e + "<br>"
    }, 
    //este es el valor inicial que recibe reduce
    "<br>Objetos coche: "
);


let valor = coches
    .filter( e => e.marca == "Audi")
    .map( e => e.precio)
    .reduce((acumulador,e) => {
            if (acumulador > e) {
                return e
            } else {
                return acumulador;
            }
        },
        coches[0].precio
    );
console.log(valor);

// ahora vamos a usar map y sort()
// sort puede recibir una función que decida quién es mayor
// si el elemento a o el elemento b ( en definitiva irá comparando
// cada dos elementos del array )
// El criterio es: si comparamos: (a,b)  y devuelve valor positivo: > 0
// entonces a > b,  si devuelve valor negativo: < 0 entonces a es menor que b
// si es igual a cero, entonces a = b
// observar que (a,b) => a.year - b.year      
// nos ordenaría por año de forma ascendente
// mientras que (a,b) => b.year - a.year
// también ordenaría por año pero de forma descendente
coches
    .sort( (a,b) => a.precio - b.precio )
    .map(c => c.marca + " " + c.modelo + " " + c.precio)
    .forEach( texto => console.log(texto))



// Los agrupamientos se pueden emular mediante un reduce 
// ¿ cómo ? nuestro acumulador será una nueva estructura ( típicamente un mapa con clave el criterio de agrupamiento 
// y un array como value)
// Veamos un ejemplo: Agrupar los coches por marca
// en ese caso la estructura del acumulador será un mapa :  [ {marca1 -->[coche9, coche1,...]}, {marca2 --> [coche7, coche2], ..}   ]
// Esto es: un mapa con clave el nombre de la marca y como value un array con los coches de esa marca
let mapaCochesPorMarca = coches
    .reduce( (acumulador, elemento) =>{
        if( typeof acumulador.get( elemento.marca) === 'undefined')
            acumulador.set(elemento.marca, [] );  // establecemos un array vacío para la nueva marca que vamos a introducir
        //En este momento existe seguro un array en el mapa para la marca del elemento actual: elemento.marca
        //ya que el if anterior nos lo habría creado si no existiera previamente

        //ahora tomamos el array que esté creado en el mapa para la marca del elemento actual y le agregamos el elemento
        let array = acumulador.get(elemento.marca); 
        array.push(elemento);

        return acumulador;

    },
    new Map()  //inicialmente el acumulador se crea como un mapa vacío
    )

mapaCochesPorMarca.forEach(e => console.log(e));   


//ejercicios

//a) Obtener los nombres de las  marcas distintas que tenemos en el array
// nota: se recomienda el uso de Set


// b) Un posible cliente quiere un coche no muy viejo ( menos de 5 años ) y que sea de 4 puertas
// Le preocupa el precio así que se le debe mostrar de más barato a más caro
// construir un array que por cada elemento tenga una string que incluya la información: marca, modelo, año, color





// c) Se quiere obtener los coches de 4 puertas agrupados por año de fabricación




// d) probablemente se aplique un descuento de 10000 a los coches más viejos de 5 años 
// obtenerlos ordenados por precio de mayor a menor teniendo en cuenta ese descuento
   
