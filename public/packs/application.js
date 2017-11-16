/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 5);
/******/ })
/************************************************************************/
/******/ ({

/***/ 5:
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/*! all exports used */
/***/ (function(module, exports) {

eval("/* eslint no-console:0 */\n// This file is automatically compiled by Webpack, along with any other files\n// present in this directory. You're encouraged to place your actual application logic in\n// a relevant structure within app/javascript and only use these pack files to reference\n// that code so it'll be compiled.\n//\n// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate\n// layout file, like app/views/layouts/application.html.erb\nconsole.log('Hello World from Webpacker');\n$('.js-authorMenu .item').tab();\n\n$(document).on('click', '.js-menu', function () {\n    $('.js-sidebar').sidebar('toggle');\n});\n$('.dropdown').dropdown();\n$('.js-postMenu .item').tab();\n\n$('.js-navMenu').popup({\n    hoverable: true,\n    position: 'bottom left',\n    delay: {\n        show: 300,\n        hide: 300\n    }\n});\n$('.js-headerOverlay').visibility({\n    type: 'fixed'\n});//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiNS5qcyIsInNvdXJjZXMiOlsid2VicGFjazovLy8uL2FwcC9qYXZhc2NyaXB0L3BhY2tzL2FwcGxpY2F0aW9uLmpzPzIwNDciXSwic291cmNlc0NvbnRlbnQiOlsiLyogZXNsaW50IG5vLWNvbnNvbGU6MCAqL1xuLy8gVGhpcyBmaWxlIGlzIGF1dG9tYXRpY2FsbHkgY29tcGlsZWQgYnkgV2VicGFjaywgYWxvbmcgd2l0aCBhbnkgb3RoZXIgZmlsZXNcbi8vIHByZXNlbnQgaW4gdGhpcyBkaXJlY3RvcnkuIFlvdSdyZSBlbmNvdXJhZ2VkIHRvIHBsYWNlIHlvdXIgYWN0dWFsIGFwcGxpY2F0aW9uIGxvZ2ljIGluXG4vLyBhIHJlbGV2YW50IHN0cnVjdHVyZSB3aXRoaW4gYXBwL2phdmFzY3JpcHQgYW5kIG9ubHkgdXNlIHRoZXNlIHBhY2sgZmlsZXMgdG8gcmVmZXJlbmNlXG4vLyB0aGF0IGNvZGUgc28gaXQnbGwgYmUgY29tcGlsZWQuXG4vL1xuLy8gVG8gcmVmZXJlbmNlIHRoaXMgZmlsZSwgYWRkIDwlPSBqYXZhc2NyaXB0X3BhY2tfdGFnICdhcHBsaWNhdGlvbicgJT4gdG8gdGhlIGFwcHJvcHJpYXRlXG4vLyBsYXlvdXQgZmlsZSwgbGlrZSBhcHAvdmlld3MvbGF5b3V0cy9hcHBsaWNhdGlvbi5odG1sLmVyYlxuY29uc29sZS5sb2coJ0hlbGxvIFdvcmxkIGZyb20gV2VicGFja2VyJyk7XG4kKCcuanMtYXV0aG9yTWVudSAuaXRlbScpLnRhYigpO1xuXG4kKGRvY3VtZW50KS5vbignY2xpY2snLCAnLmpzLW1lbnUnLCBmdW5jdGlvbiAoKSB7XG4gICAgJCgnLmpzLXNpZGViYXInKS5zaWRlYmFyKCd0b2dnbGUnKTtcbn0pO1xuJCgnLmRyb3Bkb3duJykuZHJvcGRvd24oKTtcbiQoJy5qcy1wb3N0TWVudSAuaXRlbScpLnRhYigpO1xuXG4kKCcuanMtbmF2TWVudScpLnBvcHVwKHtcbiAgICBob3ZlcmFibGU6IHRydWUsXG4gICAgcG9zaXRpb246ICdib3R0b20gbGVmdCcsXG4gICAgZGVsYXk6IHtcbiAgICAgICAgc2hvdzogMzAwLFxuICAgICAgICBoaWRlOiAzMDBcbiAgICB9XG59KTtcbiQoJy5qcy1oZWFkZXJPdmVybGF5JykudmlzaWJpbGl0eSh7XG4gICAgdHlwZTogJ2ZpeGVkJ1xufSk7XG5cblxuLy8vLy8vLy8vLy8vLy8vLy8vXG4vLyBXRUJQQUNLIEZPT1RFUlxuLy8gLi9hcHAvamF2YXNjcmlwdC9wYWNrcy9hcHBsaWNhdGlvbi5qc1xuLy8gbW9kdWxlIGlkID0gNVxuLy8gbW9kdWxlIGNodW5rcyA9IDMiXSwibWFwcGluZ3MiOiJBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBIiwic291cmNlUm9vdCI6IiJ9\n//# sourceURL=webpack-internal:///5\n");

/***/ })

/******/ });