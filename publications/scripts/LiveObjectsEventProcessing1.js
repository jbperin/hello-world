LiveObjectsEventProcessing1 = {
	"info": {
		"name": "Live Objects Event Processing Example 1",
		"_postman_id": "8e9a51ba-fe2f-8e0b-5b24-5c072ec32389",
		"description": "Use case : Tracking of package between the shipment zone, transportation zone and delivery zone.\n\nA truck leaves San Francisco with its shipment. He may take Highway 101 or Route 5 to Los Angeles. \nA state change event will be sent when the tracker changes of zone.\n\nSee user manual for more information.",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "Step1 Create geozones",
			"item": [
				{
					"name": "Create Geozone San Francisco",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"zoneId\", \"san-francisco\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"description\": \"San Francisco zone\",\r\n  \"geometry\": {\r\n    \"coordinates\": [\r\n      [[-123.019952, 38.358596],[-120.954523, 38.306889],\r\n    [-121.789484, 37.124990],[-123.019952, 38.358596]]],\r\n    \"type\": \"Polygon\"\r\n  },\r\n  \"tags\": [\r\n    \"SF-area\", \"shipment\"\r\n  ]\r\n}\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/geozones/{{zoneId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"geozones",
								"{{zoneId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Geozone Los Angeles",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"zoneId\", \"los-angeles\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"description\": \"Los Angeles zone\",\r\n  \"geometry\": {\r\n    \"coordinates\": [\r\n      [[-118.909873, 34.238622],[-117.747086, 34.346562],\r\n    [-117.551111, 33.620728],[-118.269687, 33.533648],[-118.909873, 34.238622]]\r\n    ],\r\n    \"type\": \"Polygon\"\r\n  },\r\n  \"tags\": [\r\n    \"LA-area\", \"delivery\"\r\n  ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/geozones/{{zoneId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"geozones",
								"{{zoneId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Geozone Highway 101",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"zoneId\", \"transportation1\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"description\": \"Transportation zone Highway 101\",\r\n  \"geometry\": {\r\n    \"coordinates\": [\r\n      [[-122.05261237, 37.561997],[-118.154639, 34.059617],\r\n    [-119.203276, 34.102708],[-122.641996, 37.440666],[-122.05261237, 37.561997]]\r\n    ],\r\n    \"type\": \"Polygon\"\r\n  },\r\n  \"tags\": [\r\n    \"transportation\"\r\n  ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/geozones/{{zoneId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"geozones",
								"{{zoneId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Geozone Route 5",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"zoneId\", \"transportation2\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"description\": \"Transportation zone Route 5\",\r\n  \"geometry\": {\r\n    \"coordinates\": [\r\n      [[-121.3220217, 37.8705177],[-118.027739, 34.309766],\r\n    [-118.377685, 33.679366],[-121.662597, 37.714244],[-121.3220217, 37.8705177]]\r\n    ],\r\n    \"type\": \"Polygon\"\r\n  },\r\n  \"tags\": [\r\n    \"transportation\"\r\n  ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/geozones/{{zoneId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"geozones",
								"{{zoneId}}"
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "Step2 Create contexts",
			"item": [
				{
					"name": "Create Context group Transportation ",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"contextId\", \"transportation\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"contextData\": [\"transportation1\",\"transportation2\"],\r\n  \"tags\": [\r\n    \"transportation\",\"zone\",\"california\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/{{contextId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"{{contextId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Context device",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"contextId\", \"device-group\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"contextData\": [\"urn:lora:0020B20000000101\"],\r\n  \"tags\": [\r\n    \"device\",\"truck\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/{{contextId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"{{contextId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Context shipment",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"contextId\", \"shipment\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"contextData\": \"san-francisco\",\r\n  \"tags\": [\r\n    \"geozone\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/{{contextId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"{{contextId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create Context delivery",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"contextId\", \"delivery\");"
								]
							}
						}
					],
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"contextData\": \"los-angeles\",\r\n  \"tags\": [\r\n    \"geozone\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/{{contextId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"{{contextId}}"
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "Step3 Test and create rule",
			"item": [
				{
					"name": "Test State processing rule",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"currentState\": {},\r\n  \"data\": {\r\n    \"metadata\": {\r\n      \"connector\": \"http\",\r\n      \"source\": \"urn:lora:0020B20000000101\"\r\n   },  \r\n   \"streamId\": \"urn:lora:0020B20000000101!uplink\",\r\n    \"location\": {\r\n      \"provider\": \"lora-macro\",\r\n      \"accuracy\": 10,\r\n      \"lon\": -122.169846,\r\n      \"lat\": 37.602902\r\n   },\r\n   \"model\": \"lora_v0\",\r\n   \"value\": {\r\n      \"payload\": \"ae2109000cf3\"\r\n   }\r\n  },\r\n  \"stateProcessingFunction\": {\r\n    \r\n            \"if\": [{\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":\"shipment\"}\r\n            }]\r\n        },\r\n        \"shipment_zone\",\r\n        {\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":[\"transportation\"]}\r\n            }]\r\n        },\r\n        \"transportation_zone\",\r\n        {\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":\"delivery\"}\r\n            }]\r\n        },\r\n        \"delivery_zone\",\r\n        \"unknown_zone\"]\r\n    \r\n  }\r\n  \r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"stateprocessing-rule",
								"test"
							]
						}
					},
					"response": []
				},
				{
					"name": "Create State processing rule",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"geo tracking\",\r\n    \"enabled\": true,\r\n    \"stateFunction\": {\r\n    \r\n            \"if\": [{\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":\"shipment\"}\r\n            }]\r\n        },\r\n        \"shipment_zone\",\r\n        {\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":[\"transportation\"]}\r\n            }]\r\n        },\r\n        \"transportation_zone\",\r\n        {\r\n            \"inside\": [{\r\n                \"var\": \"location.lon\"\r\n            },\r\n            {\r\n                \"var\": \"location.lat\"\r\n            },\r\n            {\r\n                \"ctx\": {\"ctx\":\"delivery\"}\r\n            }]\r\n        },\r\n        \"delivery_zone\",\r\n        \"unknown_zone\"]\r\n    \r\n  },\r\n    \"filterPredicate\": {\"in\": [\r\n        {\r\n          \"var\": \"metadata.source\"\r\n        },\r\n        {\r\n          \"ctx\": \"device-group\"\r\n        }\r\n      ]\r\n  },\r\n    \"stateKeyPath\": \"metadata.source\"\r\n    \r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"stateprocessing-rule"
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "Step4 Send messages",
			"item": [
				{
					"name": "Send data message 1 (SF)",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"streamId\", \"urn:lora:0020B20000000101!uplink\");"
								]
							}
						}
					],
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{ \"metadata\": {\r\n      \"connector\": \"http\",\r\n      \"source\": \"urn:lora:0020B20000000101\"\r\n   },  \r\n    \"location\": {\r\n      \"provider\": \"lora-macro\",\r\n      \"accuracy\": 10,\r\n      \"lon\": -122.169846,\r\n      \"lat\": 37.602902},\r\n   \"model\": \"lora_v0\",\r\n   \"value\": {\r\n      \"payload\": \"ae2109000cf6\"\r\n   },\r\n   \"timestamp\": \"2017-07-26T08:55:44.034Z\",\r\n   \"tags\": [\r\n      \"San Francisco\", \"Tracker\"\r\n     ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/{{streamId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"{{streamId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Send data message 2 (HW101)",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "8323e737-07a0-48ce-bb27-98cb43445b6d",
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"streamId\", \"urn:lora:0020B20000000101!uplink\");"
								]
							}
						}
					],
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{ \"metadata\": {\r\n      \"connector\": \"http\",\r\n      \"source\": \"urn:lora:0020B20000000101\"\r\n   },  \r\n    \"location\": {\r\n      \"provider\": \"lora-macro\",\r\n      \"accuracy\": 10,\r\n      \"lon\": -121.562765,\r\n      \"lat\": 36.969311},\r\n   \"model\": \"lora_v0\",\r\n   \"value\": {\r\n      \"payload\": \"ae2109000cf3\"\r\n   },\r\n   \"timestamp\": \"2017-07-26T08:32:44.034Z\",\r\n   \"tags\": [\r\n      \"Highway 101\", \"Tracker\"\r\n     ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/{{streamId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"{{streamId}}"
							]
						}
					},
					"response": []
				},
				{
					"name": "Send data message 3 (LA)",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "9a777def-ddfb-4ae6-9c4a-ea94a8578392",
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"streamId\", \"urn:lora:0020B20000000101!uplink\");"
								]
							}
						}
					],
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{ \"metadata\": {\r\n      \"connector\": \"http\",\r\n      \"source\": \"urn:lora:0020B20000000101\"\r\n   },  \r\n    \"location\": {\r\n      \"provider\": \"lora-macro\",\r\n      \"accuracy\": 10,\r\n      \"lon\": -118.154555,\r\n      \"lat\": 33.881571},\r\n   \"model\": \"lora_v0\",\r\n   \"value\": {\r\n      \"payload\": \"ae2109000cf3\"\r\n   },\r\n   \"timestamp\": \"2017-07-26T08:32:44.034Z\",\r\n   \"tags\": [\"Los Angeles\", \"Tracker\"\r\n     ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/{{streamId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"{{streamId}}"
							]
						}
					},
					"response": []
				}
			]
		},
		{
			"name": "Step 5  Get event messages",
			"item": [
				{
					"name": "Get the event message",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{apiKey}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{ \"metadata\": {\r\n      \"connector\": \"http\",\r\n      \"source\": \"urn:lora:0020B20000000101\"\r\n   },  \r\n    \"location\": {\r\n      \"provider\": \"lora-macro\",\r\n      \"accuracy\": 10,\r\n      \"lon\": -122.169846,\r\n      \"lat\": 37.602902},\r\n   \"model\": \"lora_v0\",\r\n   \"value\": {\r\n      \"payload\": \"ae2109000cf3\"\r\n   },\r\n   \"timestamp\": \"2017-07-26T08:32:44.034Z\",\r\n   \"tags\": [\r\n      \"San Francisco\", \"Tracker\"\r\n     ]\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/event:{{streamId}}",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"event:{{streamId}}"
							]
						}
					},
					"response": []
				}
			]
		}
	]
};