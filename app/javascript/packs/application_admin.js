// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap'
import '../stylesheet/application_admin'

import './vendors/js/vendor.bundle.base.js'
import './vendors/chart.js/Chart.min.js'
import './vendors/moment/moment.min.js'
import './vendors/daterangepicker/daterangepicker.js'
import './vendors/chartist/chartist.min.js'
import './js/off-canvas.js'
import './js/misc.js'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
