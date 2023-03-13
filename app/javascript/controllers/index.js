// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import QuantityController from "./quantity_controller"
application.register("quantity", QuantityController)

import TotalController from "./total_controller"
application.register("total", TotalController)
