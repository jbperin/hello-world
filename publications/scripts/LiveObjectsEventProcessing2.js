LiveObjectsEventProcessing2 = {
	"info": {
		"name": "Live Objects Event Processing Example 2",
		"_postman_id": "64e0f0c5-6d70-bdf1-fd4c-ffb3914cae04",
		"description": "Air quality monitoring : \nmonitor 2 pollutants (NO2 and PM10). Raise INFO or ALERT events when thresholds are reached.\nThis example includes SIMPLE EVENT PROCESSING rules and STATE PROCESSING rules.",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "Step1 Context provisioning",
			"description": "",
			"item": [
				{
					"name": "Create Context pm10 alert 1 threshold",
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
							"raw": "{\r\n  \"contextData\": 80,\r\n  \"tags\": [\r\n    \"threshold\",\"alert\",\"pm10\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/pm10-alert-threshold-1",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"pm10-alert-threshold-1"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context no2 info 1 threshold",
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
							"raw": "{\r\n  \"contextData\": 200,\r\n  \"tags\": [\r\n    \"threshold\",\"info\",\"no2\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/no2-info-threshold-1",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"no2-info-threshold-1"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context no2 medium level reached for previous day",
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
							"raw": "{\r\n  \"contextData\": true,\r\n  \"tags\": [\r\n    \"previous day\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/no2-previous-day-medium-level-reached",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"no2-previous-day-medium-level-reached"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context pm10 info 1 threshold",
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
							"raw": "{\r\n  \"contextData\": 50,\r\n  \"tags\": [\r\n    \"threshold\",\"info\",\"pm10\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/pm10-info-threshold-1",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"pm10-info-threshold-1"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context no2 alert 2 threshold",
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
							"raw": "{\r\n  \"contextData\": 200,\r\n  \"tags\": [\r\n    \"threshold\",\"alert\",\"no2\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/no2-alert-threshold-2",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"no2-alert-threshold-2"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context no2 high level reached for previous day",
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
							"raw": "{\r\n  \"contextData\": false,\r\n  \"tags\": [\r\n    \"previous day\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/no2-previous-day-high-level-reache",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"no2-previous-day-high-level-reache"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create Context no2 alert 1 threshold",
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
							"raw": "{\r\n  \"contextData\": 400,\r\n  \"tags\": [\r\n    \"threshold\",\"alert\",\"no2\"\r\n  ]\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/context/no2-alert-threshold-1",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"context",
								"no2-alert-threshold-1"
							]
						},
						"description": ""
					},
					"response": []
				}
			]
		},
		{
			"name": "Step2 State processing rule provisioning",
			"description": "",
			"item": [
				{
					"name": "Create State processing rule PM10 daily pollution level",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRuleNO2DailyPollutionId\", jsonData.id);",
									""
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
							"raw": "{\r\n    \"name\": \"PM10 daily pollution level\",\r\n    \"enabled\": true,\r\n    \"stateFunction\": {\r\n        \"if\": [\r\n    { \r\n    \"and\" :\r\n                [\r\n           { \"<\": [{ \"var\": \"value.avg-PM10\"}, {\"ctx\": \"pm10-info-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n    \r\n    \r\n    },\r\n        \"LOW\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \"<\": [{\"ctx\": \"pm10-info-threshold-1\"},{ \"var\": \"value.avg-PM10\"},{\"ctx\": \"pm10-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"MEDIUM\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \">\": [{ \"var\": \"value.avg-PM10\"},{\"ctx\": \"pm10-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"HIGH\"]\r\n  },\r\n    \"stateKeyPath\": \"streamId\"\r\n    \r\n}"
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
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create State processing rule NO2 daily pollution level",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRuleNO2DailyPollutionId\", jsonData.id);",
									""
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
							"raw": "{\r\n    \"name\": \"NO2 daily pollution level\",\r\n    \"enabled\": true,\r\n    \"stateFunction\": {\r\n        \"if\": [\r\n    { \r\n    \"and\" :\r\n                [\r\n           { \"<\": [{ \"var\": \"value.avg-NO2\"}, {\"ctx\": \"no2-alert-threshold-2\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n    \r\n    \r\n    },\r\n        \"LOW\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \"<\": [{\"ctx\": \"no2-alert-threshold-2\"},{ \"var\": \"value.avg-NO2\"},{\"ctx\": \"no2-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"MEDIUM\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \">\": [{ \"var\": \"value.avg-NO2\"},{\"ctx\": \"no2-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"HIGH\"]\r\n  },\r\n    \"stateKeyPath\": \"streamId\"\r\n    \r\n}"
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
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test State processing rule PM10 daily pollution level",
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
							"raw": "{\r\n  \"currentState\": {},\r\n  \"data\": {\r\n   \"streamId\": \"paris-centre-daily\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_daily\",\r\n   \"value\": {\r\n       \"type\":\"daily\",\r\n      \"avg-NO2\":90.2,\r\n      \"avg-PM10\":50.1,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T00:00:00Z\"\r\n  },\r\n  \"stateProcessingFunction\": {\r\n        \"if\": [\r\n    { \r\n    \"and\" :\r\n                [\r\n           { \"<\": [{ \"var\": \"value.avg-PM10\"}, {\"ctx\": \"pm10-info-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n    \r\n    \r\n    },\r\n        \"LOW\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \"<\": [{\"ctx\": \"pm10-info-threshold-1\"},{ \"var\": \"value.avg-PM10\"},{\"ctx\": \"pm10-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"MEDIUM\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \">\": [{ \"var\": \"value.avg-PM10\"},{\"ctx\": \"pm10-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"HIGH\"]\r\n    \r\n  }\r\n  \r\n\r\n}"
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
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test State processing rule NO2 daily pollution level",
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
							"raw": "{\r\n  \"currentState\": {},\r\n  \"data\": {\r\n   \"streamId\": \"paris-centre-daily\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_daily\",\r\n   \"value\": {\r\n       \"type\":\"daily\",\r\n      \"avg-NO2\":9,\r\n      \"avg-PM10\":9,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T00:00:00Z\"\r\n  },\r\n  \"stateProcessingFunction\": {\r\n        \"if\": [\r\n    { \r\n    \"and\" :\r\n                [\r\n           { \"<\": [{ \"var\": \"value.avg-NO2\"}, {\"ctx\": \"no2-alert-threshold-2\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n    \r\n    \r\n    },\r\n        \"LOW\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \"<\": [{\"ctx\": \"no2-alert-threshold-2\"},{ \"var\": \"value.avg-NO2\"},{\"ctx\": \"no2-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"MEDIUM\",\r\n        {\r\n              \"and\" :\r\n                [\r\n           { \">\": [{ \"var\": \"value.avg-NO2\"},{\"ctx\": \"no2-alert-threshold-1\"} ]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"daily\"]}\r\n                ]\r\n          \r\n        },\r\n        \"HIGH\"]\r\n    \r\n  }\r\n  \r\n\r\n}"
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
						},
						"description": ""
					},
					"response": []
				}
			]
		},
		{
			"name": "Step3 Matching Rule provisioning",
			"description": "",
			"item": [
				{
					"name": "Create matching rule PM10 info",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRulePM10InfoId\", jsonData.id);"
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
							"raw": "{\r\n  \"name\": \"pm10-info-level-reached\",\r\n  \"dataPredicate\": {     \"and\" :\r\n                [\r\n                   { \"<\" : [{\"ctx\": \"pm10-info-threshold-1\"},  { \"var\" : \"value.avg-PM10\" }, {\"ctx\": \"pm10-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]},\r\n  \"enabled\": true\r\n\r\n}\r\n\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create matching rule NO2 alerting based on 3 consecutive measure",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRuleNO2Alerting400Id\", jsonData.id);"
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
							"raw": "{\r\n  \"name\": \"no2-alert-level-3-consecutive-hours-threshold1\",\r\n  \"dataPredicate\": { \"and\" :\r\n                [\r\n                   { \">\" : [ { \"var\" : \"value.data1.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   { \">\" : [ { \"var\" : \"value.data2.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   { \">\" : [ { \"var\" : \"value.data3.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"last_three_hours\"]}\r\n                ]},\r\n  \"enabled\": true\r\n\r\n}\r\n\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create matching rule NO2 info",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRuleNO2InfoId\", jsonData.id);"
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
							"raw": "{\r\n  \"name\": \"no2-info-level-reached\",\r\n  \"dataPredicate\": {     \"and\" :\r\n                [\r\n                   { \">\" : [ { \"var\" : \"value.NO2\" }, {\"ctx\": \"no2-info-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]},\r\n  \"enabled\": true\r\n\r\n}\r\n\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test SEP matching rule PM10 info",
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
							"raw": "{\r\n  \"data\": {\r\n    \"metadata\": {\r\n      \"connector\": \"http\"\r\n      },  \r\n   \"streamId\":  \"paris-centre-hourly\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_hourly\",\r\n   \"value\": {\r\n       \"type\":\"hourly\",\r\n      \"NO2\":300,\r\n      \"PM10\":51,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T02:00:00Z\"\r\n  },\r\n  \"dataPredicate\": {\r\n    \"and\" :\r\n                [\r\n                   { \"<\" : [{\"ctx\": \"pm10-info-threshold-1\"},  { \"var\" : \"value.PM10\" }, {\"ctx\": \"pm10-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]\r\n    \r\n  }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule",
								"test"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create matching rule NO2 alerting based on yesterday level",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRuleNO2Alerting200Id\", jsonData.id);"
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
							"raw": "{\r\n  \"name\": \"no2-alert-level-reached-threshold2\",\r\n  \"dataPredicate\": {\r\n  \"and\": [{\r\n    \">\": [{\"var\": \"value.NO2\"},  {\"ctx\": \"no2-alert-threshold-2\"  }]\r\n  },\r\n  {\r\n    \"or\": [{\"==\": [{\"ctx\": \"no2-previous-day-medium-level-reached\"},true]},\r\n    {\"==\": [{\"ctx\": \"no2-previous-day-high-level-reached\"},true]}]\r\n  },\r\n  {\r\n    \"==\": [{\"var\": \"value.type\"},\"hourly\"]}]\r\n  },\r\n  \"enabled\": true\r\n\r\n}\r\n\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create matching rule PM10 alert",
					"event": [
						{
							"listen": "test",
							"script": {
								"type": "text/javascript",
								"exec": [
									"var jsonData = JSON.parse(responseBody);",
									"postman.setEnvironmentVariable(\"matchingRulePM10AlertId\", jsonData.id);"
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
							"raw": "{\r\n  \"name\": \"pm10-info-level-reached\",\r\n  \"dataPredicate\": {     \"and\" :\r\n                [\r\n                   { \">\" : [ { \"var\" : \"value.avg-PM10\" }, {\"ctx\": \"pm10-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]},\r\n  \"enabled\": true\r\n\r\n}\r\n\r\n\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test SEP matching rule NO2 alerting based on yesterday level",
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
							"raw": "{\r\n  \"data\": {\r\n   \"streamId\": \"paris-centre-hourly\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_hourly\",\r\n   \"value\": {\r\n       \"type\":\"hourly\",\r\n      \"NO2\":201,\r\n      \"PM10\":15,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T02:00:00Z\"\r\n  },\r\n  \"dataPredicate\": {\r\n  \"and\": [{\r\n    \">\": [{\"var\": \"value.NO2\"},  {\"ctx\": \"no2-alert-threshold-2\"  }]\r\n  },\r\n  {\r\n    \"or\": [{\"==\": [{\"ctx\": \"no2-previous-day-medium-level-reached\"},true]},\r\n    {\"==\": [{\"ctx\": \"no2-previous-day-high-level-reached\"},true]}]\r\n  },\r\n  {\r\n    \"==\": [{\"var\": \"value.type\"},\"hourly\"]}]\r\n  }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule",
								"test"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test SEP matching rule NO2 info",
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
							"raw": "{\r\n  \"data\": {\r\n    \"metadata\": {\r\n      \"connector\": \"http\"\r\n      },  \r\n   \"streamId\":  \"paris-centre-hourly\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_hourly\",\r\n   \"value\": {\r\n       \"type\":\"hourly\",\r\n      \"NO2\":300,\r\n      \"PM10\":15,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T02:00:00Z\"\r\n  },\r\n  \"dataPredicate\": {\r\n    \"and\" :\r\n                [\r\n                   { \">\" : [{ \"var\" : \"value.NO2\" }, {\"ctx\": \"no2-info-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]\r\n    \r\n  }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule",
								"test"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test SEP matching rule PM10 alert",
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
							"raw": "{\r\n  \"data\": {\r\n    \"metadata\": {\r\n      \"connector\": \"http\"\r\n      },  \r\n   \"streamId\":  \"paris-centre-hourly\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_hourly\",\r\n   \"value\": {\r\n       \"type\":\"hourly\",\r\n      \"avg-NO2\":300,\r\n      \"avg-PM10\":81,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T02:00:00Z\"\r\n  },\r\n  \"dataPredicate\": {\r\n    \"and\" :\r\n                [\r\n                   { \">\" : [{ \"var\" : \"value.avg-PM10\" }, {\"ctx\": \"pm10-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"hourly\"]}\r\n                ]\r\n    \r\n  }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule",
								"test"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Test SEP matching rule NO2 alerting based on 3 consecutive measures",
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
							"raw": "{\r\n  \"data\": {\r\n    \"metadata\": {\r\n      \"connector\": \"http\"\r\n      },  \r\n   \"streamId\":  \"paris-centre-last-3-hours\",\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_last_three_hours\",\r\n   \"value\": {\r\n       \"type\":\"last_three_hours\",\r\n    \"data1\": {\"value\":{\"NO2\":420,\"PM10\":15},\"timestamp\":\"2017-07-27T01:00:00Z\"},\r\n    \"data2\": {\"value\": {\"NO2\":401,\"PM10\":25},\"timestamp\":\"2017-07-27T02:00:00Z\"},\r\n    \"data3\": {\"value\": {\"NO2\":420,\"PM10\":35},\"timestamp\":\"2017-07-27T03:00:00Z\"},\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T03:00:00Z\"\r\n  },\r\n  \"dataPredicate\": {\r\n    \"and\" :\r\n                [\r\n                   { \">\" : [ { \"var\" : \"value.data1.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   { \">\" : [ { \"var\" : \"value.data2.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   { \">\" : [ { \"var\" : \"value.data3.value.NO2\" }, {\"ctx\": \"no2-alert-threshold-1\"}]},\r\n                   {\"==\": [{ \"var\" : \"value.type\"}, \"last_three_hours\"]}\r\n                ]\r\n    \r\n  }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/test",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule",
								"test"
							]
						},
						"description": ""
					},
					"response": []
				}
			]
		},
		{
			"name": "Step3 bis Firing rule provisioning",
			"description": "",
			"item": [
				{
					"name": "Create firing rule NO2 Info",
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
							"raw": "{\r\n  \"aggregationKeys\": [\r\n    \"streamId\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"SLEEP\",\r\n  \"matchingRuleIds\": [\r\n    \"{{matchingRuleNO2InfoId}}\"\r\n  ],\r\n  \"name\": \"firing NO2 INFO\",\r\n  \"sleepDuration\": \"PT2H\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create firing rule PM10 Info",
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
							"raw": "{\r\n  \"aggregationKeys\": [\r\n    \"streamId\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"SLEEP\",\r\n  \"matchingRuleIds\": [\r\n    \"{{matchingRulePM10InfoId}}\"\r\n  ],\r\n  \"name\": \"firing PM10 INFO\",\r\n    \"sleepDuration\": \"PT2H\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create firing rule PM10 Alert",
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
							"raw": "{\r\n  \"aggregationKeys\": [\r\n    \"streamId\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"ALWAYS\",\r\n  \"matchingRuleIds\": [\r\n    \"{{matchingRulePM10AlertId}}\"\r\n  ],\r\n  \"name\": \"firing PM10 ALERT\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create firing rule NO2 Alert 200",
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
							"raw": "{\r\n  \"aggregationKeys\": [\r\n    \"streamId\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"ALWAYS\",\r\n  \"matchingRuleIds\": [\r\n    \"{{matchingRuleNO2Alerting200Id}}\"\r\n  ],\r\n  \"name\": \"firing NO2 alert 200\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Create firing rule NO2 Alert 400",
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
							"raw": "{\r\n  \"aggregationKeys\": [\r\n    \"streamId\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"ALWAYS\",\r\n  \"matchingRuleIds\": [\r\n    \"{{matchingRuleNO2Alerting400Id}}\"\r\n  ],\r\n  \"name\": \"firing NO2 alert 400\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": ""
					},
					"response": []
				}
			]
		},
		{
			"name": "Step4 Post data",
			"description": "",
			"item": [
				{
					"name": "Send data message on stream paris-centre-last-3-hours",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"",
									"",
									"",
									"",
									""
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
							"raw": "{\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_last_three_hours\",\r\n   \"value\": {\r\n       \"type\":\"last_three_hours\",\r\n    \"data1\": {\"value\":{\"NO2\":420,\"PM10\":16},\"timestamp\":\"2017-07-27T11:00:00Z\"},\r\n    \"data2\": {\"value\": {\"NO2\":401,\"PM10\":14},\"timestamp\":\"2017-07-27T12:00:00Z\"},\r\n    \"data3\": {\"value\": {\"NO2\":450,\"PM10\":17},\"timestamp\":\"2017-07-27T13:00:00Z\"},\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-27T13:00:00Z\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/paris-centre-last-3-hours",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"paris-centre-last-3-hours"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Send data message on stream paris-centre-hourly",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"",
									"",
									"",
									""
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
							"raw": "{\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_hourly\",\r\n   \"value\": {\r\n       \"type\":\"hourly\",\r\n      \"NO2\":450,\r\n      \"PM10\":41,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\": \"2017-07-27T14:00:00Z\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/paris-centre-hourly",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"paris-centre-hourly"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Send data message on stream paris-centre-daily",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"",
									"",
									""
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
							"raw": "{\r\n    \"location\": {\r\n    \"lon\":2.2945, \"lat\" : 48.8584\r\n   },\r\n   \"model\": \"model_daily\",\r\n   \"value\": {\r\n       \"type\":\"daily\",\r\n      \"avg-NO2\":91.8,\r\n      \"avg-PM10\":20.6,\r\n      \"monitoring-station\":\"paris-centre\"\r\n   },\r\n   \"timestamp\":\"2017-07-28T00:00:00Z\"\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/paris-centre-daily",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"paris-centre-daily"
							]
						},
						"description": ""
					},
					"response": []
				}
			]
		},
		{
			"name": "Step5 Search data and events",
			"description": "",
			"item": [
				{
					"name": "Get daily values in a range of dates",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"dateStart\", \"2017-07-27\");",
									"postman.setEnvironmentVariable(\"dateEnd\", \"2017-07-28\");"
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
							"raw": "{\n    \"from\": 0,\n    \"size\": 10,\n    \"query\": {\n        \"filtered\": {\n            \"filter\": {\n                \"bool\":{\n                    \"must\":  [  \n                          {\n                              \"term\": {\n                                  \"streamId\": \"paris-centre-hourly\"\n                              }\n                          },\n                          {\n                              \"range\": {\n                                  \"timestamp\": {\n                                      \"gte\":\"{{dateStart}}\",\n                                      \"lt\":\"{{dateEnd}}\"\n                                  }\n                              }\n                          }  \n                    ]\n                }\n            }\n        }\n    }\n}\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Get events for daily data in a range of dates",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"dateStart\", \"2017-08-03\");",
									"postman.setEnvironmentVariable(\"dateEnd\", \"2017-08-08\");"
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
							"raw": "{\n    \"from\": 0,\n    \"size\": 10,\n    \"query\": {\n        \"filtered\": {\n            \"filter\": {\n                \"bool\":{\n                    \"must\":  [  \n                          {\n                              \"term\": {\n                                  \"streamId\": \"event:paris-centre-daily\"\n                              }\n                          },\n                          {\n                              \"range\": {\n                                  \"timestamp\": {\n                                      \"gte\":\"{{dateStart}}\",\n                                      \"lt\":\"{{dateEnd}}\"\n                                  }\n                              }\n                          }  \n                    ]\n                }\n            }\n        }\n    }\n}\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Get events for last_3_hours data in a range of dates",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"dateStart\", \"2017-08-03\");",
									"postman.setEnvironmentVariable(\"dateEnd\", \"2017-08-08\");"
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
							"raw": "{\n    \"from\": 0,\n    \"size\": 10,\n    \"query\": {\n        \"filtered\": {\n            \"filter\": {\n                \"bool\":{\n                    \"must\":  [  \n                          {\n                              \"term\": {\n                                  \"streamId\": \"event:paris-centre-last-3-hours\"\n                              }\n                          },\n                          {\n                              \"range\": {\n                                  \"timestamp\": {\n                                      \"gte\":\"{{dateStart}}\",\n                                      \"lt\":\"{{dateEnd}}\"\n                                  }\n                              }\n                          }  \n                    ]\n                }\n            }\n        }\n    }\n}\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Get events for hourly data in a range of dates",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"dateStart\", \"2017-08-03\");",
									"postman.setEnvironmentVariable(\"dateEnd\", \"2017-08-08\");"
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
							"raw": "{\n    \"from\": 0,\n    \"size\": 10,\n    \"query\": {\n        \"filtered\": {\n            \"filter\": {\n                \"bool\":{\n                    \"must\":  [  \n                          {\n                              \"term\": {\n                                  \"streamId\": \"event:paris-centre-hourly\"\n                              }\n                          },\n                          {\n                              \"range\": {\n                                  \"timestamp\": {\n                                      \"gte\":\"{{dateStart}}\",\n                                      \"lt\":\"{{dateEnd}}\"\n                                  }\n                              }\n                          }  \n                    ]\n                }\n            }\n        }\n    }\n}\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": ""
					},
					"response": []
				},
				{
					"name": "Get daily average values",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"type": "text/javascript",
								"exec": [
									"postman.setEnvironmentVariable(\"dateStart\", \"2017-07-27\");",
									"postman.setEnvironmentVariable(\"dateEnd\", \"2017-07-28\");"
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
							"raw": "{ \"size\":0,\n    \"query\": {\n        \"filtered\": {\n            \"filter\": {\n                \"bool\":{\n                    \"must\":  [  \n                          {\n                              \"term\": {\n                                  \"streamId\": \"paris-centre-hourly\"\n                              }\n                          },\n                          {\n                              \"range\": {\n                                  \"timestamp\": {\n                                      \"gte\":\"{{dateStart}}\",\n                                      \"lt\":\"{{dateEnd}}\"\n                                  }\n                              }\n                          }  \n                    ]\n                }\n            }\n        }\n    },\n    \"aggs\" : {\n          \"avg-NO2\" : { \n            \"avg\" : { \"field\" : \"@model_hourly.value.NO2\" } \n            \n          },\n          \"avg-PM10\" : { \n            \"avg\" : { \"field\" : \"@model_hourly.value.PM10\" } \n            \n          }\n    }\n}\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"host": [
								"https://liveobjects.orange-business.com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": ""
					},
					"response": []
				}
			]
		}
	]
};