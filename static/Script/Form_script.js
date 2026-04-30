function generarCampos() {
        const numero = document.getElementById('Num_ingredientes').value;
        const contenedor = document.getElementById('contenedor_ingredientes');
        
        contenedor.innerHTML = '';

        for (let i = 1; i <= numero; i++) {

            // Crear fila
            const fila = document.createElement('div');

            // Crear Label para Ingrediente
            const label = document.createElement('label');
            label.innerHTML = `Ingrediente ${i}: `;
            
            // Input Ingrediente
            const inputIngrediente = document.createElement('input');
            inputIngrediente.type = 'text';
            inputIngrediente.name = `ingrediente_${i}`;
            inputIngrediente.placeholder = `Ingrediente ${i}`;

            // Input cantidad
            const inputCantidad = document.createElement('input');
            inputCantidad.type = 'number';
            inputCantidad.name = `cantidad_${i}`;
            inputCantidad.placeholder = 'Cantidad';
            inputCantidad.min = '0';
            inputCantidad.step = 'any';

            // Select unidades
            const selectUnidad = document.createElement('select');
            selectUnidad.name = `unidad_${i}`;

            const unidades = ["mg", "g", "kg", "ml", "L", "ud"];

            unidades.forEach(u => {
                const option = document.createElement('option');
                option.value = u;
                option.textContent = u;
                selectUnidad.appendChild(option);
            });

            // Añadir todo
            fila.appendChild(label);
            fila.appendChild(inputIngrediente);
            fila.appendChild(inputCantidad);
            fila.appendChild(selectUnidad);

            fila.appendChild(document.createElement('br'));
            fila.appendChild(document.createElement('br'));

            contenedor.appendChild(fila);
        }
    }

        function generarPasos() {
            const numero = document.getElementById('Num_pasos').value;
            const contenedor = document.getElementById('contenedor_pasos');
            
            // Limpiamos el contenedor para que no se acumulen si el usuario cambia el número
            contenedor.innerHTML = '';

            for (let i = 1; i <= numero; i++) {
                // Creamos un label
                const label = document.createElement('label');
                label.innerHTML = `Paso ${i}: `;
                
                // Creamos el input
                const textarea = document.createElement('textarea');
                textarea.name = `paso_${i}`;
                textarea.rows = 2; // altura inicial
                textarea.cols = 40; // ancho 
                textarea.placeholder = `Describe el paso ${i}`;
                
                // Añadimos al contenedor con un salto de línea
                contenedor.appendChild(label);
                contenedor.appendChild(textarea);
                contenedor.appendChild(document.createElement('br'));
                contenedor.appendChild(document.createElement('br'));
            }
        }