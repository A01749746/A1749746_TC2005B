"use strict"

import express from 'express';

const app = express()

const port  = 3000

app.use(express.json())

let cartas = []

let id = 1;



app.get('/api/api_basics_tcg', (req, resp) => {
    if (cartas.length === 0) {
        resp.status(404).send('No hay cartas');
    } else {
        resp.status(200).json(cartas);
    }
});


app.get('/api/api_basics_tcg/:id', (req, resp) => {
    const id = parseInt(req.params.id);
    const carta = cartas.find(cartas => cartas.id === id);
    if (carta) {
        resp.status(200).json(carta);
    } else {
        resp.status(404).send('La carta no existe');
    }
});

app.post('/api/api_basics_tcg', (req, resp) => {
    const nuevaCarta = req.body;
    if (!nuevaCarta.nombre || !nuevaCarta.attack || !nuevaCarta.effect) {
        resp.status(404).send('La carta debe tener un nombre');
    }
    //Despues se le pueden agregar valores de power, health, etc

    const existe = cartas.findIndex(carta => carta.id === nuevaCarta.id);
    if (existe !== -1) {
        resp.status(404).send('La carta ya existe');
    }else{
        nuevaCarta.id = id;
        cartas.push(nuevaCarta);
        resp.status(200).send('Carta agregada');
        id = id +1;
    }
});


app.delete('/api/api_basics_tcg/:id', (req, resp) => {
    const id = parseInt(req.params.id);
    const existe = cartas.findIndex(carta => carta.id === id); //función findIndex se busco en internet
    if (existe !== -1) {
        cartas.splice(existe, 1);
        resp.status(200).send('Carta eliminada');
    } else {
        resp.status(404).send('Carta no existe');
    }
});


app.put('/api/api_basics_tcg/:id', (req, resp) => {
    const id = parseInt(req.params.id);
    const existe = cartas.findIndex(carta => carta.id === id); //función findIndex se busco en internet

    if (existe === -1) {
        resp.status(404).send('Carta no existe');
    }else{
        if (req.body.nombre){
            cartas[existe].nombre = req.body.nombre
        }
        if (req.body.attack){
            cartas[existe].attack = req.body.attack
        }
        if (req.body.defense){
            cartas[existe].defense = req.body.defense
        }
        if (req.body.healing){
            cartas[existe].healing = req.body.healing
        }
        if (req.body.powerCost){
            cartas[existe].powerCost = req.body.powerCost
        }
        if (req.body.realm){
            cartas[existe].realm = req.body.realm
        }
        if (req.body.level){
            cartas[existe].level = req.body.level
        }
        if (req.body.effect){
            cartas[existe].effect = req.body.effect
        }
        resp.status(200).send('Se actualizó la carta exitosamente')
    }
});


app.listen(port, () => {
    console.log(`Listening on port ${port}`)
})