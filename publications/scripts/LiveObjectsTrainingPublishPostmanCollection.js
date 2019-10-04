LiveObjectsTrainingPublish = {
	"info": {
		"_postman_id": "9a348ead-78b9-ef61-59c1-4af7ecd021c5",
		"name": "Live Objects Training publish",
		"description": "This collection is one of the Live Objects trainings support. You will find collection of requests on the following subjects :\r\n\r\n- Data zone\r\n- Rule Engine\r\n- Device management\r\n- MQTT Debug mode\r\n\r\n\r\nFor further technical informations, please check\r\n\r\n- the Swagger, the FAQ, the technical documentation : https://liveobjects.orange-business.com/#/faq\r\n- the stack overflow with orange-api tag or ask directly your question to our support : https://liveobjects.orange-business.com/#/support\r\n\r\nThis content will evolve with the permanent platform upgrades.",
		"schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
	},
	"item": [
		{
			"name": "Requests on Datazone",
			"item": [
				{
					"name": "Storage service - Retrieve data from a streamId",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/android357329073120059?limit=1000",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"android357329073120059"
							],
							"query": [
								{
									"key": "limit",
									"value": "1000"
								}
							]
						},
						"description": "Retreive the last 1000 elements of the stream : android357329073120059\nYou cannot request more than 1000 elements through this request, you need to manage bookmarks with successive requests. In order to set a bookmark, get the \"id\" of the last retreived document and use it as a bookmark. \nIn this example the last data has the following id :  \"id\": \"5ae0442fc74a496d16df30cc\"\nSee the next request."
					},
					"response": [
						{
							"name": "Retrieve data from the streamId",
							"originalRequest": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/android357329073120059?limit=100",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"streams",
										"android357329073120059"
									],
									"query": [
										{
											"key": "limit",
											"value": "100"
										}
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "*",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 23 Nov 2017 16:01:23 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "transfer-encoding",
									"value": "chunked",
									"name": "transfer-encoding",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-result-count",
									"value": "100",
									"name": "x-result-count",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "[ {\n  \"id\" : \"5a16a9507676a7304f6393a4\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:16.131Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 43,\n    \"revmin\" : 5216,\n    \"temperature\" : 118\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:16.133Z\"\n}, {\n  \"id\" : \"5a16a94bc74a4951f54f23c5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:11.131Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 100,\n    \"revmin\" : 8624,\n    \"temperature\" : -7\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:11.131Z\"\n}, {\n  \"id\" : \"5a16a946c74a4951f54f2391\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:06.121Z\",\n  \"location\" : {\n    \"lat\" : 45.76739,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 44,\n    \"revmin\" : 8925,\n    \"temperature\" : 61\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:06.122Z\"\n}, {\n  \"id\" : \"5a16a9417676a7304f6392f1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:01.113Z\",\n  \"location\" : {\n    \"lat\" : 45.76734,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 7513,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:01.114Z\"\n}, {\n  \"id\" : \"5a15caa7c74a4951f542e1a5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:15.411Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 3996,\n    \"temperature\" : 35\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:15.412Z\"\n}, {\n  \"id\" : \"5a15caa2c74a4951f542e17a\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:10.409Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 268,\n    \"temperature\" : -5\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:10.411Z\"\n}, {\n  \"id\" : \"5a15ca9dc74a4951f542e143\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:05.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 77,\n    \"revmin\" : 7908,\n    \"temperature\" : -17\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:05.408Z\"\n}, {\n  \"id\" : \"5a15ca987676a7304f5750f0\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:00.415Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 5702,\n    \"temperature\" : -18\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:00.418Z\"\n}, {\n  \"id\" : \"5a15ca937676a7304f5750b2\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:55.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 95,\n    \"revmin\" : 2994,\n    \"temperature\" : 114\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:55.408Z\"\n}, {\n  \"id\" : \"5a15ca8e7676a7304f575075\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:50.431Z\",\n  \"location\" : {\n    \"lat\" : 45.76327,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 98,\n    \"revmin\" : 5261,\n    \"temperature\" : 86\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:50.433Z\"\n}, {\n  \"id\" : \"5a15ca89c74a4951f542e06b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:45.433Z\",\n  \"location\" : {\n    \"lat\" : 45.76302,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 8137,\n    \"temperature\" : 20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:45.436Z\"\n}, {\n  \"id\" : \"5a15ca84c74a4951f542e03d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:40.447Z\",\n  \"location\" : {\n    \"lat\" : 45.76295,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 36,\n    \"revmin\" : 234,\n    \"temperature\" : 79\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:40.448Z\"\n}, {\n  \"id\" : \"5a15ca7fc74a4951f542e002\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:35.412Z\",\n  \"location\" : {\n    \"lat\" : 45.76287,\n    \"lon\" : 4.83818\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 3056,\n    \"temperature\" : 110\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:35.413Z\"\n}, {\n  \"id\" : \"5a15ca7a7676a7304f574faa\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:30.401Z\",\n  \"location\" : {\n    \"lat\" : 45.76266,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 61,\n    \"revmin\" : 6620,\n    \"temperature\" : 61\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:30.404Z\"\n}, {\n  \"id\" : \"5a15ca75c74a4951f542dfa2\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:25.426Z\",\n  \"location\" : {\n    \"lat\" : 45.76208,\n    \"lon\" : 4.83809\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 6842,\n    \"temperature\" : 115\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:25.427Z\"\n}, {\n  \"id\" : \"5a15ca70c74a4951f542df71\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:20.401Z\",\n  \"location\" : {\n    \"lat\" : 45.76163,\n    \"lon\" : 4.83803\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 60,\n    \"revmin\" : 2512,\n    \"temperature\" : 56\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:20.403Z\"\n}, {\n  \"id\" : \"5a15ca6bc74a4951f542df3e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:15.420Z\",\n  \"location\" : {\n    \"lat\" : 45.76153,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 5131,\n    \"temperature\" : 30\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:15.422Z\"\n}, {\n  \"id\" : \"5a15ca667676a7304f574ed8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:10.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76099,\n    \"lon\" : 4.8379\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 9,\n    \"revmin\" : 5789,\n    \"temperature\" : 69\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:10.410Z\"\n}, {\n  \"id\" : \"5a15ca627676a7304f574ead\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:06.572Z\",\n  \"location\" : {\n    \"lat\" : 45.76059,\n    \"lon\" : 4.83782\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 9057,\n    \"temperature\" : -1\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:06.692Z\"\n}, {\n  \"id\" : \"5a15ca5cc74a4951f542de83\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:00.605Z\",\n  \"location\" : {\n    \"lat\" : 45.76038,\n    \"lon\" : 4.83779\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 4783,\n    \"temperature\" : 119\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:00.606Z\"\n}, {\n  \"id\" : \"5a15ca577676a7304f574e27\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:55.400Z\",\n  \"location\" : {\n    \"lat\" : 45.76017,\n    \"lon\" : 4.83776\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 31,\n    \"revmin\" : 9319,\n    \"temperature\" : 59\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:55.402Z\"\n}, {\n  \"id\" : \"5a15ca52c74a4951f542de08\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:50.437Z\",\n  \"location\" : {\n    \"lat\" : 45.76,\n    \"lon\" : 4.83773\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 53,\n    \"revmin\" : 7110,\n    \"temperature\" : 99\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:50.439Z\"\n}, {\n  \"id\" : \"5a15ca4dc74a4951f542ddd1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:45.395Z\",\n  \"location\" : {\n    \"lat\" : 45.75932,\n    \"lon\" : 4.83755\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 90,\n    \"revmin\" : 5198,\n    \"temperature\" : 14\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:45.397Z\"\n}, {\n  \"id\" : \"5a15ca487676a7304f574d89\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:40.392Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 81,\n    \"revmin\" : 3449,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:40.394Z\"\n}, {\n  \"id\" : \"5a15ca437676a7304f574d5e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:35.874Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 1321,\n    \"temperature\" : 56\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:35.878Z\"\n}, {\n  \"id\" : \"5a15ca3ec74a4951f542dd3e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:30.407Z\",\n  \"location\" : {\n    \"lat\" : 45.75886,\n    \"lon\" : 4.83731\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 89,\n    \"revmin\" : 7015,\n    \"temperature\" : 45\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:30.409Z\"\n}, {\n  \"id\" : \"5a15ca397676a7304f574ced\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:25.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75842,\n    \"lon\" : 4.8371\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 35,\n    \"revmin\" : 1841,\n    \"temperature\" : 3\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:25.412Z\"\n}, {\n  \"id\" : \"5a15ca357676a7304f574cb4\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:21.427Z\",\n  \"location\" : {\n    \"lat\" : 45.75802,\n    \"lon\" : 4.83689\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 72,\n    \"revmin\" : 1818,\n    \"temperature\" : 118\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:21.524Z\"\n}, {\n  \"id\" : \"5a15ca2f7676a7304f574c59\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:15.413Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 61,\n    \"revmin\" : 4798,\n    \"temperature\" : 5\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:15.416Z\"\n}, {\n  \"id\" : \"5a15ca2ac74a4951f542dc50\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:10.410Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 10,\n    \"revmin\" : 1658,\n    \"temperature\" : 71\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:10.432Z\"\n}, {\n  \"id\" : \"5a15ca257676a7304f574bfe\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:05.647Z\",\n  \"location\" : {\n    \"lat\" : 45.75757,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 33,\n    \"revmin\" : 9676,\n    \"temperature\" : 75\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:05.650Z\"\n}, {\n  \"id\" : \"5a15ca20c74a4951f542dbd1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:00.407Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 78,\n    \"revmin\" : 5241,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:00.409Z\"\n}, {\n  \"id\" : \"5a15ca1b7676a7304f574b87\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:55.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 801,\n    \"temperature\" : 36\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:55.412Z\"\n}, {\n  \"id\" : \"5a15ca187676a7304f574b5f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:51.854Z\",\n  \"location\" : {\n    \"lat\" : 45.75734,\n    \"lon\" : 4.83654\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 7684,\n    \"temperature\" : 7\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:52.364Z\"\n}, {\n  \"id\" : \"5a15ca117676a7304f574b05\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:45.412Z\",\n  \"location\" : {\n    \"lat\" : 45.75735,\n    \"lon\" : 4.83648\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 43,\n    \"revmin\" : 4928,\n    \"temperature\" : 63\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:45.414Z\"\n}, {\n  \"id\" : \"5a15ca0cc74a4951f542daef\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:40.417Z\",\n  \"location\" : {\n    \"lat\" : 45.75729,\n    \"lon\" : 4.83644\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 428,\n    \"temperature\" : -8\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:40.419Z\"\n}, {\n  \"id\" : \"5a15ca077676a7304f574a8b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:35.433Z\",\n  \"location\" : {\n    \"lat\" : 45.75726,\n    \"lon\" : 4.83655\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 11,\n    \"revmin\" : 4650,\n    \"temperature\" : 53\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:35.435Z\"\n}, {\n  \"id\" : \"5a15ca02c74a4951f542da70\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:30.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75724,\n    \"lon\" : 4.83664\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 87,\n    \"revmin\" : 656,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:30.413Z\"\n}, {\n  \"id\" : \"5a15c9707676a7304f57433d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:01:04.260Z\",\n  \"location\" : {\n    \"lat\" : 45.75717,\n    \"lon\" : 4.83687\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 97,\n    \"revmin\" : 9356,\n    \"temperature\" : 52\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:01:04.262Z\"\n}, {\n  \"id\" : \"5a15c969c74a4951f542d307\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:57.981Z\",\n  \"location\" : {\n    \"lat\" : 45.7572,\n    \"lon\" : 4.83675\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 39,\n    \"revmin\" : 7358,\n    \"temperature\" : -11\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:57.984Z\"\n}, {\n  \"id\" : \"5a15c9657676a7304f5742c8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:53.333Z\",\n  \"location\" : {\n    \"lat\" : 45.75724,\n    \"lon\" : 4.83664\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 53,\n    \"revmin\" : 7329,\n    \"temperature\" : 72\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:53.334Z\"\n}, {\n  \"id\" : \"5a15c95fc74a4951f542d2a9\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:47.978Z\",\n  \"location\" : {\n    \"lat\" : 45.75726,\n    \"lon\" : 4.83655\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 9691,\n    \"temperature\" : 24\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:47.980Z\"\n}, {\n  \"id\" : \"5a15c95b7676a7304f574252\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:43.008Z\",\n  \"location\" : {\n    \"lat\" : 45.75729,\n    \"lon\" : 4.83644\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 38,\n    \"revmin\" : 7620,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:43.010Z\"\n}, {\n  \"id\" : \"5a15c9597676a7304f574237\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:41.051Z\",\n  \"location\" : {\n    \"lat\" : 45.75735,\n    \"lon\" : 4.83648\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 93,\n    \"revmin\" : 3036,\n    \"temperature\" : 37\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:41.054Z\"\n}, {\n  \"id\" : \"5a15c9597676a7304f574236\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:41.051Z\",\n  \"location\" : {\n    \"lat\" : 45.75734,\n    \"lon\" : 4.83654\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 41,\n    \"revmin\" : 5401,\n    \"temperature\" : 28\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:41.053Z\"\n}, {\n  \"id\" : \"5a15c94bc74a4951f542d1b9\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:27.984Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 8572,\n    \"temperature\" : 106\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:27.985Z\"\n}, {\n  \"id\" : \"5a15c947c74a4951f542d184\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:23.007Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 97,\n    \"revmin\" : 1601,\n    \"temperature\" : 53\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:23.009Z\"\n}, {\n  \"id\" : \"5a15c943c74a4951f542d14f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:19.816Z\",\n  \"location\" : {\n    \"lat\" : 45.75757,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 93,\n    \"revmin\" : 4622,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:19.817Z\"\n}, {\n  \"id\" : \"5a15c93d7676a7304f5740dd\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:13.882Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 7918,\n    \"temperature\" : 2\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:13.885Z\"\n}, {\n  \"id\" : \"5a15c937c74a4951f542d0af\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:07.968Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 19,\n    \"revmin\" : 3291,\n    \"temperature\" : 31\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:07.995Z\"\n}, {\n  \"id\" : \"5a15c9337676a7304f57405a\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:02.998Z\",\n  \"location\" : {\n    \"lat\" : 45.75802,\n    \"lon\" : 4.83689\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 81,\n    \"revmin\" : 7955,\n    \"temperature\" : 82\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:03.001Z\"\n}, {\n  \"id\" : \"5a15c92dc74a4951f542d030\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:57.991Z\",\n  \"location\" : {\n    \"lat\" : 45.75842,\n    \"lon\" : 4.8371\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 69,\n    \"revmin\" : 412,\n    \"temperature\" : 71\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:57.994Z\"\n}, {\n  \"id\" : \"5a15c929c74a4951f542cffb\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:53.050Z\",\n  \"location\" : {\n    \"lat\" : 45.75886,\n    \"lon\" : 4.83731\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 59,\n    \"revmin\" : 7011,\n    \"temperature\" : 24\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:53.053Z\"\n}, {\n  \"id\" : \"5a15c9247676a7304f573f99\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:47.998Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 84,\n    \"revmin\" : 8859,\n    \"temperature\" : 72\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:48Z\"\n}, {\n  \"id\" : \"5a15c91e7676a7304f573f5b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:42.981Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 34,\n    \"revmin\" : 7456,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:42.983Z\"\n}, {\n  \"id\" : \"5a15c91a7676a7304f573f1c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:38.084Z\",\n  \"location\" : {\n    \"lat\" : 45.75932,\n    \"lon\" : 4.83755\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 56,\n    \"revmin\" : 7379,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:38.086Z\"\n}, {\n  \"id\" : \"5a15c914c74a4951f542cf11\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:32.982Z\",\n  \"location\" : {\n    \"lat\" : 45.76,\n    \"lon\" : 4.83773\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 23,\n    \"revmin\" : 2984,\n    \"temperature\" : 104\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:32.985Z\"\n}, {\n  \"id\" : \"5a15c90f7676a7304f573ebc\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:27.990Z\",\n  \"location\" : {\n    \"lat\" : 45.76017,\n    \"lon\" : 4.83776\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 7543,\n    \"temperature\" : 46\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:27.991Z\"\n}, {\n  \"id\" : \"5a15c90b7676a7304f573e83\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:23.528Z\",\n  \"location\" : {\n    \"lat\" : 45.76038,\n    \"lon\" : 4.83779\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 83,\n    \"revmin\" : 9756,\n    \"temperature\" : 104\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:23.530Z\"\n}, {\n  \"id\" : \"5a15c8df7676a7304f573c94\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:39.858Z\",\n  \"location\" : {\n    \"lat\" : 45.76295,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 8947,\n    \"temperature\" : 103\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:39.859Z\"\n}, {\n  \"id\" : \"5a15c8da7676a7304f573c66\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:34.884Z\",\n  \"location\" : {\n    \"lat\" : 45.76302,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 74,\n    \"revmin\" : 7635,\n    \"temperature\" : 79\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:34.887Z\"\n}, {\n  \"id\" : \"5a15c8d87676a7304f573c56\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:32.953Z\",\n  \"location\" : {\n    \"lat\" : 45.76327,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 2820,\n    \"temperature\" : -20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:32.956Z\"\n}, {\n  \"id\" : \"5a15c8d87676a7304f573c55\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:32.953Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 35,\n    \"revmin\" : 5053,\n    \"temperature\" : 76\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:32.955Z\"\n}, {\n  \"id\" : \"5a15c8cc7676a7304f573be3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:20.201Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 6290,\n    \"temperature\" : 31\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:20.202Z\"\n}, {\n  \"id\" : \"5a15c8c6c74a4951f542cbb1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:14.921Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 11,\n    \"revmin\" : 4716,\n    \"temperature\" : 70\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:14.964Z\"\n}, {\n  \"id\" : \"5a15c8c17676a7304f573b62\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:09.867Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 14,\n    \"revmin\" : 4371,\n    \"temperature\" : 4\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:09.869Z\"\n}, {\n  \"id\" : \"5a15c8bcc74a4951f542cb4c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:04.864Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 42,\n    \"revmin\" : 7168,\n    \"temperature\" : -3\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:04.865Z\"\n}, {\n  \"id\" : \"5a15c8b7c74a4951f542cb1e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:59.868Z\",\n  \"location\" : {\n    \"lat\" : 45.76502,\n    \"lon\" : 4.83813\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 6023,\n    \"temperature\" : 107\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:59.869Z\"\n}, {\n  \"id\" : \"5a15c8b4c74a4951f542caf3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:56.686Z\",\n  \"location\" : {\n    \"lat\" : 45.76542,\n    \"lon\" : 4.8381\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 23,\n    \"revmin\" : 2541,\n    \"temperature\" : 19\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:56.688Z\"\n}, {\n  \"id\" : \"5a15c8aec74a4951f542caac\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:50.855Z\",\n  \"location\" : {\n    \"lat\" : 45.76617,\n    \"lon\" : 4.83808\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 8758,\n    \"temperature\" : 9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:50.861Z\"\n}, {\n  \"id\" : \"5a15c8a8c74a4951f542ca54\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:44.864Z\",\n  \"location\" : {\n    \"lat\" : 45.76676,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 22,\n    \"revmin\" : 2670,\n    \"temperature\" : 111\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:44.865Z\"\n}, {\n  \"id\" : \"5a15c8a37676a7304f5739fc\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:39.866Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 82,\n    \"revmin\" : 2565,\n    \"temperature\" : 64\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:39.871Z\"\n}, {\n  \"id\" : \"5a15c89e7676a7304f5739c5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:34.919Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 38,\n    \"revmin\" : 4544,\n    \"temperature\" : 93\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:34.921Z\"\n}, {\n  \"id\" : \"5a15c899c74a4951f542c9a6\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:29.865Z\",\n  \"location\" : {\n    \"lat\" : 45.76765,\n    \"lon\" : 4.83705\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 96,\n    \"revmin\" : 9241,\n    \"temperature\" : 21\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:29.866Z\"\n}, {\n  \"id\" : \"5a15c895c74a4951f542c979\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:25.027Z\",\n  \"location\" : {\n    \"lat\" : 45.76759,\n    \"lon\" : 4.83661\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 58,\n    \"revmin\" : 70,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:25.042Z\"\n}, {\n  \"id\" : \"5a15c88f7676a7304f573920\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:19.852Z\",\n  \"location\" : {\n    \"lat\" : 45.76756,\n    \"lon\" : 4.83636\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 7210,\n    \"temperature\" : 62\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:19.855Z\"\n}, {\n  \"id\" : \"5a15c88ac74a4951f542c90b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:14.948Z\",\n  \"location\" : {\n    \"lat\" : 45.76754,\n    \"lon\" : 4.83627\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 4739,\n    \"temperature\" : 119\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:14.951Z\"\n}, {\n  \"id\" : \"5a15c62fc74a4951f5428eec\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:11.623Z\",\n  \"location\" : {\n    \"lat\" : 45.76751,\n    \"lon\" : 4.83617\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 39,\n    \"revmin\" : 37,\n    \"temperature\" : 29\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:11.931Z\"\n}, {\n  \"id\" : \"5a15c62a7676a7304f56fe91\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:06.619Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 17,\n    \"revmin\" : 4902,\n    \"temperature\" : -9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:06.621Z\"\n}, {\n  \"id\" : \"5a15c6267676a7304f56fe69\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:02.937Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 65,\n    \"revmin\" : 3942,\n    \"temperature\" : -10\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:02.939Z\"\n}, {\n  \"id\" : \"5a15c6207676a7304f56fe32\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:46:56.611Z\",\n  \"location\" : {\n    \"lat\" : 45.76739,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 15,\n    \"revmin\" : 8506,\n    \"temperature\" : 78\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:46:56.612Z\"\n}, {\n  \"id\" : \"5a15c61b7676a7304f56fe07\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:46:51.758Z\",\n  \"location\" : {\n    \"lat\" : 45.76734,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 41,\n    \"revmin\" : 3791,\n    \"temperature\" : 64\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:46:51.760Z\"\n}, {\n  \"id\" : \"5a15ae4c7676a7304f55ae77\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:16.895Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 5265,\n    \"temperature\" : -1\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:16.897Z\"\n}, {\n  \"id\" : \"5a15ae47c74a4951f5413e60\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:11.035Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 13,\n    \"revmin\" : 9580,\n    \"temperature\" : 66\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:11.037Z\"\n}, {\n  \"id\" : \"5a15ae427676a7304f55ae19\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:06.037Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 36,\n    \"revmin\" : 8178,\n    \"temperature\" : 117\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:06.039Z\"\n}, {\n  \"id\" : \"5a15ad80c74a4951f5413589\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:52.859Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 64,\n    \"revmin\" : 2062,\n    \"temperature\" : 28\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:52.861Z\"\n}, {\n  \"id\" : \"5a15ad7bc74a4951f541353c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:47.968Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 70,\n    \"revmin\" : 2888,\n    \"temperature\" : 40\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:47.971Z\"\n}, {\n  \"id\" : \"5a15ad5fc74a4951f541341b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:19.805Z\",\n  \"location\" : {\n    \"lat\" : 45.76502,\n    \"lon\" : 4.83813\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 8,\n    \"revmin\" : 3980,\n    \"temperature\" : 45\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:19.807Z\"\n}, {\n  \"id\" : \"5a15ad5ac74a4951f54133e3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:14.803Z\",\n  \"location\" : {\n    \"lat\" : 45.76542,\n    \"lon\" : 4.8381\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 3,\n    \"revmin\" : 4600,\n    \"temperature\" : 12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:14.805Z\"\n}, {\n  \"id\" : \"5a15ace17676a7304f559e2f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:13.734Z\",\n  \"location\" : {\n    \"lat\" : 45.76617,\n    \"lon\" : 4.83808\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 54,\n    \"revmin\" : 7774,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:13.736Z\"\n}, {\n  \"id\" : \"5a15acdcc74a4951f5412e1d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:08.719Z\",\n  \"location\" : {\n    \"lat\" : 45.76676,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 46,\n    \"revmin\" : 6661,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:08.721Z\"\n}, {\n  \"id\" : \"5a15acd7c74a4951f5412deb\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:03.941Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 73,\n    \"revmin\" : 9241,\n    \"temperature\" : -9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:03.972Z\"\n}, {\n  \"id\" : \"5a15ac9d7676a7304f559b65\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:58:05.065Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 51,\n    \"revmin\" : 1251,\n    \"temperature\" : 20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:58:05.068Z\"\n}, {\n  \"id\" : \"5a15ac98c74a4951f5412b5d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:58:00.051Z\",\n  \"location\" : {\n    \"lat\" : 45.76765,\n    \"lon\" : 4.83705\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 3665,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:58:00.053Z\"\n}, {\n  \"id\" : \"5a15ac93c74a4951f5412b32\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:57:55.144Z\",\n  \"location\" : {\n    \"lat\" : 45.76759,\n    \"lon\" : 4.83661\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 88,\n    \"revmin\" : 590,\n    \"temperature\" : 34\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:57:55.146Z\"\n}, {\n  \"id\" : \"5a15aba7c74a4951f54120e8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:59.797Z\",\n  \"location\" : {\n    \"lat\" : 45.76756,\n    \"lon\" : 4.83636\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 67,\n    \"revmin\" : 5983,\n    \"temperature\" : 57\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:59.801Z\"\n}, {\n  \"id\" : \"5a15ab7dc74a4951f5411eed\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:17.162Z\",\n  \"location\" : {\n    \"lat\" : 45.76754,\n    \"lon\" : 4.83627\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 96,\n    \"revmin\" : 2686,\n    \"temperature\" : 8\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:17.165Z\"\n}, {\n  \"id\" : \"5a15ab78c74a4951f5411eb1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:12.189Z\",\n  \"location\" : {\n    \"lat\" : 45.76751,\n    \"lon\" : 4.83617\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 19,\n    \"revmin\" : 319,\n    \"temperature\" : 83\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:12.192Z\"\n}, {\n  \"id\" : \"5a15ab747676a7304f558e65\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:08.531Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 4273,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:08.533Z\"\n}, {\n  \"id\" : \"5a15ab6ec74a4951f5411e2f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:02.138Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 78,\n    \"revmin\" : 2377,\n    \"temperature\" : 83\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:02.140Z\"\n} ]"
						}
					]
				},
				{
					"name": "Storage service - Retrieve data from a streamId with bookmark",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/android357329073120059?limit=1000&bookmarkId=5ae043cbc74a496d16df2dae",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"streams",
								"android357329073120059"
							],
							"query": [
								{
									"key": "limit",
									"value": "1000"
								},
								{
									"key": "bookmarkId",
									"value": "5ae043cbc74a496d16df2dae"
								}
							]
						},
						"description": "Retreive the next 1000 elements of the stream android357329073120059, following the id : 5ae0442fc74a496d16df30cc"
					},
					"response": [
						{
							"name": "Retrieve data from the streamId",
							"originalRequest": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/streams/android357329073120059?limit=100",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"streams",
										"android357329073120059"
									],
									"query": [
										{
											"key": "limit",
											"value": "100"
										}
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "*",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 23 Nov 2017 16:01:23 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "transfer-encoding",
									"value": "chunked",
									"name": "transfer-encoding",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-result-count",
									"value": "100",
									"name": "x-result-count",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "[ {\n  \"id\" : \"5a16a9507676a7304f6393a4\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:16.131Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 43,\n    \"revmin\" : 5216,\n    \"temperature\" : 118\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:16.133Z\"\n}, {\n  \"id\" : \"5a16a94bc74a4951f54f23c5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:11.131Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 100,\n    \"revmin\" : 8624,\n    \"temperature\" : -7\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:11.131Z\"\n}, {\n  \"id\" : \"5a16a946c74a4951f54f2391\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:06.121Z\",\n  \"location\" : {\n    \"lat\" : 45.76739,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 44,\n    \"revmin\" : 8925,\n    \"temperature\" : 61\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:06.122Z\"\n}, {\n  \"id\" : \"5a16a9417676a7304f6392f1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-23T10:56:01.113Z\",\n  \"location\" : {\n    \"lat\" : 45.76734,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 7513,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-23T10:56:01.114Z\"\n}, {\n  \"id\" : \"5a15caa7c74a4951f542e1a5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:15.411Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 3996,\n    \"temperature\" : 35\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:15.412Z\"\n}, {\n  \"id\" : \"5a15caa2c74a4951f542e17a\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:10.409Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 268,\n    \"temperature\" : -5\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:10.411Z\"\n}, {\n  \"id\" : \"5a15ca9dc74a4951f542e143\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:05.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 77,\n    \"revmin\" : 7908,\n    \"temperature\" : -17\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:05.408Z\"\n}, {\n  \"id\" : \"5a15ca987676a7304f5750f0\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:06:00.415Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 5702,\n    \"temperature\" : -18\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:06:00.418Z\"\n}, {\n  \"id\" : \"5a15ca937676a7304f5750b2\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:55.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 95,\n    \"revmin\" : 2994,\n    \"temperature\" : 114\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:55.408Z\"\n}, {\n  \"id\" : \"5a15ca8e7676a7304f575075\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:50.431Z\",\n  \"location\" : {\n    \"lat\" : 45.76327,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 98,\n    \"revmin\" : 5261,\n    \"temperature\" : 86\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:50.433Z\"\n}, {\n  \"id\" : \"5a15ca89c74a4951f542e06b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:45.433Z\",\n  \"location\" : {\n    \"lat\" : 45.76302,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 8137,\n    \"temperature\" : 20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:45.436Z\"\n}, {\n  \"id\" : \"5a15ca84c74a4951f542e03d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:40.447Z\",\n  \"location\" : {\n    \"lat\" : 45.76295,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 36,\n    \"revmin\" : 234,\n    \"temperature\" : 79\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:40.448Z\"\n}, {\n  \"id\" : \"5a15ca7fc74a4951f542e002\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:35.412Z\",\n  \"location\" : {\n    \"lat\" : 45.76287,\n    \"lon\" : 4.83818\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 3056,\n    \"temperature\" : 110\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:35.413Z\"\n}, {\n  \"id\" : \"5a15ca7a7676a7304f574faa\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:30.401Z\",\n  \"location\" : {\n    \"lat\" : 45.76266,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 61,\n    \"revmin\" : 6620,\n    \"temperature\" : 61\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:30.404Z\"\n}, {\n  \"id\" : \"5a15ca75c74a4951f542dfa2\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:25.426Z\",\n  \"location\" : {\n    \"lat\" : 45.76208,\n    \"lon\" : 4.83809\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 6842,\n    \"temperature\" : 115\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:25.427Z\"\n}, {\n  \"id\" : \"5a15ca70c74a4951f542df71\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:20.401Z\",\n  \"location\" : {\n    \"lat\" : 45.76163,\n    \"lon\" : 4.83803\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 60,\n    \"revmin\" : 2512,\n    \"temperature\" : 56\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:20.403Z\"\n}, {\n  \"id\" : \"5a15ca6bc74a4951f542df3e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:15.420Z\",\n  \"location\" : {\n    \"lat\" : 45.76153,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 5131,\n    \"temperature\" : 30\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:15.422Z\"\n}, {\n  \"id\" : \"5a15ca667676a7304f574ed8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:10.406Z\",\n  \"location\" : {\n    \"lat\" : 45.76099,\n    \"lon\" : 4.8379\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 9,\n    \"revmin\" : 5789,\n    \"temperature\" : 69\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:10.410Z\"\n}, {\n  \"id\" : \"5a15ca627676a7304f574ead\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:06.572Z\",\n  \"location\" : {\n    \"lat\" : 45.76059,\n    \"lon\" : 4.83782\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 9057,\n    \"temperature\" : -1\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:06.692Z\"\n}, {\n  \"id\" : \"5a15ca5cc74a4951f542de83\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:05:00.605Z\",\n  \"location\" : {\n    \"lat\" : 45.76038,\n    \"lon\" : 4.83779\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 4783,\n    \"temperature\" : 119\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:05:00.606Z\"\n}, {\n  \"id\" : \"5a15ca577676a7304f574e27\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:55.400Z\",\n  \"location\" : {\n    \"lat\" : 45.76017,\n    \"lon\" : 4.83776\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 31,\n    \"revmin\" : 9319,\n    \"temperature\" : 59\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:55.402Z\"\n}, {\n  \"id\" : \"5a15ca52c74a4951f542de08\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:50.437Z\",\n  \"location\" : {\n    \"lat\" : 45.76,\n    \"lon\" : 4.83773\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 53,\n    \"revmin\" : 7110,\n    \"temperature\" : 99\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:50.439Z\"\n}, {\n  \"id\" : \"5a15ca4dc74a4951f542ddd1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:45.395Z\",\n  \"location\" : {\n    \"lat\" : 45.75932,\n    \"lon\" : 4.83755\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 90,\n    \"revmin\" : 5198,\n    \"temperature\" : 14\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:45.397Z\"\n}, {\n  \"id\" : \"5a15ca487676a7304f574d89\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:40.392Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 81,\n    \"revmin\" : 3449,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:40.394Z\"\n}, {\n  \"id\" : \"5a15ca437676a7304f574d5e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:35.874Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 1321,\n    \"temperature\" : 56\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:35.878Z\"\n}, {\n  \"id\" : \"5a15ca3ec74a4951f542dd3e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:30.407Z\",\n  \"location\" : {\n    \"lat\" : 45.75886,\n    \"lon\" : 4.83731\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 89,\n    \"revmin\" : 7015,\n    \"temperature\" : 45\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:30.409Z\"\n}, {\n  \"id\" : \"5a15ca397676a7304f574ced\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:25.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75842,\n    \"lon\" : 4.8371\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 35,\n    \"revmin\" : 1841,\n    \"temperature\" : 3\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:25.412Z\"\n}, {\n  \"id\" : \"5a15ca357676a7304f574cb4\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:21.427Z\",\n  \"location\" : {\n    \"lat\" : 45.75802,\n    \"lon\" : 4.83689\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 72,\n    \"revmin\" : 1818,\n    \"temperature\" : 118\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:21.524Z\"\n}, {\n  \"id\" : \"5a15ca2f7676a7304f574c59\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:15.413Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 61,\n    \"revmin\" : 4798,\n    \"temperature\" : 5\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:15.416Z\"\n}, {\n  \"id\" : \"5a15ca2ac74a4951f542dc50\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:10.410Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 10,\n    \"revmin\" : 1658,\n    \"temperature\" : 71\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:10.432Z\"\n}, {\n  \"id\" : \"5a15ca257676a7304f574bfe\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:05.647Z\",\n  \"location\" : {\n    \"lat\" : 45.75757,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 33,\n    \"revmin\" : 9676,\n    \"temperature\" : 75\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:05.650Z\"\n}, {\n  \"id\" : \"5a15ca20c74a4951f542dbd1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:04:00.407Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 78,\n    \"revmin\" : 5241,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:04:00.409Z\"\n}, {\n  \"id\" : \"5a15ca1b7676a7304f574b87\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:55.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 801,\n    \"temperature\" : 36\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:55.412Z\"\n}, {\n  \"id\" : \"5a15ca187676a7304f574b5f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:51.854Z\",\n  \"location\" : {\n    \"lat\" : 45.75734,\n    \"lon\" : 4.83654\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 26,\n    \"revmin\" : 7684,\n    \"temperature\" : 7\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:52.364Z\"\n}, {\n  \"id\" : \"5a15ca117676a7304f574b05\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:45.412Z\",\n  \"location\" : {\n    \"lat\" : 45.75735,\n    \"lon\" : 4.83648\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 43,\n    \"revmin\" : 4928,\n    \"temperature\" : 63\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:45.414Z\"\n}, {\n  \"id\" : \"5a15ca0cc74a4951f542daef\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:40.417Z\",\n  \"location\" : {\n    \"lat\" : 45.75729,\n    \"lon\" : 4.83644\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 428,\n    \"temperature\" : -8\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:40.419Z\"\n}, {\n  \"id\" : \"5a15ca077676a7304f574a8b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:35.433Z\",\n  \"location\" : {\n    \"lat\" : 45.75726,\n    \"lon\" : 4.83655\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 11,\n    \"revmin\" : 4650,\n    \"temperature\" : 53\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:35.435Z\"\n}, {\n  \"id\" : \"5a15ca02c74a4951f542da70\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:03:30.411Z\",\n  \"location\" : {\n    \"lat\" : 45.75724,\n    \"lon\" : 4.83664\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 87,\n    \"revmin\" : 656,\n    \"temperature\" : 92\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:03:30.413Z\"\n}, {\n  \"id\" : \"5a15c9707676a7304f57433d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:01:04.260Z\",\n  \"location\" : {\n    \"lat\" : 45.75717,\n    \"lon\" : 4.83687\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 97,\n    \"revmin\" : 9356,\n    \"temperature\" : 52\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:01:04.262Z\"\n}, {\n  \"id\" : \"5a15c969c74a4951f542d307\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:57.981Z\",\n  \"location\" : {\n    \"lat\" : 45.7572,\n    \"lon\" : 4.83675\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 39,\n    \"revmin\" : 7358,\n    \"temperature\" : -11\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:57.984Z\"\n}, {\n  \"id\" : \"5a15c9657676a7304f5742c8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:53.333Z\",\n  \"location\" : {\n    \"lat\" : 45.75724,\n    \"lon\" : 4.83664\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 53,\n    \"revmin\" : 7329,\n    \"temperature\" : 72\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:53.334Z\"\n}, {\n  \"id\" : \"5a15c95fc74a4951f542d2a9\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:47.978Z\",\n  \"location\" : {\n    \"lat\" : 45.75726,\n    \"lon\" : 4.83655\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 9691,\n    \"temperature\" : 24\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:47.980Z\"\n}, {\n  \"id\" : \"5a15c95b7676a7304f574252\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:43.008Z\",\n  \"location\" : {\n    \"lat\" : 45.75729,\n    \"lon\" : 4.83644\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 38,\n    \"revmin\" : 7620,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:43.010Z\"\n}, {\n  \"id\" : \"5a15c9597676a7304f574237\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:41.051Z\",\n  \"location\" : {\n    \"lat\" : 45.75735,\n    \"lon\" : 4.83648\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 93,\n    \"revmin\" : 3036,\n    \"temperature\" : 37\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:41.054Z\"\n}, {\n  \"id\" : \"5a15c9597676a7304f574236\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:41.051Z\",\n  \"location\" : {\n    \"lat\" : 45.75734,\n    \"lon\" : 4.83654\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 41,\n    \"revmin\" : 5401,\n    \"temperature\" : 28\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:41.053Z\"\n}, {\n  \"id\" : \"5a15c94bc74a4951f542d1b9\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:27.984Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 8572,\n    \"temperature\" : 106\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:27.985Z\"\n}, {\n  \"id\" : \"5a15c947c74a4951f542d184\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:23.007Z\",\n  \"location\" : {\n    \"lat\" : 45.75733,\n    \"lon\" : 4.83659\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 97,\n    \"revmin\" : 1601,\n    \"temperature\" : 53\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:23.009Z\"\n}, {\n  \"id\" : \"5a15c943c74a4951f542d14f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:19.816Z\",\n  \"location\" : {\n    \"lat\" : 45.75757,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 93,\n    \"revmin\" : 4622,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:19.817Z\"\n}, {\n  \"id\" : \"5a15c93d7676a7304f5740dd\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:13.882Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 7918,\n    \"temperature\" : 2\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:13.885Z\"\n}, {\n  \"id\" : \"5a15c937c74a4951f542d0af\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:07.968Z\",\n  \"location\" : {\n    \"lat\" : 45.75761,\n    \"lon\" : 4.83668\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 19,\n    \"revmin\" : 3291,\n    \"temperature\" : 31\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:07.995Z\"\n}, {\n  \"id\" : \"5a15c9337676a7304f57405a\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T19:00:02.998Z\",\n  \"location\" : {\n    \"lat\" : 45.75802,\n    \"lon\" : 4.83689\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 81,\n    \"revmin\" : 7955,\n    \"temperature\" : 82\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T19:00:03.001Z\"\n}, {\n  \"id\" : \"5a15c92dc74a4951f542d030\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:57.991Z\",\n  \"location\" : {\n    \"lat\" : 45.75842,\n    \"lon\" : 4.8371\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 69,\n    \"revmin\" : 412,\n    \"temperature\" : 71\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:57.994Z\"\n}, {\n  \"id\" : \"5a15c929c74a4951f542cffb\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:53.050Z\",\n  \"location\" : {\n    \"lat\" : 45.75886,\n    \"lon\" : 4.83731\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 59,\n    \"revmin\" : 7011,\n    \"temperature\" : 24\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:53.053Z\"\n}, {\n  \"id\" : \"5a15c9247676a7304f573f99\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:47.998Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 84,\n    \"revmin\" : 8859,\n    \"temperature\" : 72\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:48Z\"\n}, {\n  \"id\" : \"5a15c91e7676a7304f573f5b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:42.981Z\",\n  \"location\" : {\n    \"lat\" : 45.75913,\n    \"lon\" : 4.83749\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 34,\n    \"revmin\" : 7456,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:42.983Z\"\n}, {\n  \"id\" : \"5a15c91a7676a7304f573f1c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:38.084Z\",\n  \"location\" : {\n    \"lat\" : 45.75932,\n    \"lon\" : 4.83755\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 56,\n    \"revmin\" : 7379,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:38.086Z\"\n}, {\n  \"id\" : \"5a15c914c74a4951f542cf11\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:32.982Z\",\n  \"location\" : {\n    \"lat\" : 45.76,\n    \"lon\" : 4.83773\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 23,\n    \"revmin\" : 2984,\n    \"temperature\" : 104\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:32.985Z\"\n}, {\n  \"id\" : \"5a15c90f7676a7304f573ebc\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:27.990Z\",\n  \"location\" : {\n    \"lat\" : 45.76017,\n    \"lon\" : 4.83776\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 27,\n    \"revmin\" : 7543,\n    \"temperature\" : 46\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:27.991Z\"\n}, {\n  \"id\" : \"5a15c90b7676a7304f573e83\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:59:23.528Z\",\n  \"location\" : {\n    \"lat\" : 45.76038,\n    \"lon\" : 4.83779\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 83,\n    \"revmin\" : 9756,\n    \"temperature\" : 104\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:59:23.530Z\"\n}, {\n  \"id\" : \"5a15c8df7676a7304f573c94\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:39.858Z\",\n  \"location\" : {\n    \"lat\" : 45.76295,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 79,\n    \"revmin\" : 8947,\n    \"temperature\" : 103\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:39.859Z\"\n}, {\n  \"id\" : \"5a15c8da7676a7304f573c66\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:34.884Z\",\n  \"location\" : {\n    \"lat\" : 45.76302,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 74,\n    \"revmin\" : 7635,\n    \"temperature\" : 79\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:34.887Z\"\n}, {\n  \"id\" : \"5a15c8d87676a7304f573c56\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:32.953Z\",\n  \"location\" : {\n    \"lat\" : 45.76327,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 2820,\n    \"temperature\" : -20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:32.956Z\"\n}, {\n  \"id\" : \"5a15c8d87676a7304f573c55\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:32.953Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 35,\n    \"revmin\" : 5053,\n    \"temperature\" : 76\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:32.955Z\"\n}, {\n  \"id\" : \"5a15c8cc7676a7304f573be3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:20.201Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 6290,\n    \"temperature\" : 31\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:20.202Z\"\n}, {\n  \"id\" : \"5a15c8c6c74a4951f542cbb1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:14.921Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 11,\n    \"revmin\" : 4716,\n    \"temperature\" : 70\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:14.964Z\"\n}, {\n  \"id\" : \"5a15c8c17676a7304f573b62\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:09.867Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 14,\n    \"revmin\" : 4371,\n    \"temperature\" : 4\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:09.869Z\"\n}, {\n  \"id\" : \"5a15c8bcc74a4951f542cb4c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:58:04.864Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 42,\n    \"revmin\" : 7168,\n    \"temperature\" : -3\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:58:04.865Z\"\n}, {\n  \"id\" : \"5a15c8b7c74a4951f542cb1e\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:59.868Z\",\n  \"location\" : {\n    \"lat\" : 45.76502,\n    \"lon\" : 4.83813\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 30,\n    \"revmin\" : 6023,\n    \"temperature\" : 107\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:59.869Z\"\n}, {\n  \"id\" : \"5a15c8b4c74a4951f542caf3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:56.686Z\",\n  \"location\" : {\n    \"lat\" : 45.76542,\n    \"lon\" : 4.8381\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 23,\n    \"revmin\" : 2541,\n    \"temperature\" : 19\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:56.688Z\"\n}, {\n  \"id\" : \"5a15c8aec74a4951f542caac\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:50.855Z\",\n  \"location\" : {\n    \"lat\" : 45.76617,\n    \"lon\" : 4.83808\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 86,\n    \"revmin\" : 8758,\n    \"temperature\" : 9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:50.861Z\"\n}, {\n  \"id\" : \"5a15c8a8c74a4951f542ca54\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:44.864Z\",\n  \"location\" : {\n    \"lat\" : 45.76676,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 22,\n    \"revmin\" : 2670,\n    \"temperature\" : 111\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:44.865Z\"\n}, {\n  \"id\" : \"5a15c8a37676a7304f5739fc\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:39.866Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 82,\n    \"revmin\" : 2565,\n    \"temperature\" : 64\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:39.871Z\"\n}, {\n  \"id\" : \"5a15c89e7676a7304f5739c5\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:34.919Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 38,\n    \"revmin\" : 4544,\n    \"temperature\" : 93\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:34.921Z\"\n}, {\n  \"id\" : \"5a15c899c74a4951f542c9a6\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:29.865Z\",\n  \"location\" : {\n    \"lat\" : 45.76765,\n    \"lon\" : 4.83705\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 96,\n    \"revmin\" : 9241,\n    \"temperature\" : 21\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:29.866Z\"\n}, {\n  \"id\" : \"5a15c895c74a4951f542c979\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:25.027Z\",\n  \"location\" : {\n    \"lat\" : 45.76759,\n    \"lon\" : 4.83661\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 58,\n    \"revmin\" : 70,\n    \"temperature\" : 73\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:25.042Z\"\n}, {\n  \"id\" : \"5a15c88f7676a7304f573920\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:19.852Z\",\n  \"location\" : {\n    \"lat\" : 45.76756,\n    \"lon\" : 4.83636\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 7210,\n    \"temperature\" : 62\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:19.855Z\"\n}, {\n  \"id\" : \"5a15c88ac74a4951f542c90b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:57:14.948Z\",\n  \"location\" : {\n    \"lat\" : 45.76754,\n    \"lon\" : 4.83627\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 63,\n    \"revmin\" : 4739,\n    \"temperature\" : 119\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:57:14.951Z\"\n}, {\n  \"id\" : \"5a15c62fc74a4951f5428eec\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:11.623Z\",\n  \"location\" : {\n    \"lat\" : 45.76751,\n    \"lon\" : 4.83617\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 39,\n    \"revmin\" : 37,\n    \"temperature\" : 29\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:11.931Z\"\n}, {\n  \"id\" : \"5a15c62a7676a7304f56fe91\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:06.619Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 17,\n    \"revmin\" : 4902,\n    \"temperature\" : -9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:06.621Z\"\n}, {\n  \"id\" : \"5a15c6267676a7304f56fe69\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:47:02.937Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 65,\n    \"revmin\" : 3942,\n    \"temperature\" : -10\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:47:02.939Z\"\n}, {\n  \"id\" : \"5a15c6207676a7304f56fe32\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:46:56.611Z\",\n  \"location\" : {\n    \"lat\" : 45.76739,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 15,\n    \"revmin\" : 8506,\n    \"temperature\" : 78\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:46:56.612Z\"\n}, {\n  \"id\" : \"5a15c61b7676a7304f56fe07\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T18:46:51.758Z\",\n  \"location\" : {\n    \"lat\" : 45.76734,\n    \"lon\" : 4.83605\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 41,\n    \"revmin\" : 3791,\n    \"temperature\" : 64\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T18:46:51.760Z\"\n}, {\n  \"id\" : \"5a15ae4c7676a7304f55ae77\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:16.895Z\",\n  \"location\" : {\n    \"lat\" : 45.76349,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 76,\n    \"revmin\" : 5265,\n    \"temperature\" : -1\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:16.897Z\"\n}, {\n  \"id\" : \"5a15ae47c74a4951f5413e60\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:11.035Z\",\n  \"location\" : {\n    \"lat\" : 45.76356,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 13,\n    \"revmin\" : 9580,\n    \"temperature\" : 66\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:11.037Z\"\n}, {\n  \"id\" : \"5a15ae427676a7304f55ae19\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:05:06.037Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 36,\n    \"revmin\" : 8178,\n    \"temperature\" : 117\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:05:06.039Z\"\n}, {\n  \"id\" : \"5a15ad80c74a4951f5413589\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:52.859Z\",\n  \"location\" : {\n    \"lat\" : 45.76362,\n    \"lon\" : 4.83816\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 64,\n    \"revmin\" : 2062,\n    \"temperature\" : 28\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:52.861Z\"\n}, {\n  \"id\" : \"5a15ad7bc74a4951f541353c\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:47.968Z\",\n  \"location\" : {\n    \"lat\" : 45.7642,\n    \"lon\" : 4.83817\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 70,\n    \"revmin\" : 2888,\n    \"temperature\" : 40\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:47.971Z\"\n}, {\n  \"id\" : \"5a15ad5fc74a4951f541341b\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:19.805Z\",\n  \"location\" : {\n    \"lat\" : 45.76502,\n    \"lon\" : 4.83813\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 8,\n    \"revmin\" : 3980,\n    \"temperature\" : 45\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:19.807Z\"\n}, {\n  \"id\" : \"5a15ad5ac74a4951f54133e3\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T17:01:14.803Z\",\n  \"location\" : {\n    \"lat\" : 45.76542,\n    \"lon\" : 4.8381\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 3,\n    \"revmin\" : 4600,\n    \"temperature\" : 12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T17:01:14.805Z\"\n}, {\n  \"id\" : \"5a15ace17676a7304f559e2f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:13.734Z\",\n  \"location\" : {\n    \"lat\" : 45.76617,\n    \"lon\" : 4.83808\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 54,\n    \"revmin\" : 7774,\n    \"temperature\" : 108\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:13.736Z\"\n}, {\n  \"id\" : \"5a15acdcc74a4951f5412e1d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:08.719Z\",\n  \"location\" : {\n    \"lat\" : 45.76676,\n    \"lon\" : 4.83801\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 46,\n    \"revmin\" : 6661,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:08.721Z\"\n}, {\n  \"id\" : \"5a15acd7c74a4951f5412deb\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:59:03.941Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 73,\n    \"revmin\" : 9241,\n    \"temperature\" : -9\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:59:03.972Z\"\n}, {\n  \"id\" : \"5a15ac9d7676a7304f559b65\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:58:05.065Z\",\n  \"location\" : {\n    \"lat\" : 45.76777,\n    \"lon\" : 4.83791\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 51,\n    \"revmin\" : 1251,\n    \"temperature\" : 20\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:58:05.068Z\"\n}, {\n  \"id\" : \"5a15ac98c74a4951f5412b5d\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:58:00.051Z\",\n  \"location\" : {\n    \"lat\" : 45.76765,\n    \"lon\" : 4.83705\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 49,\n    \"revmin\" : 3665,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:58:00.053Z\"\n}, {\n  \"id\" : \"5a15ac93c74a4951f5412b32\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:57:55.144Z\",\n  \"location\" : {\n    \"lat\" : 45.76759,\n    \"lon\" : 4.83661\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 88,\n    \"revmin\" : 590,\n    \"temperature\" : 34\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:57:55.146Z\"\n}, {\n  \"id\" : \"5a15aba7c74a4951f54120e8\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:59.797Z\",\n  \"location\" : {\n    \"lat\" : 45.76756,\n    \"lon\" : 4.83636\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 67,\n    \"revmin\" : 5983,\n    \"temperature\" : 57\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:59.801Z\"\n}, {\n  \"id\" : \"5a15ab7dc74a4951f5411eed\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:17.162Z\",\n  \"location\" : {\n    \"lat\" : 45.76754,\n    \"lon\" : 4.83627\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 96,\n    \"revmin\" : 2686,\n    \"temperature\" : 8\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:17.165Z\"\n}, {\n  \"id\" : \"5a15ab78c74a4951f5411eb1\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:12.189Z\",\n  \"location\" : {\n    \"lat\" : 45.76751,\n    \"lon\" : 4.83617\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 19,\n    \"revmin\" : 319,\n    \"temperature\" : 83\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:12.192Z\"\n}, {\n  \"id\" : \"5a15ab747676a7304f558e65\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:08.531Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 25,\n    \"revmin\" : 4273,\n    \"temperature\" : -12\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:08.533Z\"\n}, {\n  \"id\" : \"5a15ab6ec74a4951f5411e2f\",\n  \"streamId\" : \"android357329073120059\",\n  \"timestamp\" : \"2017-11-22T16:53:02.138Z\",\n  \"location\" : {\n    \"lat\" : 45.76748,\n    \"lon\" : 4.83604\n  },\n  \"model\" : \"demo\",\n  \"value\" : {\n    \"hygrometry\" : 78,\n    \"revmin\" : 2377,\n    \"temperature\" : 83\n  },\n  \"metadata\" : {\n    \"source\" : \"urn:lo:nsid:android:357329073120059\",\n    \"connector\" : \"mqtt\"\n  },\n  \"created\" : \"2017-11-22T16:53:02.140Z\"\n} ]"
						}
					]
				},
				{
					"name": "Search service - simple request, ordered, stats",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n\t\"size\" : 100, \r\n\t\"query\" : { \r\n\t\t\"bool\":{\r\n\t\t\t\"filter\": [\r\n\t\t\t\t{\r\n\t\t\t\t\t\"term\" : { \"streamId\": \"android357329073120059\" }\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@demo.value.temperature\" :{\r\n\t\t\t\t\t\t\t\"gte\" : 100\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t   }\r\n\t},\r\n\t\"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n\t\"aggs\" :{\r\n\t        \"stats_temperature\" : { \"stats\" : { \"field\" : \"@demo.value.temperature\" } },\r\n\t        \"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@demo.value.hygrometry\" } },\r\n\t        \"stats_speed\" : { \"stats\" : { \"field\" : \"@demo.value.revmin\" } }\r\n\t}\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": "Get the last 100 records where temperature > 100\n- Stream : android357329073120059\n- Model : \"demo\"\n- Ordered by timestamp\n- stats at the bottom of the result\n\n<br>\nExemple of the data values :<br>\n\"value\": {<br>\n  \"revmin\": 2584,<br>\n  \"temperature\": 35,<br>\n  \"hygrometry\": 46<br>\n}"
					},
					"response": [
						{
							"name": "OAB App - fra.lelong - Temp > 100 ordered",
							"originalRequest": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									},
									{
										"key": "Content-Type",
										"value": "application/json",
										"warning": ""
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"size\" : 100, \r\n \"query\" : { \r\n   \"and\":\r\n   [\r\n    {\r\n      \"term\" : { \"streamId\": \"android357329073120059\" }\r\n    },\r\n    {\r\n       \"range\" : {\r\n         \"@demo.value.temperature\" :{\r\n           \"gte\" : 100\r\n         }\r\n       }\r\n     }\r\n   ]\r\n },\r\n \"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n \r\n    \"aggs\" :\r\n    {\r\n        \"stats_temperature\" : { \"stats\" : { \"field\" : \"@demo.value.temperature\" } },\r\n        \"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@demo.value.hygrometry\" } },\r\n        \"stats_speed\" : { \"stats\" : { \"field\" : \"@demo.value.revmin\" } }\r\n     }\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"search"
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-length",
									"value": "41003",
									"name": "content-length",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 23 Nov 2017 16:01:46 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "{\"took\":86,\"hits\":{\"total\":814,\"hits\":[{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-23T10:56:16.133Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a16a9507676a7304f6393a4\",\"value\":{\"revmin\":5216,\"temperature\":118,\"hygrometry\":43},\"timestamp\":\"2017-11-23T10:56:16.131Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:05:55.408Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76349},\"model\":\"demo\",\"id\":\"5a15ca937676a7304f5750b2\",\"value\":{\"revmin\":2994,\"temperature\":114,\"hygrometry\":95},\"timestamp\":\"2017-11-22T19:05:55.406Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:05:35.413Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83818,\"lat\":45.76287},\"model\":\"demo\",\"id\":\"5a15ca7fc74a4951f542e002\",\"value\":{\"revmin\":3056,\"temperature\":110,\"hygrometry\":79},\"timestamp\":\"2017-11-22T19:05:35.412Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:05:25.427Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83809,\"lat\":45.76208},\"model\":\"demo\",\"id\":\"5a15ca75c74a4951f542dfa2\",\"value\":{\"revmin\":6842,\"temperature\":115,\"hygrometry\":25},\"timestamp\":\"2017-11-22T19:05:25.426Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:05:00.606Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"5a15ca5cc74a4951f542de83\",\"value\":{\"revmin\":4783,\"temperature\":119,\"hygrometry\":63},\"timestamp\":\"2017-11-22T19:05:00.605Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:04:21.524Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83689,\"lat\":45.75802},\"model\":\"demo\",\"id\":\"5a15ca357676a7304f574cb4\",\"value\":{\"revmin\":1818,\"temperature\":118,\"hygrometry\":72},\"timestamp\":\"2017-11-22T19:04:21.427Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:04:00.409Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83659,\"lat\":45.75733},\"model\":\"demo\",\"id\":\"5a15ca20c74a4951f542dbd1\",\"value\":{\"revmin\":5241,\"temperature\":108,\"hygrometry\":78},\"timestamp\":\"2017-11-22T19:04:00.407Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:00:27.985Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83659,\"lat\":45.75733},\"model\":\"demo\",\"id\":\"5a15c94bc74a4951f542d1b9\",\"value\":{\"revmin\":8572,\"temperature\":106,\"hygrometry\":30},\"timestamp\":\"2017-11-22T19:00:27.984Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:59:38.086Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83755,\"lat\":45.75932},\"model\":\"demo\",\"id\":\"5a15c91a7676a7304f573f1c\",\"value\":{\"revmin\":7379,\"temperature\":108,\"hygrometry\":56},\"timestamp\":\"2017-11-22T18:59:38.084Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:59:32.985Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83773,\"lat\":45.76},\"model\":\"demo\",\"id\":\"5a15c914c74a4951f542cf11\",\"value\":{\"revmin\":2984,\"temperature\":104,\"hygrometry\":23},\"timestamp\":\"2017-11-22T18:59:32.982Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:59:23.530Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"5a15c90b7676a7304f573e83\",\"value\":{\"revmin\":9756,\"temperature\":104,\"hygrometry\":83},\"timestamp\":\"2017-11-22T18:59:23.528Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:58:39.859Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76295},\"model\":\"demo\",\"id\":\"5a15c8df7676a7304f573c94\",\"value\":{\"revmin\":8947,\"temperature\":103,\"hygrometry\":79},\"timestamp\":\"2017-11-22T18:58:39.858Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:57:59.869Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83813,\"lat\":45.76502},\"model\":\"demo\",\"id\":\"5a15c8b7c74a4951f542cb1e\",\"value\":{\"revmin\":6023,\"temperature\":107,\"hygrometry\":30},\"timestamp\":\"2017-11-22T18:57:59.868Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:57:44.865Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"5a15c8a8c74a4951f542ca54\",\"value\":{\"revmin\":2670,\"temperature\":111,\"hygrometry\":22},\"timestamp\":\"2017-11-22T18:57:44.864Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:57:14.951Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83627,\"lat\":45.76754},\"model\":\"demo\",\"id\":\"5a15c88ac74a4951f542c90b\",\"value\":{\"revmin\":4739,\"temperature\":119,\"hygrometry\":63},\"timestamp\":\"2017-11-22T18:57:14.948Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T17:05:06.039Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a15ae427676a7304f55ae19\",\"value\":{\"revmin\":8178,\"temperature\":117,\"hygrometry\":36},\"timestamp\":\"2017-11-22T17:05:06.037Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T16:59:13.736Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a15ace17676a7304f559e2f\",\"value\":{\"revmin\":7774,\"temperature\":108,\"hygrometry\":54},\"timestamp\":\"2017-11-22T16:59:13.734Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:29:31.636Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"5a1589cbc74a4951f53f0402\",\"value\":{\"revmin\":4731,\"temperature\":108,\"hygrometry\":51},\"timestamp\":\"2017-11-22T14:29:31.634Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:29:06.943Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75761},\"model\":\"demo\",\"id\":\"5a1589b2c74a4951f53f030c\",\"value\":{\"revmin\":9627,\"temperature\":117,\"hygrometry\":65},\"timestamp\":\"2017-11-22T14:29:06.640Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:28:53.711Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83755,\"lat\":45.75932},\"model\":\"demo\",\"id\":\"5a1589a5c74a4951f53f0282\",\"value\":{\"revmin\":1532,\"temperature\":116,\"hygrometry\":98},\"timestamp\":\"2017-11-22T14:28:53.704Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:26:45.316Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"5a158925c74a4951f53ef98e\",\"value\":{\"revmin\":6710,\"temperature\":109,\"hygrometry\":92},\"timestamp\":\"2017-11-22T14:26:45.315Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:26:25.008Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83661,\"lat\":45.76759},\"model\":\"demo\",\"id\":\"5a1589117676a7304f53687c\",\"value\":{\"revmin\":2665,\"temperature\":112,\"hygrometry\":26},\"timestamp\":\"2017-11-22T14:26:25.005Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:55.800Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83675,\"lat\":45.7572},\"model\":\"demo\",\"id\":\"5a1549ab7676a7304f4dec71\",\"value\":{\"revmin\":7210,\"temperature\":116,\"hygrometry\":70},\"timestamp\":\"2017-11-22T07:56:58.789Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:55.756Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83687,\"lat\":45.75717},\"model\":\"demo\",\"id\":\"5a1549ab7676a7304f4dec26\",\"value\":{\"revmin\":5282,\"temperature\":112,\"hygrometry\":0},\"timestamp\":\"2017-11-22T07:56:53.786Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:55.873Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84271,\"lat\":45.75533},\"model\":\"demo\",\"id\":\"5a1549abc74a4951f5384ed7\",\"value\":{\"revmin\":3875,\"temperature\":116,\"hygrometry\":14},\"timestamp\":\"2017-11-22T07:55:26.537Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.956Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83814,\"lat\":45.75679},\"model\":\"demo\",\"id\":\"5a1549a6c74a4951f5383ac2\",\"value\":{\"revmin\":3987,\"temperature\":103,\"hygrometry\":73},\"timestamp\":\"2017-11-22T07:54:31.256Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.756Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83687,\"lat\":45.75717},\"model\":\"demo\",\"id\":\"5a1549a67676a7304f4de89b\",\"value\":{\"revmin\":3022,\"temperature\":118,\"hygrometry\":62},\"timestamp\":\"2017-11-22T07:53:52.579Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.326Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83675,\"lat\":45.7572},\"model\":\"demo\",\"id\":\"5a1549a6c74a4951f538378b\",\"value\":{\"revmin\":4740,\"temperature\":118,\"hygrometry\":77},\"timestamp\":\"2017-11-22T07:53:47.574Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.052Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83644,\"lat\":45.75729},\"model\":\"demo\",\"id\":\"5a1549a6c74a4951f5383571\",\"value\":{\"revmin\":236,\"temperature\":100,\"hygrometry\":46},\"timestamp\":\"2017-11-22T07:53:31.558Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:49.051Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83731,\"lat\":45.75886},\"model\":\"demo\",\"id\":\"5a1549a57676a7304f4de6aa\",\"value\":{\"revmin\":6167,\"temperature\":118,\"hygrometry\":82},\"timestamp\":\"2017-11-22T07:52:41.319Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:48.266Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76295},\"model\":\"demo\",\"id\":\"5a1549a47676a7304f4de1cc\",\"value\":{\"revmin\":1529,\"temperature\":115,\"hygrometry\":88},\"timestamp\":\"2017-11-22T07:51:43.086Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:48.236Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76302},\"model\":\"demo\",\"id\":\"5a1549a47676a7304f4de196\",\"value\":{\"revmin\":115,\"temperature\":108,\"hygrometry\":15},\"timestamp\":\"2017-11-22T07:51:39.086Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:48.110Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76349},\"model\":\"demo\",\"id\":\"5a1549a47676a7304f4de0b6\",\"value\":{\"revmin\":2182,\"temperature\":104,\"hygrometry\":96},\"timestamp\":\"2017-11-22T07:51:31.079Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:47.718Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8381,\"lat\":45.76542},\"model\":\"demo\",\"id\":\"5a1549a37676a7304f4ddeca\",\"value\":{\"revmin\":5417,\"temperature\":107,\"hygrometry\":20},\"timestamp\":\"2017-11-22T07:51:07.090Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:32:13.815Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83659,\"lat\":45.75733},\"model\":\"demo\",\"id\":\"5a0c6c0d7676a72c91b77a7a\",\"value\":{\"revmin\":5504,\"temperature\":112,\"hygrometry\":2},\"timestamp\":\"2017-11-15T16:32:13.576Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:29:10.440Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a0c6b567676a72c91b772fe\",\"value\":{\"revmin\":5754,\"temperature\":108,\"hygrometry\":52},\"timestamp\":\"2017-11-15T16:29:10.443Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:14:25.476Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76327},\"model\":\"demo\",\"id\":\"5a0c67e1c74a4951f5bc34ff\",\"value\":{\"revmin\":1779,\"temperature\":118,\"hygrometry\":52},\"timestamp\":\"2017-11-15T16:14:25.476Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:14:01.519Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83803,\"lat\":45.76163},\"model\":\"demo\",\"id\":\"5a0c67c9c74a4951f5bc3410\",\"value\":{\"revmin\":7921,\"temperature\":119,\"hygrometry\":92},\"timestamp\":\"2017-11-15T16:14:01.517Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:14:01.519Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76153},\"model\":\"demo\",\"id\":\"5a0c67c9c74a4951f5bc3411\",\"value\":{\"revmin\":1279,\"temperature\":112,\"hygrometry\":30},\"timestamp\":\"2017-11-15T16:14:01.517Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:13:45.505Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"5a0c67b9c74a4951f5bc336e\",\"value\":{\"revmin\":4809,\"temperature\":116,\"hygrometry\":39},\"timestamp\":\"2017-11-15T16:13:45.506Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:10:36.980Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83664,\"lat\":45.75724},\"model\":\"demo\",\"id\":\"5a0c66fcc74a4951f5bc2bea\",\"value\":{\"revmin\":5346,\"temperature\":118,\"hygrometry\":46},\"timestamp\":\"2017-11-15T16:10:36.980Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:07:28.854Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a0c66407676a72c91b72f8a\",\"value\":{\"revmin\":1955,\"temperature\":112,\"hygrometry\":23},\"timestamp\":\"2017-11-15T16:07:28.723Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:07:18.688Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a0c6636c74a4951f5bc243c\",\"value\":{\"revmin\":1872,\"temperature\":110,\"hygrometry\":27},\"timestamp\":\"2017-11-15T16:07:18.687Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:26:24.926Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83813,\"lat\":45.76502},\"model\":\"demo\",\"id\":\"5a0c4e90c74a4951f5bab326\",\"value\":{\"revmin\":3594,\"temperature\":115,\"hygrometry\":6},\"timestamp\":\"2017-11-15T14:26:24.924Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:26:14.949Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8381,\"lat\":45.76542},\"model\":\"demo\",\"id\":\"5a0c4e867676a72c91b5bdb9\",\"value\":{\"revmin\":1129,\"temperature\":117,\"hygrometry\":59},\"timestamp\":\"2017-11-15T14:26:14.946Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:24:54.933Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83627,\"lat\":45.76754},\"model\":\"demo\",\"id\":\"5a0c4e36c74a4951f5baadd5\",\"value\":{\"revmin\":991,\"temperature\":111,\"hygrometry\":50},\"timestamp\":\"2017-11-15T14:24:54.930Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T10:44:51.358Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83689,\"lat\":45.75802},\"model\":\"demo\",\"id\":\"5a0c1aa37676a72c91b33044\",\"value\":{\"revmin\":4479,\"temperature\":101,\"hygrometry\":15},\"timestamp\":\"2017-11-15T10:44:51.357Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:37:36.696Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84029,\"lat\":45.75616},\"model\":\"demo\",\"id\":\"5a0170d0c74a4951f54afe0c\",\"value\":{\"revmin\":9944,\"temperature\":113,\"hygrometry\":82},\"timestamp\":\"2017-11-07T08:37:36.694Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:37:06.697Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83884,\"lat\":45.75659},\"model\":\"demo\",\"id\":\"5a0170b27676a72c914607c7\",\"value\":{\"revmin\":612,\"temperature\":117,\"hygrometry\":35},\"timestamp\":\"2017-11-07T08:37:06.695Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:35:56.702Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83644,\"lat\":45.75729},\"model\":\"demo\",\"id\":\"5a01706c7676a72c9146053a\",\"value\":{\"revmin\":2410,\"temperature\":119,\"hygrometry\":61},\"timestamp\":\"2017-11-07T08:35:56.694Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:35:46.720Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83648,\"lat\":45.75735},\"model\":\"demo\",\"id\":\"5a017062c74a4951f54afa1a\",\"value\":{\"revmin\":7201,\"temperature\":110,\"hygrometry\":22},\"timestamp\":\"2017-11-07T08:35:46.718Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:34:36.695Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83689,\"lat\":45.75802},\"model\":\"demo\",\"id\":\"5a01701c7676a72c91460289\",\"value\":{\"revmin\":8490,\"temperature\":107,\"hygrometry\":58},\"timestamp\":\"2017-11-07T08:34:36.694Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:34:16.700Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83731,\"lat\":45.75886},\"model\":\"demo\",\"id\":\"5a017008c74a4951f54af738\",\"value\":{\"revmin\":3056,\"temperature\":111,\"hygrometry\":5},\"timestamp\":\"2017-11-07T08:34:16.698Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:32:26.721Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83809,\"lat\":45.76208},\"model\":\"demo\",\"id\":\"5a016f9ac74a4951f54af34f\",\"value\":{\"revmin\":1039,\"temperature\":108,\"hygrometry\":65},\"timestamp\":\"2017-11-07T08:32:26.719Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:31:06.693Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a016f4ac74a4951f54af0b0\",\"value\":{\"revmin\":9920,\"temperature\":109,\"hygrometry\":90},\"timestamp\":\"2017-11-07T08:31:06.691Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:30:26.700Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8381,\"lat\":45.76542},\"model\":\"demo\",\"id\":\"5a016f22c74a4951f54aef19\",\"value\":{\"revmin\":6964,\"temperature\":112,\"hygrometry\":66},\"timestamp\":\"2017-11-07T08:30:26.699Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:38:54.072Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a00ac3e7676a72c913efa5b\",\"value\":{\"revmin\":9378,\"temperature\":109,\"hygrometry\":23},\"timestamp\":\"2017-11-06T18:38:54.071Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:37:44.070Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76266},\"model\":\"demo\",\"id\":\"5a00abf8c74a4951f543ed57\",\"value\":{\"revmin\":3989,\"temperature\":116,\"hygrometry\":54},\"timestamp\":\"2017-11-06T18:37:44.069Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:37:34.097Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83809,\"lat\":45.76208},\"model\":\"demo\",\"id\":\"5a00abeec74a4951f543ed0b\",\"value\":{\"revmin\":4537,\"temperature\":107,\"hygrometry\":3},\"timestamp\":\"2017-11-06T18:37:34.094Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:37:04.090Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8379,\"lat\":45.76099},\"model\":\"demo\",\"id\":\"5a00abd07676a72c913ef6c7\",\"value\":{\"revmin\":4403,\"temperature\":112,\"hygrometry\":70},\"timestamp\":\"2017-11-06T18:37:04.088Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:34:43.938Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83659,\"lat\":45.75733},\"model\":\"demo\",\"id\":\"5a00ab43c74a4951f543e718\",\"value\":{\"revmin\":388,\"temperature\":107,\"hygrometry\":24},\"timestamp\":\"2017-11-06T18:34:43.937Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:28:57.502Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84029,\"lat\":45.75616},\"model\":\"demo\",\"id\":\"5a00a9e97676a72c913ee4a7\",\"value\":{\"revmin\":9796,\"temperature\":111,\"hygrometry\":82},\"timestamp\":\"2017-11-06T18:28:57.501Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:28:28.350Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84271,\"lat\":45.75533},\"model\":\"demo\",\"id\":\"5a00a9ccc74a4951f543d8d0\",\"value\":{\"revmin\":1354,\"temperature\":117,\"hygrometry\":23},\"timestamp\":\"2017-11-06T18:28:28.349Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:28:18.335Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84178,\"lat\":45.75567},\"model\":\"demo\",\"id\":\"5a00a9c2c74a4951f543d87f\",\"value\":{\"revmin\":1087,\"temperature\":109,\"hygrometry\":1},\"timestamp\":\"2017-11-06T18:28:18.334Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:28:13.326Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84094,\"lat\":45.75595},\"model\":\"demo\",\"id\":\"5a00a9bd7676a72c913ee311\",\"value\":{\"revmin\":3489,\"temperature\":109,\"hygrometry\":76},\"timestamp\":\"2017-11-06T18:28:13.324Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:27:53.361Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84029,\"lat\":45.75616},\"model\":\"demo\",\"id\":\"5a00a9a97676a72c913ee241\",\"value\":{\"revmin\":9441,\"temperature\":103,\"hygrometry\":79},\"timestamp\":\"2017-11-06T18:27:53.360Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:27:28.361Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83715,\"lat\":45.7571},\"model\":\"demo\",\"id\":\"5a00a9907676a72c913ee17c\",\"value\":{\"revmin\":7835,\"temperature\":109,\"hygrometry\":97},\"timestamp\":\"2017-11-06T18:27:28.360Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:26:53.340Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"5a00a96dc74a4951f543d584\",\"value\":{\"revmin\":6234,\"temperature\":108,\"hygrometry\":65},\"timestamp\":\"2017-11-06T18:26:53.339Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:26:33.360Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75761},\"model\":\"demo\",\"id\":\"5a00a9597676a72c913edfc5\",\"value\":{\"revmin\":6582,\"temperature\":111,\"hygrometry\":40},\"timestamp\":\"2017-11-06T18:26:33.359Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:25:58.342Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83755,\"lat\":45.75932},\"model\":\"demo\",\"id\":\"5a00a936c74a4951f543d3c0\",\"value\":{\"revmin\":9791,\"temperature\":118,\"hygrometry\":43},\"timestamp\":\"2017-11-06T18:25:58.333Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:25:38.361Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83782,\"lat\":45.76059},\"model\":\"demo\",\"id\":\"5a00a922c74a4951f543d30b\",\"value\":{\"revmin\":5191,\"temperature\":103,\"hygrometry\":59},\"timestamp\":\"2017-11-06T18:25:38.361Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:24:33.343Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a00a8e17676a72c913edb6e\",\"value\":{\"revmin\":5897,\"temperature\":113,\"hygrometry\":50},\"timestamp\":\"2017-11-06T18:24:33.342Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:13:17.997Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a00a63dc74a4951f543b7be\",\"value\":{\"revmin\":5104,\"temperature\":120,\"hygrometry\":58},\"timestamp\":\"2017-11-06T18:13:17.996Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T16:17:16.028Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"59fc968c7676a72c91197a7a\",\"value\":{\"revmin\":3085,\"temperature\":112,\"hygrometry\":82},\"timestamp\":\"2017-11-03T16:17:16.027Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T16:16:31.016Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83605,\"lat\":45.76734},\"model\":\"demo\",\"id\":\"59fc965f7676a72c911976f8\",\"value\":{\"revmin\":6213,\"temperature\":116,\"hygrometry\":46},\"timestamp\":\"2017-11-03T16:16:31.014Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:12:26.580Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"59fc875ac74a4951f51ddd82\",\"value\":{\"revmin\":2605,\"temperature\":115,\"hygrometry\":77},\"timestamp\":\"2017-11-03T15:12:26.576Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:10:53.873Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83818,\"lat\":45.76287},\"model\":\"demo\",\"id\":\"59fc86fd7676a72c9118e4a9\",\"value\":{\"revmin\":6032,\"temperature\":112,\"hygrometry\":76},\"timestamp\":\"2017-11-03T15:10:53.870Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:10:17.642Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"59fc86d9c74a4951f51dd87a\",\"value\":{\"revmin\":1478,\"temperature\":106,\"hygrometry\":21},\"timestamp\":\"2017-11-03T15:10:17.640Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:09:41.599Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8371,\"lat\":45.75842},\"model\":\"demo\",\"id\":\"59fc86b57676a72c9118e240\",\"value\":{\"revmin\":3422,\"temperature\":107,\"hygrometry\":16},\"timestamp\":\"2017-11-03T15:09:41.597Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:08:35.345Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83655,\"lat\":45.75726},\"model\":\"demo\",\"id\":\"59fc86737676a72c9118dfb6\",\"value\":{\"revmin\":2879,\"temperature\":120,\"hygrometry\":48},\"timestamp\":\"2017-11-03T15:08:35.343Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:08:01.230Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83884,\"lat\":45.75659},\"model\":\"demo\",\"id\":\"59fc8651c74a4951f51dd3b7\",\"value\":{\"revmin\":832,\"temperature\":120,\"hygrometry\":13},\"timestamp\":\"2017-11-03T15:08:01.227Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:07:51.220Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83955,\"lat\":45.75638},\"model\":\"demo\",\"id\":\"59fc8647c74a4951f51dd361\",\"value\":{\"revmin\":3509,\"temperature\":103,\"hygrometry\":15},\"timestamp\":\"2017-11-03T15:07:51.218Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:07:41.286Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84083,\"lat\":45.75599},\"model\":\"demo\",\"id\":\"59fc863d7676a72c9118ddd7\",\"value\":{\"revmin\":1145,\"temperature\":114,\"hygrometry\":96},\"timestamp\":\"2017-11-03T15:07:41.283Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:06:56.229Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84088,\"lat\":45.75597},\"model\":\"demo\",\"id\":\"59fc8610c74a4951f51dd167\",\"value\":{\"revmin\":583,\"temperature\":113,\"hygrometry\":2},\"timestamp\":\"2017-11-03T15:06:56.227Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:06:31.213Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83941,\"lat\":45.75642},\"model\":\"demo\",\"id\":\"59fc85f7c74a4951f51dd090\",\"value\":{\"revmin\":1174,\"temperature\":105,\"hygrometry\":24},\"timestamp\":\"2017-11-03T15:06:31.211Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:06:26.207Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83884,\"lat\":45.75659},\"model\":\"demo\",\"id\":\"59fc85f2c74a4951f51dd062\",\"value\":{\"revmin\":9922,\"temperature\":110,\"hygrometry\":69},\"timestamp\":\"2017-11-03T15:06:26.202Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:06:21.239Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83814,\"lat\":45.75679},\"model\":\"demo\",\"id\":\"59fc85ed7676a72c9118db11\",\"value\":{\"revmin\":5937,\"temperature\":103,\"hygrometry\":67},\"timestamp\":\"2017-11-03T15:06:21.237Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:05:26.214Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75757},\"model\":\"demo\",\"id\":\"59fc85b6c74a4951f51dce36\",\"value\":{\"revmin\":3838,\"temperature\":117,\"hygrometry\":12},\"timestamp\":\"2017-11-03T15:05:26.204Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:05:06.241Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8371,\"lat\":45.75842},\"model\":\"demo\",\"id\":\"59fc85a27676a72c9118d850\",\"value\":{\"revmin\":9987,\"temperature\":103,\"hygrometry\":10},\"timestamp\":\"2017-11-03T15:05:06.237Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:04:51.232Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83749,\"lat\":45.75913},\"model\":\"demo\",\"id\":\"59fc8593c74a4951f51dccdc\",\"value\":{\"revmin\":6007,\"temperature\":102,\"hygrometry\":3},\"timestamp\":\"2017-11-03T15:04:51.229Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:04:41.228Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83773,\"lat\":45.76},\"model\":\"demo\",\"id\":\"59fc85897676a72c9118d755\",\"value\":{\"revmin\":1086,\"temperature\":114,\"hygrometry\":11},\"timestamp\":\"2017-11-03T15:04:41.226Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:03:01.215Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"59fc8525c74a4951f51dc8a8\",\"value\":{\"revmin\":8262,\"temperature\":107,\"hygrometry\":68},\"timestamp\":\"2017-11-03T15:03:01.213Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:36.198Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83661,\"lat\":45.76759},\"model\":\"demo\",\"id\":\"59fc850cc74a4951f51dc7bc\",\"value\":{\"revmin\":8817,\"temperature\":113,\"hygrometry\":5},\"timestamp\":\"2017-11-03T15:02:36.195Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:31.233Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83636,\"lat\":45.76756},\"model\":\"demo\",\"id\":\"59fc8507c74a4951f51dc783\",\"value\":{\"revmin\":6273,\"temperature\":112,\"hygrometry\":76},\"timestamp\":\"2017-11-03T15:02:31.231Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:26.289Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83627,\"lat\":45.76754},\"model\":\"demo\",\"id\":\"59fc85027676a72c9118d228\",\"value\":{\"revmin\":8623,\"temperature\":107,\"hygrometry\":94},\"timestamp\":\"2017-11-03T15:02:26.287Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:14:42.569Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83773,\"lat\":45.76},\"model\":\"demo\",\"id\":\"59fa2b327676a72c91fefcd4\",\"value\":{\"revmin\":8107,\"temperature\":101,\"hygrometry\":69},\"timestamp\":\"2017-11-01T20:14:42.568Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:14:32.582Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"59fa2b287676a72c91fefc87\",\"value\":{\"revmin\":5628,\"temperature\":113,\"hygrometry\":74},\"timestamp\":\"2017-11-01T20:14:32.581Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:14:22.599Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8379,\"lat\":45.76099},\"model\":\"demo\",\"id\":\"59fa2b1e7676a72c91fefc34\",\"value\":{\"revmin\":1083,\"temperature\":105,\"hygrometry\":24},\"timestamp\":\"2017-11-01T20:14:22.597Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:14:02.573Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76266},\"model\":\"demo\",\"id\":\"59fa2b0a7676a72c91fefb82\",\"value\":{\"revmin\":6302,\"temperature\":100,\"hygrometry\":89},\"timestamp\":\"2017-11-01T20:14:02.572Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:13:17.592Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.7642},\"model\":\"demo\",\"id\":\"59fa2addc74a4951f503ef59\",\"value\":{\"revmin\":6765,\"temperature\":101,\"hygrometry\":22},\"timestamp\":\"2017-11-01T20:13:17.590Z\",\"tags\":null}}]},\"aggregations\":{\"stats_temperature\":{\"count\":814,\"min\":100.0,\"max\":120.0,\"avg\":110.27518427518427,\"sum\":89764.0},\"stats_speed\":{\"count\":814,\"min\":0.0,\"max\":10000.0,\"avg\":5155.32800982801,\"sum\":4196437.0},\"stats_hygrometry\":{\"count\":814,\"min\":0.0,\"max\":100.0,\"avg\":48.61302211302211,\"sum\":39571.0}}}"
						}
					]
				},
				{
					"name": "Search service - multi range request, ordered, with stats",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n\t\"size\" : 100, \r\n\t\"query\" : { \r\n\t\t\"bool\":{\r\n\t\t\t\"filter\": [\r\n\t\t\t\t{\r\n\t\t\t\t\t\"term\" : { \"streamId\": \"android357329073120059\" }\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@demo.value.temperature\" :{\r\n\t\t\t\t\t\t\t\"gte\" : 20,\r\n\t\t\t\t\t\t\t\"lte\" : 50\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@demo.value.hygrometry\" :{\r\n\t\t\t\t\t\t\t\"gte\" : 30,\r\n\t\t\t\t\t\t\t\"lte\" : 80\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t},\r\n\t\"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n\t\"aggs\" : {\r\n\t\t\"stats_temperature\" : { \"stats\" : { \"field\" : \"@demo.value.temperature\" } },\r\n\t\t\"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@demo.value.hygrometry\" } },\r\n\t\t\"stats_speed\" : { \"stats\" : { \"field\" : \"@demo.value.revmin\" } }\r\n\t}\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": "Multirange request on Elastic Search with the followig restrictions : \n- The last 100\n- Range : 20 < temperature < 50 And 30 < hygrometry < 80\n- StreamID : android357329073120059\n- Model : \"demo\"\n- Ordered by timestamp\n- stats at the bottom of the result\n\n<br>\nExemple of the data values :<br>\n\"value\": {<br>\n  \"revmin\": 2584,<br>\n  \"temperature\": 35,<br>\n  \"hygrometry\": 46<br>\n}"
					},
					"response": [
						{
							"name": "OAB App - ELS - multi range",
							"originalRequest": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									},
									{
										"key": "Content-Type",
										"value": "application/json",
										"warning": ""
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"size\" : 100, \r\n \"query\" : { \r\n   \"and\":\r\n   [\r\n     {\r\n      \"term\" : { \"streamId\": \"android357329073120059\" }\r\n    },\r\n    {\r\n       \"range\" : {\r\n         \"@demo.value.temperature\" :{\r\n           \"gte\" : 20,\r\n           \"lte\" : 50\r\n         }\r\n       }\r\n     },\r\n     {\r\n       \"range\" : {\r\n         \"@demo.value.hygrometry\" :{\r\n           \"gte\" : 30,\r\n           \"lte\" : 80\r\n         }\r\n       }\r\n       \r\n     }\r\n   ]\r\n },\r\n \r\n \"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n \r\n    \"aggs\" :\r\n    {\r\n        \"stats_temperature\" : { \"stats\" : { \"field\" : \"@demo.value.temperature\" } },\r\n        \"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@demo.value.hygrometry\" } },\r\n        \"stats_speed\" : { \"stats\" : { \"field\" : \"@demo.value.revmin\" } }\r\n     }\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"search"
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-length",
									"value": "40905",
									"name": "content-length",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 23 Nov 2017 16:01:58 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "{\"took\":114,\"hits\":{\"total\":605,\"hits\":[{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:06:15.412Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.7642},\"model\":\"demo\",\"id\":\"5a15caa7c74a4951f542e1a5\",\"value\":{\"revmin\":3996,\"temperature\":35,\"hygrometry\":49},\"timestamp\":\"2017-11-22T19:06:15.411Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:05:45.436Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76302},\"model\":\"demo\",\"id\":\"5a15ca89c74a4951f542e06b\",\"value\":{\"revmin\":8137,\"temperature\":20,\"hygrometry\":30},\"timestamp\":\"2017-11-22T19:05:45.433Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:00:47.980Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83655,\"lat\":45.75726},\"model\":\"demo\",\"id\":\"5a15c95fc74a4951f542d2a9\",\"value\":{\"revmin\":9691,\"temperature\":24,\"hygrometry\":63},\"timestamp\":\"2017-11-22T19:00:47.978Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T19:00:41.053Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"5a15c9597676a7304f574236\",\"value\":{\"revmin\":5401,\"temperature\":28,\"hygrometry\":41},\"timestamp\":\"2017-11-22T19:00:41.051Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:59:53.053Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83731,\"lat\":45.75886},\"model\":\"demo\",\"id\":\"5a15c929c74a4951f542cffb\",\"value\":{\"revmin\":7011,\"temperature\":24,\"hygrometry\":59},\"timestamp\":\"2017-11-22T18:59:53.050Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T18:47:11.931Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83617,\"lat\":45.76751},\"model\":\"demo\",\"id\":\"5a15c62fc74a4951f5428eec\",\"value\":{\"revmin\":37,\"temperature\":29,\"hygrometry\":39},\"timestamp\":\"2017-11-22T18:47:11.623Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T17:01:52.861Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a15ad80c74a4951f5413589\",\"value\":{\"revmin\":2062,\"temperature\":28,\"hygrometry\":64},\"timestamp\":\"2017-11-22T17:01:52.859Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T17:01:47.971Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.7642},\"model\":\"demo\",\"id\":\"5a15ad7bc74a4951f541353c\",\"value\":{\"revmin\":2888,\"temperature\":40,\"hygrometry\":70},\"timestamp\":\"2017-11-22T17:01:47.968Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T16:58:05.068Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"5a15ac9d7676a7304f559b65\",\"value\":{\"revmin\":1251,\"temperature\":20,\"hygrometry\":51},\"timestamp\":\"2017-11-22T16:58:05.065Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:27:15.814Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a158943c74a4951f53efaf9\",\"value\":{\"revmin\":845,\"temperature\":37,\"hygrometry\":43},\"timestamp\":\"2017-11-22T14:27:15.813Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:27:10.013Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a15893e7676a7304f536a94\",\"value\":{\"revmin\":4764,\"temperature\":37,\"hygrometry\":71},\"timestamp\":\"2017-11-22T14:27:10.012Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T14:27:01.721Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83813,\"lat\":45.76502},\"model\":\"demo\",\"id\":\"5a1589357676a7304f536a37\",\"value\":{\"revmin\":5058,\"temperature\":25,\"hygrometry\":32},\"timestamp\":\"2017-11-22T14:27:01.720Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:53.747Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84178,\"lat\":45.75567},\"model\":\"demo\",\"id\":\"5a1549a9c74a4951f53844d4\",\"value\":{\"revmin\":9015,\"temperature\":48,\"hygrometry\":76},\"timestamp\":\"2017-11-22T07:55:16.254Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:51.304Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83955,\"lat\":45.75638},\"model\":\"demo\",\"id\":\"5a1549a7c74a4951f5383d6b\",\"value\":{\"revmin\":1950,\"temperature\":44,\"hygrometry\":50},\"timestamp\":\"2017-11-22T07:54:46.257Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.259Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83664,\"lat\":45.75724},\"model\":\"demo\",\"id\":\"5a1549a6c74a4951f53836f3\",\"value\":{\"revmin\":8378,\"temperature\":22,\"hygrometry\":79},\"timestamp\":\"2017-11-22T07:53:42.778Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:50.143Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"5a1549a67676a7304f4de7dc\",\"value\":{\"revmin\":4254,\"temperature\":38,\"hygrometry\":46},\"timestamp\":\"2017-11-22T07:53:21.319Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:49.755Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83659,\"lat\":45.75733},\"model\":\"demo\",\"id\":\"5a1549a5c74a4951f53833de\",\"value\":{\"revmin\":5120,\"temperature\":31,\"hygrometry\":67},\"timestamp\":\"2017-11-22T07:53:11.545Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:49.732Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75761},\"model\":\"demo\",\"id\":\"5a1549a5c74a4951f53833b0\",\"value\":{\"revmin\":8750,\"temperature\":39,\"hygrometry\":47},\"timestamp\":\"2017-11-22T07:53:01.319Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:48.546Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83803,\"lat\":45.76163},\"model\":\"demo\",\"id\":\"5a1549a47676a7304f4de377\",\"value\":{\"revmin\":8406,\"temperature\":25,\"hygrometry\":39},\"timestamp\":\"2017-11-22T07:51:59.083Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:48.169Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76327},\"model\":\"demo\",\"id\":\"5a1549a47676a7304f4de122\",\"value\":{\"revmin\":6804,\"temperature\":45,\"hygrometry\":40},\"timestamp\":\"2017-11-22T07:51:35.087Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:47.840Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"5a1549a37676a7304f4ddfa1\",\"value\":{\"revmin\":7206,\"temperature\":44,\"hygrometry\":69},\"timestamp\":\"2017-11-22T07:51:19.126Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:47.648Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a1549a37676a7304f4dde53\",\"value\":{\"revmin\":2321,\"temperature\":37,\"hygrometry\":41},\"timestamp\":\"2017-11-22T07:51:03.087Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:46.358Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a1549a27676a7304f4ddb37\",\"value\":{\"revmin\":2687,\"temperature\":40,\"hygrometry\":65},\"timestamp\":\"2017-11-22T07:50:27.086Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-22T09:55:49.419Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83605,\"lat\":45.76734},\"model\":\"demo\",\"id\":\"5a1549a5c74a4951f5383240\",\"value\":{\"revmin\":4863,\"temperature\":30,\"hygrometry\":59},\"timestamp\":\"2017-11-22T07:50:15.138Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:32:50.684Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83675,\"lat\":45.7572},\"model\":\"demo\",\"id\":\"5a0c6c327676a72c91b77c12\",\"value\":{\"revmin\":3648,\"temperature\":20,\"hygrometry\":61},\"timestamp\":\"2017-11-15T16:32:50.689Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:32:29.577Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83644,\"lat\":45.75729},\"model\":\"demo\",\"id\":\"5a0c6c1dc74a4951f5bc702a\",\"value\":{\"revmin\":250,\"temperature\":23,\"hygrometry\":72},\"timestamp\":\"2017-11-15T16:32:29.579Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:32:25.554Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83648,\"lat\":45.75735},\"model\":\"demo\",\"id\":\"5a0c6c19c74a4951f5bc6ffe\",\"value\":{\"revmin\":3670,\"temperature\":29,\"hygrometry\":53},\"timestamp\":\"2017-11-15T16:32:25.556Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:32:09.586Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75757},\"model\":\"demo\",\"id\":\"5a0c6c097676a72c91b77a4f\",\"value\":{\"revmin\":1866,\"temperature\":45,\"hygrometry\":61},\"timestamp\":\"2017-11-15T16:32:09.566Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:30:18.564Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76356},\"model\":\"demo\",\"id\":\"5a0c6b9a7676a72c91b775c2\",\"value\":{\"revmin\":1524,\"temperature\":49,\"hygrometry\":30},\"timestamp\":\"2017-11-15T16:30:18.566Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:29:14.447Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a0c6b5a7676a72c91b77327\",\"value\":{\"revmin\":7830,\"temperature\":34,\"hygrometry\":55},\"timestamp\":\"2017-11-15T16:29:14.451Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:13:29.484Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83749,\"lat\":45.75913},\"model\":\"demo\",\"id\":\"5a0c67a9c74a4951f5bc32c1\",\"value\":{\"revmin\":9154,\"temperature\":26,\"hygrometry\":52},\"timestamp\":\"2017-11-15T16:13:29.485Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:10:32.995Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83655,\"lat\":45.75726},\"model\":\"demo\",\"id\":\"5a0c66f87676a72c91b7369c\",\"value\":{\"revmin\":549,\"temperature\":37,\"hygrometry\":66},\"timestamp\":\"2017-11-15T16:10:32.999Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T16:10:29.025Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83644,\"lat\":45.75729},\"model\":\"demo\",\"id\":\"5a0c66f57676a72c91b73680\",\"value\":{\"revmin\":8164,\"temperature\":38,\"hygrometry\":47},\"timestamp\":\"2017-11-15T16:10:29.028Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:25:54.964Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"5a0c4e727676a72c91b5bcd3\",\"value\":{\"revmin\":6031,\"temperature\":45,\"hygrometry\":69},\"timestamp\":\"2017-11-15T14:25:54.961Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:25:24.930Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83705,\"lat\":45.76765},\"model\":\"demo\",\"id\":\"5a0c4e54c74a4951f5baafbf\",\"value\":{\"revmin\":7158,\"temperature\":47,\"hygrometry\":41},\"timestamp\":\"2017-11-15T14:25:24.927Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T14:25:04.936Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83636,\"lat\":45.76756},\"model\":\"demo\",\"id\":\"5a0c4e407676a72c91b5b91a\",\"value\":{\"revmin\":4570,\"temperature\":40,\"hygrometry\":47},\"timestamp\":\"2017-11-15T14:25:04.932Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T10:35:35.902Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a0c1877c74a4951f5b7e7dc\",\"value\":{\"revmin\":9688,\"temperature\":29,\"hygrometry\":44},\"timestamp\":\"2017-11-15T10:35:35.901Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-15T08:20:43.698Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83604,\"lat\":45.76748},\"model\":\"demo\",\"id\":\"5a0bf8dbc74a4951f5b68bd3\",\"value\":{\"revmin\":4753,\"temperature\":42,\"hygrometry\":54},\"timestamp\":\"2017-11-15T08:20:43.697Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:38:36.722Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84271,\"lat\":45.75533},\"model\":\"demo\",\"id\":\"5a01710c7676a72c91460ad8\",\"value\":{\"revmin\":4413,\"temperature\":29,\"hygrometry\":39},\"timestamp\":\"2017-11-07T08:38:36.718Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:37:56.695Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84083,\"lat\":45.75599},\"model\":\"demo\",\"id\":\"5a0170e47676a72c9146099f\",\"value\":{\"revmin\":8278,\"temperature\":35,\"hygrometry\":62},\"timestamp\":\"2017-11-07T08:37:56.693Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:37:46.720Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84083,\"lat\":45.75599},\"model\":\"demo\",\"id\":\"5a0170da7676a72c91460931\",\"value\":{\"revmin\":3423,\"temperature\":39,\"hygrometry\":78},\"timestamp\":\"2017-11-07T08:37:46.718Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:34:56.700Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83668,\"lat\":45.75761},\"model\":\"demo\",\"id\":\"5a0170307676a72c91460345\",\"value\":{\"revmin\":1702,\"temperature\":30,\"hygrometry\":50},\"timestamp\":\"2017-11-07T08:34:56.698Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:33:16.713Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83779,\"lat\":45.76038},\"model\":\"demo\",\"id\":\"5a016fccc74a4951f54af50e\",\"value\":{\"revmin\":9789,\"temperature\":20,\"hygrometry\":75},\"timestamp\":\"2017-11-07T08:33:16.711Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:32:16.697Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76266},\"model\":\"demo\",\"id\":\"5a016f90c74a4951f54af2e9\",\"value\":{\"revmin\":8370,\"temperature\":37,\"hygrometry\":76},\"timestamp\":\"2017-11-07T08:32:16.695Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:32:06.719Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83818,\"lat\":45.76287},\"model\":\"demo\",\"id\":\"5a016f86c74a4951f54af293\",\"value\":{\"revmin\":4865,\"temperature\":30,\"hygrometry\":71},\"timestamp\":\"2017-11-07T08:32:06.717Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:30:36.697Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83813,\"lat\":45.76502},\"model\":\"demo\",\"id\":\"5a016f2cc74a4951f54aef85\",\"value\":{\"revmin\":2933,\"temperature\":20,\"hygrometry\":36},\"timestamp\":\"2017-11-07T08:30:36.695Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:30:16.720Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a016f18c74a4951f54aeeaa\",\"value\":{\"revmin\":1885,\"temperature\":32,\"hygrometry\":69},\"timestamp\":\"2017-11-07T08:30:16.718Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:29:36.723Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83705,\"lat\":45.76765},\"model\":\"demo\",\"id\":\"5a016ef0c74a4951f54aed4c\",\"value\":{\"revmin\":9003,\"temperature\":33,\"hygrometry\":40},\"timestamp\":\"2017-11-07T08:29:36.720Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:29:06.686Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83627,\"lat\":45.76754},\"model\":\"demo\",\"id\":\"5a016ed27676a72c9145f709\",\"value\":{\"revmin\":8246,\"temperature\":28,\"hygrometry\":51},\"timestamp\":\"2017-11-07T08:29:06.684Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-07T08:28:16.689Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83605,\"lat\":45.76734},\"model\":\"demo\",\"id\":\"5a016ea07676a72c9145f564\",\"value\":{\"revmin\":4383,\"temperature\":35,\"hygrometry\":80},\"timestamp\":\"2017-11-07T08:28:16.684Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:40:04.141Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"5a00ac847676a72c913efcb6\",\"value\":{\"revmin\":3367,\"temperature\":46,\"hygrometry\":66},\"timestamp\":\"2017-11-06T18:40:04.140Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:39:54.130Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"5a00ac7a7676a72c913efc49\",\"value\":{\"revmin\":4726,\"temperature\":22,\"hygrometry\":33},\"timestamp\":\"2017-11-06T18:39:54.128Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:39:44.095Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a00ac707676a72c913efbfa\",\"value\":{\"revmin\":1076,\"temperature\":22,\"hygrometry\":77},\"timestamp\":\"2017-11-06T18:39:44.094Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:38:24.068Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76327},\"model\":\"demo\",\"id\":\"5a00ac207676a72c913ef989\",\"value\":{\"revmin\":8370,\"temperature\":38,\"hygrometry\":47},\"timestamp\":\"2017-11-06T18:38:24.061Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:36:13.947Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83755,\"lat\":45.75932},\"model\":\"demo\",\"id\":\"5a00ab9dc74a4951f543ea0f\",\"value\":{\"revmin\":469,\"temperature\":36,\"hygrometry\":46},\"timestamp\":\"2017-11-06T18:36:13.947Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:35:54.068Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83749,\"lat\":45.75913},\"model\":\"demo\",\"id\":\"5a00ab8ac74a4951f543e96d\",\"value\":{\"revmin\":5547,\"temperature\":40,\"hygrometry\":65},\"timestamp\":\"2017-11-06T18:35:53.958Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:35:33.936Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8371,\"lat\":45.75842},\"model\":\"demo\",\"id\":\"5a00ab75c74a4951f543e8b7\",\"value\":{\"revmin\":7661,\"temperature\":21,\"hygrometry\":38},\"timestamp\":\"2017-11-06T18:35:33.935Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:34:13.921Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83648,\"lat\":45.75735},\"model\":\"demo\",\"id\":\"5a00ab25c74a4951f543e622\",\"value\":{\"revmin\":7300,\"temperature\":45,\"hygrometry\":58},\"timestamp\":\"2017-11-06T18:34:13.920Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:33:43.927Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83664,\"lat\":45.75724},\"model\":\"demo\",\"id\":\"5a00ab077676a72c913eefc4\",\"value\":{\"revmin\":5096,\"temperature\":31,\"hygrometry\":41},\"timestamp\":\"2017-11-06T18:33:43.926Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:33:33.922Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83675,\"lat\":45.7572},\"model\":\"demo\",\"id\":\"5a00aafd7676a72c913eef66\",\"value\":{\"revmin\":345,\"temperature\":30,\"hygrometry\":63},\"timestamp\":\"2017-11-06T18:33:33.921Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:29:11.212Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83884,\"lat\":45.75659},\"model\":\"demo\",\"id\":\"5a00a9f7c74a4951f543da64\",\"value\":{\"revmin\":3562,\"temperature\":21,\"hygrometry\":72},\"timestamp\":\"2017-11-06T18:29:11.211Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:29:06.235Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83941,\"lat\":45.75642},\"model\":\"demo\",\"id\":\"5a00a9f2c74a4951f543da2b\",\"value\":{\"revmin\":7683,\"temperature\":38,\"hygrometry\":72},\"timestamp\":\"2017-11-06T18:29:06.234Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:28:37.439Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84094,\"lat\":45.75595},\"model\":\"demo\",\"id\":\"5a00a9d5c74a4951f543d915\",\"value\":{\"revmin\":630,\"temperature\":25,\"hygrometry\":76},\"timestamp\":\"2017-11-06T18:28:37.438Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:27:23.334Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83687,\"lat\":45.75717},\"model\":\"demo\",\"id\":\"5a00a98bc74a4951f543d68d\",\"value\":{\"revmin\":6500,\"temperature\":22,\"hygrometry\":72},\"timestamp\":\"2017-11-06T18:27:23.334Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:25:23.364Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83803,\"lat\":45.76163},\"model\":\"demo\",\"id\":\"5a00a913c74a4951f543d27f\",\"value\":{\"revmin\":8697,\"temperature\":32,\"hygrometry\":47},\"timestamp\":\"2017-11-06T18:25:23.363Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:25:13.341Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76266},\"model\":\"demo\",\"id\":\"5a00a9097676a72c913edcf3\",\"value\":{\"revmin\":4136,\"temperature\":35,\"hygrometry\":76},\"timestamp\":\"2017-11-06T18:25:13.339Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:25:08.350Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83818,\"lat\":45.76287},\"model\":\"demo\",\"id\":\"5a00a9047676a72c913edcca\",\"value\":{\"revmin\":1075,\"temperature\":34,\"hygrometry\":47},\"timestamp\":\"2017-11-06T18:25:08.349Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:24:43.342Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76356},\"model\":\"demo\",\"id\":\"5a00a8ebc74a4951f543d112\",\"value\":{\"revmin\":1304,\"temperature\":49,\"hygrometry\":38},\"timestamp\":\"2017-11-06T18:24:43.341Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:24:13.339Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"5a00a8cd7676a72c913edaa8\",\"value\":{\"revmin\":8537,\"temperature\":48,\"hygrometry\":35},\"timestamp\":\"2017-11-06T18:24:13.339Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-06T18:13:31.341Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83617,\"lat\":45.76751},\"model\":\"demo\",\"id\":\"5a00a64bc74a4951f543b825\",\"value\":{\"revmin\":6450,\"temperature\":47,\"hygrometry\":42},\"timestamp\":\"2017-11-06T18:13:31.302Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T16:17:11.021Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83705,\"lat\":45.76765},\"model\":\"demo\",\"id\":\"59fc9687c74a4951f51e6f6c\",\"value\":{\"revmin\":5231,\"temperature\":24,\"hygrometry\":58},\"timestamp\":\"2017-11-03T16:17:11.017Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:11:33.631Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"59fc87257676a72c9118e630\",\"value\":{\"revmin\":1639,\"temperature\":37,\"hygrometry\":76},\"timestamp\":\"2017-11-03T15:11:33.628Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:10:22.646Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83782,\"lat\":45.76059},\"model\":\"demo\",\"id\":\"59fc86dec74a4951f51dd8a5\",\"value\":{\"revmin\":833,\"temperature\":34,\"hygrometry\":53},\"timestamp\":\"2017-11-03T15:10:22.644Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:08:55.461Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"59fc86877676a72c9118e075\",\"value\":{\"revmin\":9705,\"temperature\":22,\"hygrometry\":34},\"timestamp\":\"2017-11-03T15:08:55.459Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:08:49.563Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83648,\"lat\":45.75735},\"model\":\"demo\",\"id\":\"59fc8681c74a4951f51dd570\",\"value\":{\"revmin\":7457,\"temperature\":24,\"hygrometry\":67},\"timestamp\":\"2017-11-03T15:08:49.561Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:07:21.525Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84178,\"lat\":45.75567},\"model\":\"demo\",\"id\":\"59fc86297676a72c9118dd27\",\"value\":{\"revmin\":5620,\"temperature\":50,\"hygrometry\":38},\"timestamp\":\"2017-11-03T15:07:21.215Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:07:01.237Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84094,\"lat\":45.75595},\"model\":\"demo\",\"id\":\"59fc86157676a72c9118dc74\",\"value\":{\"revmin\":8862,\"temperature\":39,\"hygrometry\":79},\"timestamp\":\"2017-11-03T15:07:01.235Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:05:01.209Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83731,\"lat\":45.75886},\"model\":\"demo\",\"id\":\"59fc859dc74a4951f51dcd5d\",\"value\":{\"revmin\":5825,\"temperature\":47,\"hygrometry\":75},\"timestamp\":\"2017-11-03T15:05:01.208Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:03:56.223Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83818,\"lat\":45.76287},\"model\":\"demo\",\"id\":\"59fc855cc74a4951f51dcabe\",\"value\":{\"revmin\":1101,\"temperature\":20,\"hygrometry\":50},\"timestamp\":\"2017-11-03T15:03:56.221Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:03:21.200Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83816,\"lat\":45.76362},\"model\":\"demo\",\"id\":\"59fc85397676a72c9118d457\",\"value\":{\"revmin\":588,\"temperature\":46,\"hygrometry\":30},\"timestamp\":\"2017-11-03T15:03:21.198Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:56.252Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"59fc8520c74a4951f51dc877\",\"value\":{\"revmin\":6556,\"temperature\":42,\"hygrometry\":31},\"timestamp\":\"2017-11-03T15:02:56.249Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:51.279Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"59fc851bc74a4951f51dc83a\",\"value\":{\"revmin\":1116,\"temperature\":34,\"hygrometry\":52},\"timestamp\":\"2017-11-03T15:02:51.277Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-03T15:02:46.212Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"59fc85167676a72c9118d2f1\",\"value\":{\"revmin\":4909,\"temperature\":20,\"hygrometry\":40},\"timestamp\":\"2017-11-03T15:02:46.210Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:13:37.591Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.76349},\"model\":\"demo\",\"id\":\"59fa2af1c74a4951f503f003\",\"value\":{\"revmin\":595,\"temperature\":24,\"hygrometry\":44},\"timestamp\":\"2017-11-01T20:13:37.589Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:12:57.566Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83801,\"lat\":45.76676},\"model\":\"demo\",\"id\":\"59fa2ac9c74a4951f503eeb5\",\"value\":{\"revmin\":4318,\"temperature\":35,\"hygrometry\":76},\"timestamp\":\"2017-11-01T20:12:57.565Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:12:47.590Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83791,\"lat\":45.76777},\"model\":\"demo\",\"id\":\"59fa2abf7676a72c91fef920\",\"value\":{\"revmin\":5589,\"temperature\":37,\"hygrometry\":67},\"timestamp\":\"2017-11-01T20:12:47.588Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:12:42.569Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83705,\"lat\":45.76765},\"model\":\"demo\",\"id\":\"59fa2aba7676a72c91fef8eb\",\"value\":{\"revmin\":5392,\"temperature\":31,\"hygrometry\":43},\"timestamp\":\"2017-11-01T20:12:42.568Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:12:02.563Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83605,\"lat\":45.76734},\"model\":\"demo\",\"id\":\"59fa2a927676a72c91fef780\",\"value\":{\"revmin\":9479,\"temperature\":28,\"hygrometry\":76},\"timestamp\":\"2017-11-01T20:12:02.562Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:10:59.542Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84083,\"lat\":45.75599},\"model\":\"demo\",\"id\":\"59fa2a537676a72c91fef540\",\"value\":{\"revmin\":2156,\"temperature\":33,\"hygrometry\":43},\"timestamp\":\"2017-11-01T20:10:59.541Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:10:44.442Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84178,\"lat\":45.75567},\"model\":\"demo\",\"id\":\"59fa2a447676a72c91fef4ae\",\"value\":{\"revmin\":7117,\"temperature\":25,\"hygrometry\":75},\"timestamp\":\"2017-11-01T20:10:44.440Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:10:34.446Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84271,\"lat\":45.75533},\"model\":\"demo\",\"id\":\"59fa2a3a7676a72c91fef462\",\"value\":{\"revmin\":9344,\"temperature\":25,\"hygrometry\":79},\"timestamp\":\"2017-11-01T20:10:34.444Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:09:04.424Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83654,\"lat\":45.75734},\"model\":\"demo\",\"id\":\"59fa29e0c74a4951f503e64d\",\"value\":{\"revmin\":1203,\"temperature\":36,\"hygrometry\":76},\"timestamp\":\"2017-11-01T20:09:04.422Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:08:09.420Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83755,\"lat\":45.75932},\"model\":\"demo\",\"id\":\"59fa29a97676a72c91feef23\",\"value\":{\"revmin\":151,\"temperature\":43,\"hygrometry\":53},\"timestamp\":\"2017-11-01T20:08:09.419Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:08:04.427Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83773,\"lat\":45.76},\"model\":\"demo\",\"id\":\"59fa29a47676a72c91feeee0\",\"value\":{\"revmin\":7327,\"temperature\":35,\"hygrometry\":78},\"timestamp\":\"2017-11-01T20:08:04.425Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:06:24.422Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83808,\"lat\":45.76617},\"model\":\"demo\",\"id\":\"59fa2940c74a4951f503e0be\",\"value\":{\"revmin\":7171,\"temperature\":41,\"hygrometry\":57},\"timestamp\":\"2017-11-01T20:06:24.420Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T20:05:49.422Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83627,\"lat\":45.76754},\"model\":\"demo\",\"id\":\"59fa291dc74a4951f503df90\",\"value\":{\"revmin\":4959,\"temperature\":29,\"hygrometry\":42},\"timestamp\":\"2017-11-01T20:05:49.420Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T16:58:08.286Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.84088,\"lat\":45.75597},\"model\":\"demo\",\"id\":\"59f9fd20c74a4951f50230bb\",\"value\":{\"revmin\":2674,\"temperature\":21,\"hygrometry\":70},\"timestamp\":\"2017-11-01T16:58:08.284Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T16:57:43.312Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83941,\"lat\":45.75642},\"model\":\"demo\",\"id\":\"59f9fd077676a72c91fd3aab\",\"value\":{\"revmin\":6709,\"temperature\":34,\"hygrometry\":62},\"timestamp\":\"2017-11-01T16:57:43.311Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T16:55:33.286Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.8379,\"lat\":45.76099},\"model\":\"demo\",\"id\":\"59f9fc85c74a4951f5022b33\",\"value\":{\"revmin\":6400,\"temperature\":35,\"hygrometry\":68},\"timestamp\":\"2017-11-01T16:55:33.284Z\",\"tags\":null}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"urn:lo:nsid:android:357329073120059\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-01T16:54:28.297Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":4.83817,\"lat\":45.7642},\"model\":\"demo\",\"id\":\"59f9fc447676a72c91fd3405\",\"value\":{\"revmin\":5541,\"temperature\":32,\"hygrometry\":73},\"timestamp\":\"2017-11-01T16:54:28.296Z\",\"tags\":null}}]},\"aggregations\":{\"stats_temperature\":{\"count\":605,\"min\":20.0,\"max\":50.0,\"avg\":35.0396694214876,\"sum\":21199.0},\"stats_speed\":{\"count\":605,\"min\":37.0,\"max\":9961.0,\"avg\":5047.2,\"sum\":3053556.0},\"stats_hygrometry\":{\"count\":605,\"min\":30.0,\"max\":80.0,\"avg\":55.401652892561984,\"sum\":33518.0}}}"
						}
					]
				},
				{
					"name": "Search service - multi range request, ordered, with stats, with another model",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n\t\"size\" : 100, \r\n\t\"query\" : { \r\n\t\t\"bool\":{\r\n\t\t\t\"filter\": [\r\n\t\t\t\t{\r\n\t\t\t\t\t\"term\" : { \"streamId\": \"android357329073120059\" }\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@ModelOABDemoApp00.value.temperature\" :{\r\n\t\t\t\t\t\t\"gte\" : 20,\r\n\t\t\t\t\t\t\"lte\" : 50\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@ModelOABDemoApp00.value.hygrometry\" :{\r\n\t\t\t\t\t\t\"gte\" : 30,\r\n\t\t\t\t\t\t\"lte\" : 80\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t},\r\n\t \r\n\t\"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n\t\r\n\t\"aggs\" : {\r\n\t\t\"stats_temperature\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.temperature\" } },\r\n\t\t\"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.hygrometry\" } },\r\n\t\t\"stats_speed\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.revmin\" } }\r\n\t}\r\n\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": "Multirange request on Elastic Search with the followig restrictions : \n- The last 100\n- Range : 20 < temperature < 50 And 30 < hygrometry < 80\n- StreamID : android357329073120059\n- Model : \"ModelOABDemoApp00\"\n- Ordered by timestamp\n- stats at the bottom of the result\n\n<br>\nExemple of the data values :<br>\n\"value\": {<br>\n  \"revmin\": 2584,<br>\n  \"temperature\": 35,<br>\n  \"hygrometry\": 46<br>\n}"
					},
					"response": [
						{
							"name": "Simul OAB App - multi range",
							"originalRequest": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									},
									{
										"key": "Content-Type",
										"value": "application/json",
										"warning": ""
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"size\" : 100, \r\n \"query\" : { \r\n   \"and\":\r\n   [\r\n     {\r\n      \"term\" : { \"streamId\": \"android357329073120059\" }\r\n    },\r\n    {\r\n       \"range\" : {\r\n         \"@ModelOABDemoApp00.value.temperature\" :{\r\n           \"gte\" : 20,\r\n           \"lte\" : 50\r\n         }\r\n       }\r\n     },\r\n     {\r\n       \"range\" : {\r\n         \"@ModelOABDemoApp00.value.hygrometry\" :{\r\n           \"gte\" : 30,\r\n           \"lte\" : 80\r\n         }\r\n       }\r\n       \r\n     }\r\n   ]\r\n },\r\n \r\n \"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n \r\n    \"aggs\" :\r\n    {\r\n        \"stats_temperature\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.temperature\" } },\r\n        \"stats_hygrometry\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.hygrometry\" } },\r\n        \"stats_speed\" : { \"stats\" : { \"field\" : \"@ModelOABDemoApp00.value.revmin\" } }\r\n     }\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"search"
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-length",
									"value": "720",
									"name": "content-length",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 23 Nov 2017 16:00:13 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "{\"took\":3,\"hits\":{\"total\":1,\"hits\":[{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"URN:LO:NSID:SENSOR:TESTFLGAPPOAB00000\"},\"streamId\":\"android357329073120059\",\"created\":\"2017-11-11T19:02:45.226Z\",\"location\":{\"provider\":null,\"alt\":null,\"accuracy\":null,\"lon\":2.348264,\"lat\":48.872015},\"model\":\"ModelOABDemoApp00\",\"id\":\"5a074955c74a4951f5874d99\",\"value\":{\"revmin\":2584,\"temperature\":35,\"hygrometry\":46},\"timestamp\":\"2017-11-11T19:02:45.222Z\",\"tags\":[\"OABDemoApp.00\"]}}]},\"aggregations\":{\"stats_temperature\":{\"count\":1,\"min\":35.0,\"max\":35.0,\"avg\":35.0,\"sum\":35.0},\"stats_speed\":{\"count\":1,\"min\":2584.0,\"max\":2584.0,\"avg\":2584.0,\"sum\":2584.0},\"stats_hygrometry\":{\"count\":1,\"min\":46.0,\"max\":46.0,\"avg\":46.0,\"sum\":46.0}}}"
						}
					]
				},
				{
					"name": "Search service - Airparif pollution data - Multirange on CO & PM10, advanced stats",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n\t\"size\" : 100, \r\n\t\"query\" : { \r\n\t\t\"bool\":{\r\n\t\t\t\"filter\": [\r\n\t\t\t\t{\r\n\t\t\t\t\t\"term\" : { \"streamId\": \"StreamPushAirParif\" }\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@SampleAirParif03.value.CO\" :{\r\n\t\t\t\t\t\t\"gte\" : 0,\r\n\t\t\t\t\t\t\"lte\" : 10000\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t},\r\n\t\t\t\t{\r\n\t\t\t\t\t\"range\" : {\r\n\t\t\t\t\t\t\"@SampleAirParif03.value.PM10\" :{\r\n\t\t\t\t\t\t\"gte\" : 0,\r\n\t\t\t\t\t\t\"lte\" : 500\r\n\t\t\t\t\t\t}\r\n\t\t\t\t\t}\r\n\t\t\t\t}\r\n\t\t\t]\r\n\t\t}\r\n\t},\r\n\t\"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n\t \r\n\t\"aggs\" :{\r\n\t\t\"stats_CO\" : { \"stats\" : { \"field\" : \"@SampleAirParif03.value.CO\" } },\r\n\t\t\"stats_PM10\" : { \"stats\" : { \"field\" : \"@SampleAirParif03.value.PM10\" } },\r\n\t\t\"percent PM10\" : { \"percentiles\" : { \"field\" : \"@SampleAirParif03.value.PM10\" } },\r\n\t\t\"percent rank PM10\" : {\r\n\t\t\t\"percentile_ranks\" : { \r\n\t\t\t\t\t\"field\" : \"@SampleAirParif03.value.PM10\", \r\n\t\t\t\t\t\"values\" : [10, 50, 100, 150, 200, 1000]\r\n\t\t\t\t}\r\n\t\t\t},      \r\n\t\t\t\"percent rank PM25\" : {  \r\n\t\t\t\t\"percentile_ranks\" : { \r\n\t\t\t\t\t\"field\" : \"@SampleAirParif03.value.PM25\", \r\n\t\t\t\t\t\"values\" : [10, 50, 100, 150, 200, 1000]\r\n\t\t\t\t}\r\n\t\t\t}\r\n\t}\r\n\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"data",
								"search"
							]
						},
						"description": "Multirange + advanced stats request on Paris pollution data.\n\nMultirange request on Elastic Search with the followig restrictions : \n- The last 100\n- Range : 0 < CO < 10000 And 0 < PM10 < 500\n- StreamID : StreamPushAirParif\n- Model : \"SampleAirParif03\"\n- Ordered by timestamp\n- stats : percentiles and percentile ranks\n\n\n<br>\nExemple of the data values :<br>\n\"value\": {<br>\n  \"NO2\": 49,<br>\n  \"O3\": 11,<br>\n  \"Town\": \"Paris Centre\",<br>\n  \"PM25\": 15,<br>\n  \"PM10\": 28,<br>\n  \"CO\": 400<br>\n}<br>"
					},
					"response": [
						{
							"name": "StreamPushAirParif - multirange",
							"originalRequest": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}",
										"warning": ""
									},
									{
										"key": "Content-Type",
										"value": "application/json",
										"warning": ""
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"size\" : 100, \r\n \"query\" : { \r\n   \"and\":\r\n   [\r\n     {\r\n      \"term\" : { \"streamId\": \"StreamPushAirParif\" }\r\n    },\r\n    {\r\n       \"range\" : {\r\n         \"@SampleAirParif03.value.CO\" :{\r\n           \"gte\" : 0,\r\n           \"lte\" : 10000\r\n         }\r\n       }\r\n     },\r\n     {\r\n       \"range\" : {\r\n         \"@SampleAirParif03.value.PM10\" :{\r\n           \"gte\" : 0,\r\n           \"lte\" : 500\r\n         }\r\n       }\r\n       \r\n     }\r\n   ]\r\n },\r\n \"sort\": { \"timestamp\": { \"order\": \"desc\" }},\r\n \r\n    \"aggs\" :\r\n    {\r\n        \"stats_CO\" : { \"stats\" : { \"field\" : \"@SampleAirParif03.value.CO\" } },\r\n        \"stats_PM10\" : { \"stats\" : { \"field\" : \"@SampleAirParif03.value.PM10\" } },\r\n      \"percent PM10\" : { \"percentiles\" : { \"field\" : \"@SampleAirParif03.value.PM10\" } },\r\n    \"percent rank PM10\" : {  \"percentile_ranks\" : \r\n        { \r\n          \"field\" : \"@SampleAirParif03.value.PM10\", \r\n                  \"values\" : [10, 50, 100, 150, 200, 1000]\r\n              }\r\n    },      \r\n    \"percent rank PM25\" : {  \"percentile_ranks\" : \r\n        { \r\n          \"field\" : \"@SampleAirParif03.value.PM25\", \r\n                  \"values\" : [10, 50, 100, 150, 200, 1000]\r\n              }\r\n    }      \r\n    }\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/data/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"data",
										"search"
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "access-control-allow-headers",
									"value": "X-Requested-With, Content-Type, X-IAE-KEY, X-XSRF-TOKEN, X-API-KEY",
									"name": "access-control-allow-headers",
									"description": ""
								},
								{
									"key": "access-control-allow-origin",
									"value": "chrome-extension://fhbjgbiflinjbdggehcddcbncdddomop",
									"name": "access-control-allow-origin",
									"description": ""
								},
								{
									"key": "cache-control",
									"value": "no-cache, no-store, max-age=0, must-revalidate",
									"name": "cache-control",
									"description": ""
								},
								{
									"key": "connection",
									"value": "keep-alive",
									"name": "connection",
									"description": ""
								},
								{
									"key": "content-length",
									"value": "36957",
									"name": "content-length",
									"description": ""
								},
								{
									"key": "content-type",
									"value": "application/json;charset=UTF-8",
									"name": "content-type",
									"description": ""
								},
								{
									"key": "date",
									"value": "Thu, 18 Jan 2018 17:57:59 GMT",
									"name": "date",
									"description": ""
								},
								{
									"key": "expires",
									"value": "0",
									"name": "expires",
									"description": ""
								},
								{
									"key": "pragma",
									"value": "no-cache",
									"name": "pragma",
									"description": ""
								},
								{
									"key": "server",
									"value": "nginx",
									"name": "server",
									"description": ""
								},
								{
									"key": "x-application-context",
									"value": "iaes-web:prod:8080",
									"name": "x-application-context",
									"description": ""
								},
								{
									"key": "x-content-type-options",
									"value": "nosniff",
									"name": "x-content-type-options",
									"description": ""
								},
								{
									"key": "x-frame-options",
									"value": "SAMEORIGIN",
									"name": "x-frame-options",
									"description": ""
								},
								{
									"key": "x-xss-protection",
									"value": "1; mode=block",
									"name": "x-xss-protection",
									"description": ""
								}
							],
							"cookie": [],
							"body": "{\"took\":163,\"hits\":{\"total\":39312,\"hits\":[{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:07.523Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef77676a704aad1562e\",\"value\":{\"NO2\":49,\"O3\":11,\"Town\":\"Paris Centre\",\"PM25\":15,\"PM10\":28,\"CO\":400},\"timestamp\":\"2016-01-13T23:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:07.218Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef7c74a4904a738f524\",\"value\":{\"NO2\":60,\"O3\":6,\"Town\":\"Paris Centre\",\"PM25\":17,\"PM10\":29,\"CO\":400},\"timestamp\":\"2016-01-13T22:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:06.917Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef6c74a4904a738f522\",\"value\":{\"NO2\":64,\"O3\":5,\"Town\":\"Paris Centre\",\"PM25\":17,\"PM10\":31,\"CO\":500},\"timestamp\":\"2016-01-13T21:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:06.621Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef6c74a4904a738f51b\",\"value\":{\"NO2\":66,\"O3\":4,\"Town\":\"Paris Centre\",\"PM25\":15,\"PM10\":26,\"CO\":500},\"timestamp\":\"2016-01-13T20:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:06.315Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef6c74a4904a738f518\",\"value\":{\"NO2\":66,\"O3\":4,\"Town\":\"Paris Centre\",\"PM25\":12,\"PM10\":26,\"CO\":500},\"timestamp\":\"2016-01-13T19:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:06.014Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef6c74a4904a738f513\",\"value\":{\"NO2\":66,\"O3\":4,\"Town\":\"Paris Centre\",\"PM25\":11,\"PM10\":24,\"CO\":500},\"timestamp\":\"2016-01-13T18:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:05.713Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef5c74a4904a738f50e\",\"value\":{\"NO2\":63,\"O3\":7,\"Town\":\"Paris Centre\",\"PM25\":9,\"PM10\":21,\"CO\":400},\"timestamp\":\"2016-01-13T17:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:05.413Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef5c74a4904a738f50b\",\"value\":{\"NO2\":67,\"O3\":11,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":19,\"CO\":400},\"timestamp\":\"2016-01-13T16:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:05.113Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef57676a704aad15628\",\"value\":{\"NO2\":53,\"O3\":24,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":21,\"CO\":300},\"timestamp\":\"2016-01-13T15:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:04.812Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef4c74a4904a738f508\",\"value\":{\"NO2\":51,\"O3\":24,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":22,\"CO\":300},\"timestamp\":\"2016-01-13T14:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:04.512Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef47676a704aad15622\",\"value\":{\"NO2\":50,\"O3\":25,\"Town\":\"Paris Centre\",\"PM25\":9,\"PM10\":26,\"CO\":300},\"timestamp\":\"2016-01-13T13:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:04.212Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef47676a704aad15621\",\"value\":{\"NO2\":48,\"O3\":28,\"Town\":\"Paris Centre\",\"PM25\":10,\"PM10\":25,\"CO\":300},\"timestamp\":\"2016-01-13T12:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:03.911Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef37676a704aad15620\",\"value\":{\"NO2\":53,\"O3\":23,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":22,\"CO\":300},\"timestamp\":\"2016-01-13T11:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:03.693Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef37676a704aad1561f\",\"value\":{\"NO2\":54,\"O3\":22,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":22,\"CO\":300},\"timestamp\":\"2016-01-13T10:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:03.380Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef37676a704aad15618\",\"value\":{\"NO2\":60,\"O3\":17,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":22,\"CO\":300},\"timestamp\":\"2016-01-13T09:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:03.091Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef3c74a4904a738f506\",\"value\":{\"NO2\":71,\"O3\":8,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":21,\"CO\":400},\"timestamp\":\"2016-01-13T08:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:02.785Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef27676a704aad15613\",\"value\":{\"NO2\":71,\"O3\":6,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":18,\"CO\":300},\"timestamp\":\"2016-01-13T07:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:02.477Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef2c74a4904a738f505\",\"value\":{\"NO2\":53,\"O3\":21,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":16,\"CO\":200},\"timestamp\":\"2016-01-13T06:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:02.178Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef27676a704aad15610\",\"value\":{\"NO2\":36,\"O3\":37,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":16,\"CO\":200},\"timestamp\":\"2016-01-13T05:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:01.855Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef1c74a4904a738f502\",\"value\":{\"NO2\":17,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":15,\"CO\":200},\"timestamp\":\"2016-01-13T04:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:01.506Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef1c74a4904a738f4ff\",\"value\":{\"NO2\":13,\"O3\":56,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":15,\"CO\":200},\"timestamp\":\"2016-01-13T03:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:01.223Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef1c74a4904a738f4fc\",\"value\":{\"NO2\":9,\"O3\":63,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":14,\"CO\":200},\"timestamp\":\"2016-01-13T02:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:00.937Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef0c74a4904a738f4fb\",\"value\":{\"NO2\":11,\"O3\":61,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":11,\"CO\":200},\"timestamp\":\"2016-01-13T01:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:00.644Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef0c74a4904a738f4f8\",\"value\":{\"NO2\":19,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":9,\"CO\":200},\"timestamp\":\"2016-01-13T00:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:00.303Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef0c74a4904a738f4f3\",\"value\":{\"NO2\":18,\"O3\":54,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":10,\"CO\":200},\"timestamp\":\"2016-01-12T23:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:12:00.003Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ef0c74a4904a738f4ef\",\"value\":{\"NO2\":22,\"O3\":50,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":10,\"CO\":200},\"timestamp\":\"2016-01-12T22:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:59.703Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eef7676a704aad1560a\",\"value\":{\"NO2\":24,\"O3\":51,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":8,\"CO\":200},\"timestamp\":\"2016-01-12T21:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:59.401Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eef7676a704aad15609\",\"value\":{\"NO2\":24,\"O3\":50,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":11,\"CO\":200},\"timestamp\":\"2016-01-12T20:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:59.099Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eefc74a4904a738f4ec\",\"value\":{\"NO2\":31,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":9,\"PM10\":15,\"CO\":200},\"timestamp\":\"2016-01-12T19:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:58.802Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeec74a4904a738f4ea\",\"value\":{\"NO2\":41,\"O3\":38,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":15,\"CO\":200},\"timestamp\":\"2016-01-12T18:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:58.498Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eee7676a704aad15605\",\"value\":{\"NO2\":41,\"O3\":37,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":14,\"CO\":200},\"timestamp\":\"2016-01-12T17:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:58.197Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeec74a4904a738f4e7\",\"value\":{\"NO2\":49,\"O3\":30,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":14,\"CO\":200},\"timestamp\":\"2016-01-12T16:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:57.896Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eed7676a704aad15603\",\"value\":{\"NO2\":41,\"O3\":38,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":13,\"CO\":200},\"timestamp\":\"2016-01-12T15:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:57.594Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eedc74a4904a738f4e6\",\"value\":{\"NO2\":34,\"O3\":45,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":16,\"CO\":200},\"timestamp\":\"2016-01-12T14:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:57.294Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eed7676a704aad15600\",\"value\":{\"NO2\":36,\"O3\":40,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":15,\"CO\":200},\"timestamp\":\"2016-01-12T13:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:56.994Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eec7676a704aad155fd\",\"value\":{\"NO2\":34,\"O3\":42,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":10,\"CO\":200},\"timestamp\":\"2016-01-12T12:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:56.693Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eec7676a704aad155fa\",\"value\":{\"NO2\":34,\"O3\":37,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":11,\"CO\":200},\"timestamp\":\"2016-01-12T11:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:56.391Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eec7676a704aad155f7\",\"value\":{\"NO2\":43,\"O3\":29,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":10,\"CO\":200},\"timestamp\":\"2016-01-12T10:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:56.091Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eec7676a704aad155f4\",\"value\":{\"NO2\":48,\"O3\":23,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-12T09:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:55.790Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeb7676a704aad155ef\",\"value\":{\"NO2\":54,\"O3\":17,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":9,\"CO\":300},\"timestamp\":\"2016-01-12T08:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:55.489Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeb7676a704aad155ee\",\"value\":{\"NO2\":55,\"O3\":15,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-12T07:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:55.186Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eebc74a4904a738f4e0\",\"value\":{\"NO2\":49,\"O3\":17,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":8,\"CO\":200},\"timestamp\":\"2016-01-12T06:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:54.895Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeac74a4904a738f4df\",\"value\":{\"NO2\":30,\"O3\":35,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":6,\"CO\":200},\"timestamp\":\"2016-01-12T05:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:54.588Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeac74a4904a738f4dc\",\"value\":{\"NO2\":15,\"O3\":45,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":4,\"CO\":200},\"timestamp\":\"2016-01-12T04:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:54.285Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eeac74a4904a738f4d7\",\"value\":{\"NO2\":12,\"O3\":49,\"Town\":\"Paris Centre\",\"PM25\":1,\"PM10\":5,\"CO\":200},\"timestamp\":\"2016-01-12T03:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:53.985Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee9c74a4904a738f4d6\",\"value\":{\"NO2\":12,\"O3\":52,\"Town\":\"Paris Centre\",\"PM25\":0,\"PM10\":4,\"CO\":100},\"timestamp\":\"2016-01-12T02:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:53.683Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee9c74a4904a738f4d3\",\"value\":{\"NO2\":12,\"O3\":52,\"Town\":\"Paris Centre\",\"PM25\":1,\"PM10\":3,\"CO\":100},\"timestamp\":\"2016-01-12T01:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:53.381Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee9c74a4904a738f4d0\",\"value\":{\"NO2\":14,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":6,\"CO\":100},\"timestamp\":\"2016-01-12T00:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:53.081Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee9c74a4904a738f4cd\",\"value\":{\"NO2\":21,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":200},\"timestamp\":\"2016-01-11T23:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:52.780Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee8c74a4904a738f4ca\",\"value\":{\"NO2\":24,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":200},\"timestamp\":\"2016-01-11T22:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:52.479Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee87676a704aad155e5\",\"value\":{\"NO2\":23,\"O3\":55,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":8,\"CO\":200},\"timestamp\":\"2016-01-11T21:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:52.293Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee8c74a4904a738f4c8\",\"value\":{\"NO2\":28,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":10,\"CO\":300},\"timestamp\":\"2016-01-11T20:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:51.965Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee77676a704aad155e1\",\"value\":{\"NO2\":34,\"O3\":45,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":11,\"CO\":300},\"timestamp\":\"2016-01-11T19:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:51.649Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee77676a704aad155e0\",\"value\":{\"NO2\":44,\"O3\":38,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":11,\"CO\":300},\"timestamp\":\"2016-01-11T18:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:51.361Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee77676a704aad155da\",\"value\":{\"NO2\":48,\"O3\":35,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":10,\"CO\":300},\"timestamp\":\"2016-01-11T17:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:50.982Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee67676a704aad155d7\",\"value\":{\"NO2\":42,\"O3\":40,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-11T16:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:50.674Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee67676a704aad155d6\",\"value\":{\"NO2\":36,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":10,\"CO\":200},\"timestamp\":\"2016-01-11T15:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:50.373Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee67676a704aad155d5\",\"value\":{\"NO2\":33,\"O3\":51,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-11T14:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:50.072Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee67676a704aad155d4\",\"value\":{\"NO2\":34,\"O3\":51,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-11T13:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:49.771Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee5c74a4904a738f4c4\",\"value\":{\"NO2\":33,\"O3\":53,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-11T12:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:49.473Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee57676a704aad155d1\",\"value\":{\"NO2\":44,\"O3\":41,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-11T11:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:49.169Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee5c74a4904a738f4c3\",\"value\":{\"NO2\":44,\"O3\":40,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-11T10:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:48.868Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee47676a704aad155cc\",\"value\":{\"NO2\":43,\"O3\":40,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-11T09:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:48.569Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee47676a704aad155c9\",\"value\":{\"NO2\":50,\"O3\":33,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":7,\"CO\":400},\"timestamp\":\"2016-01-11T08:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:48.266Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee4c74a4904a738f4bd\",\"value\":{\"NO2\":60,\"O3\":26,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":4,\"CO\":400},\"timestamp\":\"2016-01-11T07:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:47.964Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee3c74a4904a738f4bc\",\"value\":{\"NO2\":54,\"O3\":29,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":5,\"CO\":400},\"timestamp\":\"2016-01-11T06:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:47.663Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee3c74a4904a738f4bb\",\"value\":{\"NO2\":43,\"O3\":36,\"Town\":\"Paris Centre\",\"PM25\":1,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-11T05:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:47.363Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee3c74a4904a738f4ba\",\"value\":{\"NO2\":17,\"O3\":56,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":5,\"CO\":300},\"timestamp\":\"2016-01-11T04:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:47.062Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee3c74a4904a738f4b9\",\"value\":{\"NO2\":14,\"O3\":54,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-11T03:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:46.763Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee2c74a4904a738f4b4\",\"value\":{\"NO2\":15,\"O3\":49,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-11T02:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:46.460Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee2c74a4904a738f4b3\",\"value\":{\"NO2\":17,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":9,\"CO\":300},\"timestamp\":\"2016-01-11T01:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:46.159Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee2c74a4904a738f4b2\",\"value\":{\"NO2\":22,\"O3\":41,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":11,\"CO\":300},\"timestamp\":\"2016-01-11T00:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:45.919Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee1c74a4904a738f4b1\",\"value\":{\"NO2\":36,\"O3\":32,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":11,\"CO\":400},\"timestamp\":\"2016-01-10T23:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:45.555Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee1c74a4904a738f4b0\",\"value\":{\"NO2\":42,\"O3\":30,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":12,\"CO\":400},\"timestamp\":\"2016-01-10T22:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:45.304Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee1c74a4904a738f4ae\",\"value\":{\"NO2\":44,\"O3\":33,\"Town\":\"Paris Centre\",\"PM25\":10,\"PM10\":14,\"CO\":400},\"timestamp\":\"2016-01-10T21:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:44.988Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee0c74a4904a738f4ac\",\"value\":{\"NO2\":46,\"O3\":34,\"Town\":\"Paris Centre\",\"PM25\":9,\"PM10\":12,\"CO\":400},\"timestamp\":\"2016-01-10T20:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:44.680Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee07676a704aad155c4\",\"value\":{\"NO2\":46,\"O3\":35,\"Town\":\"Paris Centre\",\"PM25\":9,\"PM10\":9,\"CO\":400},\"timestamp\":\"2016-01-10T19:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:44.401Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee07676a704aad155c3\",\"value\":{\"NO2\":49,\"O3\":37,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":11,\"CO\":300},\"timestamp\":\"2016-01-10T18:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:44.078Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ee0c74a4904a738f4a6\",\"value\":{\"NO2\":46,\"O3\":41,\"Town\":\"Paris Centre\",\"PM25\":7,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-10T17:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:43.761Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edf7676a704aad155bb\",\"value\":{\"NO2\":56,\"O3\":33,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-10T16:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:43.482Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edf7676a704aad155ba\",\"value\":{\"NO2\":47,\"O3\":38,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":4,\"CO\":300},\"timestamp\":\"2016-01-10T15:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:43.164Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edf7676a704aad155b5\",\"value\":{\"NO2\":33,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":4,\"CO\":300},\"timestamp\":\"2016-01-10T14:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:42.848Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ede7676a704aad155b0\",\"value\":{\"NO2\":30,\"O3\":50,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-10T13:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:42.548Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ede7676a704aad155ae\",\"value\":{\"NO2\":32,\"O3\":46,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-10T12:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:42.246Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ede7676a704aad155ad\",\"value\":{\"NO2\":30,\"O3\":45,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":12,\"CO\":300},\"timestamp\":\"2016-01-10T11:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:41.951Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eddc74a4904a738f4a2\",\"value\":{\"NO2\":33,\"O3\":39,\"Town\":\"Paris Centre\",\"PM25\":6,\"PM10\":11,\"CO\":300},\"timestamp\":\"2016-01-10T10:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:41.646Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edd7676a704aad155ac\",\"value\":{\"NO2\":33,\"O3\":38,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":10,\"CO\":300},\"timestamp\":\"2016-01-10T09:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:41.345Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edd7676a704aad155ab\",\"value\":{\"NO2\":36,\"O3\":39,\"Town\":\"Paris Centre\",\"PM25\":4,\"PM10\":9,\"CO\":300},\"timestamp\":\"2016-01-10T08:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:41.045Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edd7676a704aad155aa\",\"value\":{\"NO2\":28,\"O3\":47,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-10T07:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:40.744Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edc7676a704aad155a6\",\"value\":{\"NO2\":25,\"O3\":51,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":7,\"CO\":300},\"timestamp\":\"2016-01-10T06:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:40.451Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edcc74a4904a738f49c\",\"value\":{\"NO2\":19,\"O3\":58,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":9,\"CO\":200},\"timestamp\":\"2016-01-10T05:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:40.142Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edcc74a4904a738f497\",\"value\":{\"NO2\":19,\"O3\":60,\"Town\":\"Paris Centre\",\"PM25\":1,\"PM10\":8,\"CO\":300},\"timestamp\":\"2016-01-10T04:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:39.842Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edbc74a4904a738f494\",\"value\":{\"NO2\":21,\"O3\":59,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":7,\"CO\":200},\"timestamp\":\"2016-01-10T03:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:39.542Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edbc74a4904a738f48f\",\"value\":{\"NO2\":20,\"O3\":66,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":6,\"CO\":200},\"timestamp\":\"2016-01-10T02:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:39.241Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edbc74a4904a738f48e\",\"value\":{\"NO2\":21,\"O3\":64,\"Town\":\"Paris Centre\",\"PM25\":3,\"PM10\":9,\"CO\":200},\"timestamp\":\"2016-01-10T01:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:38.942Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eda7676a704aad155a5\",\"value\":{\"NO2\":25,\"O3\":56,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":5,\"CO\":200},\"timestamp\":\"2016-01-10T00:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:38.642Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eda7676a704aad155a4\",\"value\":{\"NO2\":30,\"O3\":56,\"Town\":\"Paris Centre\",\"PM25\":2,\"PM10\":6,\"CO\":300},\"timestamp\":\"2016-01-09T23:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:38.339Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5edac74a4904a738f48b\",\"value\":{\"NO2\":27,\"O3\":59,\"Town\":\"Paris Centre\",\"PM25\":5,\"PM10\":3,\"CO\":300},\"timestamp\":\"2016-01-09T22:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:38.039Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5eda7676a704aad155a2\",\"value\":{\"NO2\":24,\"O3\":55,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":9,\"CO\":300},\"timestamp\":\"2016-01-09T21:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}},{\"_source\":{\"metadata\":{\"connector\":\"mqtt\",\"source\":\"TESTFLG-PUSHAirParif\"},\"streamId\":\"StreamPushAirParif\",\"created\":\"2017-10-11T18:11:37.737Z\",\"location\":null,\"model\":\"SampleAirParif03\",\"id\":\"59de5ed9c74a4904a738f489\",\"value\":{\"NO2\":35,\"O3\":40,\"Town\":\"Paris Centre\",\"PM25\":8,\"PM10\":17,\"CO\":300},\"timestamp\":\"2016-01-09T20:00:00Z\",\"tags\":[\"SampleAirParif.03\"]}}]},\"aggregations\":{\"percent rank PM10\":{\"values\":{\"10.0\":12.39061864061864,\"50.0\":94.34269434269434,\"100.0\":99.73544973544973,\"150.0\":99.99127856270714,\"200.0\":100.0,\"1000.0\":100.0}},\"stats_CO\":{\"count\":39312,\"min\":0.0,\"max\":2000.0,\"avg\":245.55860805860806,\"sum\":9653400.0},\"percent PM10\":{\"values\":{\"1.0\":0.0,\"5.0\":4.426595744680855,\"25.0\":14.052529182879377,\"50.0\":21.0,\"75.0\":29.90359477124183,\"95.0\":52.0,\"99.0\":77.0}},\"percent rank PM25\":{\"values\":{\"10.0\":46.05972730972731,\"50.0\":97.82254782254782,\"100.0\":99.92623117623117,\"150.0\":100.0,\"200.0\":100.0,\"1000.0\":100.0}},\"stats_PM10\":{\"count\":39312,\"min\":0.0,\"max\":166.0,\"avg\":23.60938135938136,\"sum\":928132.0}}}"
						}
					]
				}
			],
			"description": "The data zone contains 2 databases for 2 services :\r\n- a storage service that relies on a timeseries database (Mongo Db). The data are indexed by their timestamp and their streamId\r\n- a search service that relies on an indexed database (Elastic Search). The indexed data must follow the Live Objects data model for MQTT payloads or must have been decoded (from Lora or SMS payload)\r\n\r\nSee the Live Objects technical documentation for further elements.\r\n\r\nThis collection will show requests on both databases.\r\n",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "8937e3d2-bffc-4aec-9469-cab90545f598",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "f7d2a274-bbbc-4300-a629-74abd2d9d0ad",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				}
			]
		},
		{
			"name": "Rule Engine",
			"item": [
				{
					"name": "Matching rules",
					"item": [
						{
							"name": "Create a simple MatchingRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n  \"dataPredicate\": \n\n  {\n    \">\": [\n        {\n            \"var\": \"value.temperature\"\n        },\n        20\n    ]\n  },\n  \"enabled\": true,\n  \"name\": \"Test temperature > 20\"\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								},
								"description": "Create a simple matching rule on 1 criteria"
							},
							"response": []
						},
						{
							"name": "Create a multi-criteria MatchingRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n  \"dataPredicate\": \n\n  {\n  \"and\":\n    [\n      {\n          \"<\": [\n              {\n                  \"var\": \"value.hygrometry\"\n              },\n              80\n          ]\n      },\n      {\n          \">\": [\n              {\n                  \"var\": \"value.temperature\"\n              },\n              20\n          ]\n      }\n  \n    ]\n  },\n  \"enabled\": true,\n  \"name\": \"Test hygro < 80 && temp > 20\"\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								},
								"description": "Create a matching rule on 2 different data fields"
							},
							"response": []
						},
						{
							"name": "Retrieve the list of MatchingRules for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Delete a MatchingRule",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/x-www-form-urlencoded",
										"disabled": true
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/e97cde01-6040-4318-a477-f0f67547b71a",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule",
										"e97cde01-6040-4318-a477-f0f67547b71a"
									]
								},
								"description": "Put the matching rule Id into the request, here its Id is \"e97cde01-6040-4318-a477-f0f67547b71a\" : \nhttps://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule/e97cde01-6040-4318-a477-f0f67547b71a"
							},
							"response": []
						}
					],
					"description": "Creating a matching rule is the first step for creating an Event. </p>\nHere we will create/udate/delete a matching rule on a MQTT data that contains the following fields : </p>\n   \"value\": {</p>\n      \"revmin\": 8006,</p>\n      \"temperature\": 62,</p>\n      \"hygrometry\": 13</p>\n   },</p>\n   </p>\nIn the next step we will define a Firing Rule (see the related directory) which will manage the related triggering event. </p>\nThen in the 'Event to action section' we will binf the event to a Fifo in order to allow a Business Application using MQTT to subscribe and collect the event.",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "d91c48e5-4a55-4c02-b24e-d2fd23a36b9c",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "0896fd91-42b6-4f4d-bd44-b6e91d48bd4d",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Firing Rules",
					"item": [
						{
							"name": "Create a new FiringRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"name\": \"testFR0StreamSample02\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"e97cde01-6040-4318-a477-f0f67547b71a\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								},
								"description": "Create a Firing rule that ALWAYS triggers the \"e97cde01-6040-4318-a477-f0f67547b71a\" Matching Rule <br>\nIn order to generate events you need to define how it will be triggered : ALWAYS, ONCE or SLEEP <br>\nIn order to collect an event from a business application go to the 'Event to actions' section <br>"
							},
							"response": []
						},
						{
							"name": "Retrieve the list of FiringRule for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Delete a FiringRule",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/x-www-form-urlencoded",
										"disabled": true
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": [
										{
											"key": "firingRuleId",
											"value": "23720f78-458b-4d20-bea0-7562474d83c0",
											"type": "text",
											"disabled": true
										},
										{
											"key": "X-API-KEY",
											"value": "a9693915fac54fba85a646def7b0c42a",
											"type": "text",
											"disabled": true
										},
										{
											"key": "Content-Type",
											"value": "application/json",
											"type": "text",
											"disabled": true
										}
									]
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/d8b3ba30-e1fb-42fc-a176-34780682ed00",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule",
										"d8b3ba30-e1fb-42fc-a176-34780682ed00"
									]
								},
								"description": "Put the matching rule Id into the request, here its Id is \"d8b3ba30-e1fb-42fc-a176-34780682ed00\" : https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/d8b3ba30-e1fb-42fc-a176-34780682ed00"
							},
							"response": []
						},
						{
							"name": "Update a FiringRule to ALWAYS",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"aggregationKeys\": [\r\n  \"metadata.source\"\r\n  ],\r\n  \"enabled\": false,\r\n  \"firingType\": \"ALWAYS\",\r\n  \"id\": \"b87900ce-16f8-4b37-a723-78d23635ab10\",\r\n  \"matchingRuleIds\": [\r\n    \"31826629-94a5-410c-ad6d-4c201ce47330\"\r\n  ],\r\n  \"name\": \"Test hygro < 80 && temp > 20\"\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/b87900ce-16f8-4b37-a723-78d23635ab10",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule",
										"b87900ce-16f8-4b37-a723-78d23635ab10"
									]
								},
								"description": "Here we disable the Firing rule (\"enabled\" : false) and update its name.\n\nPut the firing rule Id into the request, here its Id is \"b87900ce-16f8-4b37-a723-78d23635ab10\" : https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/b87900ce-16f8-4b37-a723-78d23635ab10"
							},
							"response": []
						}
					],
					"description": "A firing rule will define the triggering mode of matching rules : </p>\n- ALWAY : each time the received data matches the matching rules  </p>\n- ONCE : trigger once then need to be rearmed </p>\n- SLEEP : triggers once per period - a duration specifies the minimum time between two fired events  </p>\n </p>\nIn this collection we will create/update/delete Firing rules\n\nIn order to catch the triggered events from a business application, you can either \n- create a Fifo into the Portal (you can also use APIs), bind it to the event (see 'Event to action' section) and use a MQTT client (with 'application' user name) which will subscribe to the Fifo. Note : the 'payload+bridge' user name and the topic router/~event/v1/data/eventprocessing/fired will be deprecated end 2019.\n- use the push http feature (see 'Event to Action - Push Http' section)",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "4ee4ff0d-b52d-44a8-8d89-ea87641355d4",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "f2b80441-7fd0-42f7-a373-ecf0f774e424",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Firing Guard",
					"item": [
						{
							"name": "Update a FiringRule to \"ONCE\"",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"aggregationKeys\": [\r\n  \"metadata.source\"\r\n  ],\r\n  \"enabled\": true,\r\n  \"firingType\": \"ONCE\",\r\n  \"id\": \"b87900ce-16f8-4b37-a723-78d23635ab10\",\r\n  \"matchingRuleIds\": [\r\n    \"31826629-94a5-410c-ad6d-4c201ce47330\"\r\n  ],\r\n  \"name\": \"Test hygro < 80 && temp > 20\"\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/b87900ce-16f8-4b37-a723-78d23635ab10",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule",
										"b87900ce-16f8-4b37-a723-78d23635ab10"
									]
								},
								"description": "Here we set the Firing rule's firing type to \"ONCE\" and we enable it.\n\nPut the firing rule Id into the request, here its Id is \"b87900ce-16f8-4b37-a723-78d23635ab10\" : https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/b87900ce-16f8-4b37-a723-78d23635ab10"
							},
							"response": []
						},
						{
							"name": "Get FiringGuards linked to a FiringRule, and where FiringGuards selection criteria match.",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"firingRuleId\": \"b87900ce-16f8-4b37-a723-78d23635ab10\",\r\n  \"selectionCriteria\":[\r\n  {\r\n    \"keyPath\":\"data.streamId\",\r\n    \"value\":\"android357329073120059PRIMARY\"\r\n  }\r\n  ]\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-guard/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-guard",
										"search"
									]
								},
								"description": "Get the list of Firing guards of the Firing rule \"b87900ce-16f8-4b37-a723-78d23635ab10\", filtered with the streamId android357329073120059\"\n\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Get FiringGuards linked to a FiringRule, and where FiringGuards selection criteria match (Stream Id : android357329073120059PRIMARY).",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"firingRuleId\": \"b87900ce-16f8-4b37-a723-78d23635ab10\",\r\n  \"selectionCriteria\":[\r\n  {\r\n    \"keyPath\":\"data.streamId\",\r\n    \"value\":\"android357329073120059\"\r\n  }\r\n  ]\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-guard/search",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-guard",
										"search"
									]
								},
								"description": "Get the list of Firing guards of the Firing rule \"b87900ce-16f8-4b37-a723-78d23635ab10\", filtered with the streamId android357329073120059PRIMARY\"\n\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Remove a FiringGuard from its id",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-guard/b87900ce-16f8-4b37-a723-78d23635ab10-1394f6887af479415d7f92bd54261f08",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-guard",
										"b87900ce-16f8-4b37-a723-78d23635ab10-1394f6887af479415d7f92bd54261f08"
									]
								},
								"description": "Removing the firing guard enable the event to trigger \"ONCE\" more\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "Firing Guard are used with the Firing rules that have a firingType at \"ONCE\". \nEach time an event is triggered, a Firing Guard is set to disable new event triggering.\nBy deleting a firing Guard, you anable the related Firing rule to trigger an event.",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "969380f6-f5c0-4221-bec8-3a6e48d67fd9",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "e8632798-10b5-4384-b47d-4ea2ea6a4d17",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "State Processing",
					"item": [
						{
							"name": "Create a new StateProcessingRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n        \"name\": \"temperature state rule\",\r\n        \"enabled\": true,\r\n        \"stateKeyPath\": \"streamId\",\r\n        \"stateFunction\": {\r\n                \"if\": [{\r\n                        \"<\": [{\r\n                                \"var\": \"value.temperature\"\r\n                        },\r\n                        0]\r\n                },\r\n                \"cold\",\r\n                {\r\n                        \"<\": [{\r\n                                \"var\": \"value.temperature\"\r\n                        },\r\n                        60]\r\n                },\r\n                \"normal\",\r\n                \"hot\"]\r\n        }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule"
									]
								},
								"description": "Creates a temperature State processing logic with 3 states :</p>\n    <li>if temperature is below 0 degree Celsius, sensor state is cold.</li>\n    <li>if temperature is between 0 and 60 degrees Celsius sensor state is normal.</li>\n    <li>if temperature is higher than 100 degrees Celsius sensor state is hot.</li>\n</p>\nIn order to collect an event from a business application go to the 'Event to actions' section <br>\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Create a new Location StateProcessingRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n        \"name\": \"temperature state rule\",\r\n        \"enabled\": true,\r\n        \"stateKeyPath\": \"streamId\",\r\n        \"stateFunction\": {\r\n            \"if\": [\r\n                {\r\n                    \"<\": [\r\n                        {\r\n                            \"distance\": [\r\n                                {\r\n                                    \"var\": \"lon\"\r\n                                },\r\n                                {\r\n                                    \"var\": \"lat\"\r\n                                },\r\n                                {\r\n                                    \"currentstate\": []\r\n                                }\r\n                            ]\r\n                        },\r\n                        1000\r\n                    ]\r\n                },\r\n                {\r\n                    \"currentstate\": []\r\n                },\r\n                {\r\n                    \"var\": \"location\"\r\n                }\r\n            ]\r\n        }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule"
									]
								},
								"description": "Creates a temperature State processing logic following the distance between the previous and the current location</p>\n    <li>if the distance between the previous and the new location is < 1000 then no state change.</li>\n    <li>else a state change is triggered.</li>\n</p>\nIn order to collect an event from a business application go to the 'Event to actions' section <br>\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Retrieve the list of all the StateProcessingRules or get a StateProcessingRule by its name",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json",
										"disabled": true
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule"
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Delete a StateProcessingRule",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule/3c6184c4-d64a-4106-8f4f-70fd5771e499",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule",
										"3c6184c4-d64a-4106-8f4f-70fd5771e499"
									]
								},
								"description": "Put the rule Id into the request, here its Id is \"3c6184c4-d64a-4106-8f4f-70fd5771e499\" : https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule/3c6184c4-d64a-4106-8f4f-70fd5771e499 </p>\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Update a StateProcessingRule",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n        \"id\":\"5dd059d6-19c0-4150-a054-cca11cdf9134\",\r\n        \"name\": \"temperature state rule\",\r\n        \"enabled\": false,\r\n        \"stateKeyPath\": \"streamId\",\r\n        \"stateFunction\": {\r\n                \"if\": [{\r\n                        \"<\": [{\r\n                                \"var\": \"value.temperature\"\r\n                        },\r\n                        0]\r\n                },\r\n                \"cold\",\r\n                {\r\n                        \"<\": [{\r\n                                \"var\": \"value.temperature\"\r\n                        },\r\n                        60]\r\n                },\r\n                \"normal\",\r\n                \"hot\"]\r\n        }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule/5dd059d6-19c0-4150-a054-cca11cdf9134",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule",
										"5dd059d6-19c0-4150-a054-cca11cdf9134"
									]
								},
								"description": "Disable the State processing rule \n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Update a Location StateProcessingRule",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n        \"id\":\"4afd2cea-7ddf-4077-a7d5-a32b6b103d49\",\r\n        \"name\": \"Location state rule\",\r\n        \"enabled\": false,\r\n        \"stateKeyPath\": \"streamId\",\r\n        \"stateFunction\": {\r\n            \"if\": [\r\n                {\r\n                    \"<\": [\r\n                        {\r\n                            \"distance\": [\r\n                                {\r\n                                    \"var\": \"lon\"\r\n                                },\r\n                                {\r\n                                    \"var\": \"lat\"\r\n                                },\r\n                                {\r\n                                    \"currentstate\": []\r\n                                }\r\n                            ]\r\n                        },\r\n                        1000\r\n                    ]\r\n                },\r\n                {\r\n                    \"currentstate\": []\r\n                },\r\n                {\r\n                    \"var\": \"location\"\r\n                }\r\n            ]\r\n        }\r\n\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/stateprocessing-rule/4afd2cea-7ddf-4077-a7d5-a32b6b103d49",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"stateprocessing-rule",
										"4afd2cea-7ddf-4077-a7d5-a32b6b103d49"
									]
								},
								"description": "Disable the State processing rule \n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "State processing (SP) service aims at detecting changes in \"device state\" computed from data messages.\r\n\r\nIn order to catch the triggered events from a business application, you can either \r\n- create a Fifo into the Portal (you can also use APIs), bind it to the event (see 'Event to action' section) and use a MQTT client (with 'application' user name) which will subscribe to the Fifo. Note : the 'payload+bridge' user name and the topic router/~event/v1/data/eventprocessing/statechange will be deprecated end 2019.\r\n- use the push http feature (see 'Event to Action - Push Http' section)\r\n\r\n",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "c258b3e7-2cd2-4ca8-99a2-472b39978138",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "8a320d33-d891-41b7-a973-61ba0b63428d",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Activity Rules",
					"item": [
						{
							"name": "Create a new ActivityRule for silent devices",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n  \"enabled\": true,\n  \"name\": \"android357329073120059PRIMARY\",\n  \"silentPolicy\": {\n    \"duration\": \"PT1M\",\n    \"repeatInterval\": \"P1DT12H\"\n  },\n  \"tags\": [\n    \"tagTestActivity\"\n  ],\n  \"targets\": {\n    \"deviceIds\": [\n      \"urn:lo:nsid:android:357329073120059PRIMARY\"\n    ],\n    \"groupPaths\": [\n      {\n        \"includeSubPath\": true,\n        \"path\": \"/France\"\n      }\n    ]\n  }\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/activity/rules",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"activity",
										"rules"
									]
								},
								"description": "Trigger an event if the following devices don't send data during 1 mn:\n- urn:lo:nsid:android:357329073120059PRIMARY\n- all the devices into the /France group and under it\nRepeat this event every 1,5 day.<br>\n\nIn order to collect an event from a business application go to the 'Event to actions' section <br>\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Retrieve the list of all the ActivityRules",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/activity/rules",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"activity",
										"rules"
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Update an ActivityRule",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n    \"id\": \"3aeff407-82f0-455c-8baf-38e448d85212\",\n    \"name\": \"android357329073120059PRIMARY\",\n    \"targets\": {\n        \"deviceIds\": [\n            \"urn:lo:nsid:android:357329073120059PRIMARY\"\n        ],\n        \"groupPaths\": [\n            {\n                \"path\": \"/demo\",\n                \"includeSubPath\": true\n            }\n        ]\n    },\n    \"silentPolicy\": {\n        \"duration\": \"PT1M\",\n        \"repeatInterval\": \"PT10M\"\n    },\n    \"tags\": [\n        \"tagTestActivity\"\n    ],\n    \"enabled\": false\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/activity/rules/3aeff407-82f0-455c-8baf-38e448d85212",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"activity",
										"rules",
										"3aeff407-82f0-455c-8baf-38e448d85212"
									]
								},
								"description": "Change the parameters of the triggering rule. \nHere we will change the repeat period to 10mn and set it to disable.\n\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "This collection describes the management of the device activity. This feature allows you to detect \"silent devices\" : it will trigger the following events : \n- \"SILENT\" if a device does not send data during a defined period \n- \"ACTIVE\" when the device talk again\n\n\nIn order to catch the triggered events from a business application, you can either \n- create a Fifo into the Portal (you can also use APIs), bind it to the event (see 'Event to action' section) and use a MQTT client (with 'application' user name) which will subscribe to the Fifo. Note : the 'payload+bridge' user name and the topic  on the router/~event/v1/data/eventprocessing/device-activity will be deprecated end 2019.\n- use the push http feature (see 'Event to Action - Push Http' section)",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "08ad2dd2-5666-4675-8ba8-cfa18dc98c05",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "9b887ba0-383e-4c07-8e2d-47f5311a8096",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Event to actions",
					"item": [
						{
							"name": "Create a new action policy: bind a firing rule to a Fifo",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Bind 'Test hygro < 80 && temp > 20' firing rule to eventFifo\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n\t\t\"fifoPublish\": [\r\n\t\t\t{\r\n\t\t\t\t\"fifoName\": \"eventFifo\" \r\n\t\t\t}\r\n\t\t]\r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "A Business application using a MQTTclient (user name : 'application') must subscribe to Fifo to collect triggered events. Therefore you need to create a Fifo (use the portal, here we have created 'eventFifo') and bind it to the firing rule related event (here : \"b87900ce-16f8-4b37-a723-78d23635ab10\")."
							},
							"response": []
						},
						{
							"name": "Create a new action policy: bind a state rule to a Fifo",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Bind 'temperature state rule' state rule to stateTempFifo\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"5dd059d6-19c0-4150-a054-cca11cdf9134\"]\r\n    },\r\n    \"actions\": {\r\n\t\t\"fifoPublish\": [\r\n\t\t\t{\r\n\t\t\t\t\"fifoName\": \"stateTempFifo\" \r\n\t\t\t}\r\n\t\t]\r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "A Business application using a MQTTclient (user name : 'application') must subscribe to Fifo to collect triggered events. Therefore you need to create a Fifo (use the portal, here wa have created 'stateTempFifo') and bind it to the state change related event (here : \"5dd059d6-19c0-4150-a054-cca11cdf9134\")."
							},
							"response": []
						},
						{
							"name": "Create a new action policy: bind an activity rule to a Fifo Copy",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Bind 'android357329073120059PRIMARY' activity rule to activityFifo\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"3aeff407-82f0-455c-8baf-38e448d85212\"]\r\n    },\r\n    \"actions\": {\r\n\t\t\"fifoPublish\": [\r\n\t\t\t{\r\n\t\t\t\t\"fifoName\": \"activityFifo\" \r\n\t\t\t}\r\n\t\t]\r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "A Business application using a MQTTclient (user name : 'application') must subscribe to Fifo to collect triggered events. Therefore you need to create a Fifo (use the portal, here we have created 'activityFifo') and bind it to the firing rule related event (here : \"3aeff407-82f0-455c-8baf-38e448d85212\")."
							},
							"response": []
						},
						{
							"name": "Create a new action policy: send Mail & SMS from 'Test hygro < 80 && temp > 20' firing rule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test EventToAction app Android\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [{\"cc\": [\"franck.lelong@orange.fr\"], \"cci\": [], \"to\": [\"franck.lelong@orange.com\"],\r\n        \"subjectTemplate\": \"Hygro < 80 && Temp > 20\",\r\n        \"contentTemplate\": \"seuil dépassé. <br/> Localisation GPS : {{matchingContext.data.location}} <br/> Temperature {{matchingContext.data.value.temperature}} <br/> Hygrometry {{matchingContext.data.value.hygrometry}}\"\r\n        }],\r\n       \"sms\": [{\r\n            \"destinationPhoneNumbers\": [\"+33607681808\"],\r\n            \"contentTemplate\": \"seuil dépassé. Localisation GPS : {{matchingContext.data.location}}, temperature {{matchingContext.data.value.temperature}}\"\r\n        }]  \r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "Creates a new action policy related to one Firing rule (here : \"b87900ce-16f8-4b37-a723-78d23635ab10\"). \nThis policy makes 2 action \n- 1 mail to xx.yy@orange.fr and zz.tt@orange.fr\n- 1 sms to +33612345678\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "List action policies",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies?size=20&page=0",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										}
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Delete an action policy",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/201617b4-5eac-4c5f-9346-eff26ca4a50f",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"201617b4-5eac-4c5f-9346-eff26ca4a50f"
									]
								},
								"description": "Put the Action Id into the request, here its Id is \"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a <br>\nRestricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Update the action policy ' Mail & SMS'",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test EventToAction app Android updated\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [{\"cc\": [], \"cci\": [], \"to\": [\"franck.lelong@orange.com\", \"franck.lelong@orange.fr\"],\r\n        \"subjectTemplate\": \"Hygro < 80 && Temp > 20\",\r\n        \"contentTemplate\": \"Threshold exceeded. <br/> - Temperature: {{matchingContext.data.value.temperature}} <br/> - Hygrometry: {{matchingContext.data.value.hygrometry}} <br/> <br/> - GPS Location: {{matchingContext.data.location}} <br/> <img width=\\\"300\\\" src=\\\"https://maps.googleapis.com/maps/api/staticmap?center={{matchingContext.data.location.lat}},{{matchingContext.data.location.lon}}&zoom=15&size=300x300&markers=color:red%7Clabel:A%7C{{matchingContext.data.location.lat}},{{matchingContext.data.location.lon}}\\\"> <br/> <p> https://www.google.fr/maps/@{{matchingContext.data.location.lat}},{{matchingContext.data.location.lon}},13z </p>\" \r\n        }],\r\n       \"sms\": [{\r\n            \"destinationPhoneNumbers\": [\"+33671278017\"],\r\n            \"contentTemplate\": \"Seuil dépassé Hygro < 80 && Temp > 20\"\r\n        }]  \r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/fc370fdd-fae4-406b-9920-2284f2b50353",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"fc370fdd-fae4-406b-9920-2284f2b50353"
									]
								},
								"description": "Update the action policy by adding into the the mail body a google map related to the device location.<br>\n\nIt is possible to temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "The Event to actions function links fired events to \n- actions : mail, SMS, push Http (see section 'Event to Action - Push Http')\n- Fifo which can be collected from Business Application MQTT clients (user name : 'application')",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "926c8990-f34a-4ffe-8eb6-d5849182692f",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "11cb8522-a561-4dfe-8b2f-1e7734cc20aa",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Event to Action - Push Http",
					"item": [
						{
							"name": "Push all data to IFTTT - Create a new push http Event to action",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n        \t\"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n\t\t\t\"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n\t\t\t\"retryOnFailure\": true,\r\n\t\t\t\"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "Creates a new action policy that will send all the received data to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry \n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Update action policy push http to IFTTT for all data",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n        \t\"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n\t\t\t\"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n\t\t\t\"retryOnFailure\": true,\r\n\t\t\t\"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"46d1be3e-af61-45e3-a5bc-fc36ec75a909"
									]
								},
								"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"46d1be3e-af61-45e3-a5bc-fc36ec75a909\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Push triggered event related data to IFTTT - Create a new push http Event to action",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"        }]  \r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "Creates a new action policy that will push the data that have triggered an event to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry \n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Update action policy push http to IFTTT on triggered event",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/027d98b4-43ba-4a5e-ae9c-ee048dfb1046",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"027d98b4-43ba-4a5e-ae9c-ee048dfb1046"
									]
								},
								"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "A revoir - Update action policy push http to Ubidots",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n            \"webhookUrl\": \"http://things.ubidots.com/api/v1.6/devices/my-data-source/\",\r\n            \"headers\": {\r\n               \"X-Auth-Token\": [\r\n                    \"A1E-YDrVwdWNqSd74mt41XxyATELvjdGdQ\"\r\n                ]\r\n            },\r\n            \"jsonPath\": \"value\",\r\n            \"retryOnFailure\": true\r\n     \r\n     \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/027d98b4-43ba-4a5e-ae9c-ee048dfb1046",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"027d98b4-43ba-4a5e-ae9c-ee048dfb1046"
									]
								},
								"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Push all data from tagged devices - 1) Create a new MatchingRule Tag",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n  \"dataPredicate\": \n\n  {\n    \"in\":\n    [ \n      \"httppush\", {\"var\" : \"tags\"} \n    ]\n    \n  },\n  \"enabled\": true,\n  \"name\": \"Test tag pour http push\"\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								},
								"description": "On these next requests we will create a set of Matching rule, Firing rule and Action policy that enable to push data from tagged devices to a fictive http address\n\n1) Create a matching rule that will trigger when the sending device has a tag set to \"httppush\""
							},
							"response": []
						},
						{
							"name": "Push all data from tagged devices - Retrieve the list of MatchingRules for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Push all data from tagged devices - 2) Create a new FiringRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"name\": \"Test Push Lora Tag\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								},
								"description": "Create an \"ALWAYS\" Firing rule binded to the previously created Matching rule, here its Id is \"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\""
							},
							"response": []
						},
						{
							"name": "Push all data from tagged devices - Retrieve the list of FiringRule for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Update a FiringRule Lora tag",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"id\": \"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\",\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"matchingRuleIds\": [\r\n        \"342be334-c3f6-406e-945e-77843228aa4d\"\r\n    ],\r\n    \"aggregationKeys\": [\r\n        \"metadata.source\"\r\n    ],\r\n    \"firingType\": \"ALWAYS\"\t\r\n\t\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule",
										"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1"
									]
								},
								"description": "Here we disable the Firing rule (\"enabled\" : false) and update its name.\n\nPut the firing rule Id into the request, here its Id is \"b87900ce-16f8-4b37-a723-78d23635ab10\" : https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule/b87900ce-16f8-4b37-a723-78d23635ab10"
							},
							"response": []
						},
						{
							"name": "Push all data from tagged devices - 3) Create a new action policy",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n      \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.location}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.payload}}\\\" }\"        \r\n        \r\n      }]  \r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "Creates an action Policy that will push Lora data to a fictive http address when the previously created Firing rule will trigger (here its id = \"1e045594-a324-492b-927c-d57da5b65771\")"
							},
							"response": []
						},
						{
							"name": "Update action policy - Push all data from tagged devices",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"564dd404-d2e4-4106-93b2-04e3fcfee6cb"
									]
								},
								"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"564dd404-d2e4-4106-93b2-04e3fcfee6cb\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "This section will show how to do a push http.\nWe will do 3 scenarios that push data to IFTTT :\n- all the data\n- triggered on a matching/firing rule\n- triggered on tagged devices\n\nThis section will use the Rule Engine features\n",
					"_postman_isSubFolder": true
				},
				{
					"name": "Notifications",
					"item": [
						{
							"name": "Notification : sending email",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"contact\": \r\n  {\r\n    \"to\": [\r\n      \"franck.lelong@orange.com\",\"fra.lelong@gmail.com\"\r\n    ],\r\n    \"cc\": [\r\n      \"franck.lelong@orange.fr\"\r\n    ],\r\n    \"cci\": [\r\n      \"franck.lelong@live.com\"\r\n    ]\r\n  },\r\n  \"message\": {\r\n     \"title\": \"Hello\",\r\n     \"content\": \"Hello World !\"\r\n  }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/contact",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"contact"
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						},
						{
							"name": "Notification : sending SMS",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "\r\n{\r\n \"contact\": \r\n  {\r\n    \"phoneNumbers\": [\r\n      \"+33671278017\" \r\n    ]\r\n  },\r\n  \"message\": {\r\n     \"content\": \"Hello World !\"\r\n  }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/contact",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"contact"
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
							},
							"response": []
						}
					],
					"description": "API to send mails ans SMS\nsee the Event to actions API that automaticaly binds events to mail & SMS Sending",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "a2dc5760-9901-4a52-a372-0b5b8bc2a6d0",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "b4ac0f39-4a01-40bd-a486-fad9e94b4938",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Push Data from Lora Devices",
					"item": [
						{
							"name": "Push Lora - Create a new MatchingRule Tag",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\n  \"dataPredicate\": \n\n  {\n    \"in\":\n    [ \n      \"httppush\", {\"var\" : \"tags\"} \n    ]\n    \n  },\n  \"enabled\": true,\n  \"name\": \"Test tag pour http push\"\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								},
								"description": "Create a matching rule that will trigger when the sending device has a tag set to \"httppush\""
							},
							"response": []
						},
						{
							"name": "Push Lora - Retrieve the list of MatchingRules for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"matching-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Push Lora - Create a new FiringRule",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"name\": \"Test Push Lora Tag\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"342be334-c3f6-406e-945e-77843228aa4d\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								},
								"description": "Create an \"ALWAYS\" Firing rule binded to the previously created Matching rule, here its Id is \"342be334-c3f6-406e-945e-77843228aa4d\""
							},
							"response": []
						},
						{
							"name": "Push Lora - Retrieve the list of FiringRule for a tenant",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"eventprocessing",
										"firing-rule"
									]
								}
							},
							"response": []
						},
						{
							"name": "Push Lora - Create a new action policy",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [\r\n          {\"cc\": [], \"cci\": [], \"to\": [\"franck.lelong@orange.com\"],\r\n            \"subjectTemplate\": \"Test Lora\",\r\n            \"contentTemplate\": \"Donnée Lora. <br/> Localisation GPS : {{matchingContext.data.location}} <br/> Payload {{matchingContext.data.value.payload}} \"\r\n            }\r\n        ]\r\n\r\n    }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									]
								},
								"description": "Creates an action Policy that will bind a mail sending to the previously created Firing rule (here its id = \"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\")"
							},
							"response": []
						},
						{
							"name": "Push Lora - List action policies",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies?size=20&page=0",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										}
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
							},
							"response": []
						},
						{
							"name": "Push Lora - Save or update an action policy",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [\r\n          {\"cc\": [], \"cci\": [], \"to\": [\"franck.lelong@orange.com\"],\r\n            \"subjectTemplate\": \"Test Lora\",\r\n            \"contentTemplate\": \"Donnée Lora. <br/> Localisation GPS : {{matchingContext.data.location}} <br/> Payload {{matchingContext.data.value.payload}} \"\r\n            }\r\n        ]\r\n\r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/e84a5736-9f82-4e5e-8e80-967bcdced8dc",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"e84a5736-9f82-4e5e-8e80-967bcdced8dc"
									]
								},
								"description": "Udate the action policy to disable it (\"enabled\": false)<br>\n\nPut the action Id into the request, here its Id is \"e84a5736-9f82-4e5e-8e80-967bcdced8dc\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/e84a5736-9f82-4e5e-8e80-967bcdced8dc <br>"
							},
							"response": []
						},
						{
							"name": "Push Lora - delete an action policy",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{LoraKey}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"event2action",
										"actionPolicies",
										"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a"
									]
								},
								"description": "Put the action Id into the request, here its Id is \"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a"
							},
							"response": []
						}
					],
					"description": "Set of rules to send all the data from a Lora device outside of the platform by using a Tag (\"httppush\"). \nYou must first have set this tag into your lora device properties through the portal or APIs\n\nPlease refer to the Matching rule/Firing rule/Event to action sections\n\nToday we send a mail containing the Lora payload. We will extend that to a push Http soon\n",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "b9bd8163-63d2-46f1-8a6c-9e1f48497d0c",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "c0a0d69a-c3a3-4ff6-ae67-7c9fccb07ccc",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				}
			],
			"description": "Create and manage Event processing rules, State changes (state processing), device activity events and bind actions (Mail, SMS, push http, send to Fifo) associated to those events"
		},
		{
			"name": "Push Http : push data from any device (Lora, SMS, MQTT...)",
			"item": [
				{
					"name": "Push all data to IFTTT - Create a new push http Event to action",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n        \t\"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n\t\t\t\"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/<!Put your IFTTT key here!>\",\r\n\t\t\t\"retryOnFailure\": true,\r\n\t\t\t\"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates a new action policy that will send all the received data to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry"
					},
					"response": []
				},
				{
					"name": "Update action policy push http to IFTTT for all data",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n        \t\"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n\t\t\t\"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/<!Put your IFTTT key here!>\",\r\n\t\t\t\"retryOnFailure\": true,\r\n\t\t\t\"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"46d1be3e-af61-45e3-a5bc-fc36ec75a909"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"46d1be3e-af61-45e3-a5bc-fc36ec75a909\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909"
					},
					"response": []
				},
				{
					"name": "Push triggered event related data to IFTTT - Create a new push http Event to action",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"        }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates a new action policy that will push the data that have triggered an event to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry \n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Update action policy push http to IFTTT on triggered event",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 1) Create a new MatchingRule Tag",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\n  \"dataPredicate\": \n\n  {\n    \"in\":\n    [ \n      \"httppush\", {\"var\" : \"tags\"} \n    ]\n    \n  },\n  \"enabled\": true,\n  \"name\": \"Test tag pour http push\"\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": "On these next requests we will create a set of Matching rule, Firing rule and Action policy that enable to push data from tagged devices to a fictive http address\n\n1) Create a matching rule that will trigger when the sending device has a tag set to \"httppush\""
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - Retrieve the list of MatchingRules for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 2) Create a new FiringRule",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"name\": \"Test Push Lora Tag\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": "Create an \"ALWAYS\" Firing rule binded to the previously created Matching rule, here its Id is \"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\""
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - Retrieve the list of FiringRule for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 3) Create a new action policy",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n      \"httpPush\": [{\r\n      \"webhookUrl\": \"https://www.fictiveaddress.com\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.location}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.payload}}\\\" }\"        \r\n      \t\r\n      }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates an action Policy that will push Lora data to a fictive http address when the previously created Firing rule will trigger (here its id = \"1e045594-a324-492b-927c-d57da5b65771\")"
					},
					"response": []
				},
				{
					"name": "Update action policy - Push all data from tagged devices copy",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"564dd404-d2e4-4106-93b2-04e3fcfee6cb"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"564dd404-d2e4-4106-93b2-04e3fcfee6cb\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - Retrieve the list of FiringRule for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 2) Create a new FiringRule",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"name\": \"Test Push Lora Tag\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": "Create an \"ALWAYS\" Firing rule binded to the previously created Matching rule, here its Id is \"20f6f86f-1e4d-4610-8ed9-31a40f6b0935\""
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - Retrieve the list of MatchingRules for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Update action policy push http to IFTTT on triggered event",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/785fc6c8-46a4-45bf-af9e-85ecbde1e3c5\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Push triggered event related data to IFTTT - Create a new push http Event to action",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push to IFTTT on triggered event - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"b87900ce-16f8-4b37-a723-78d23635ab10\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"        }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates a new action policy that will push the data that have triggered an event to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry \n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Update action policy push http to IFTTT for all data",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n          \"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"46d1be3e-af61-45e3-a5bc-fc36ec75a909"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"46d1be3e-af61-45e3-a5bc-fc36ec75a909\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/46d1be3e-af61-45e3-a5bc-fc36ec75a909\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 1) Create a new MatchingRule Tag",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\n  \"dataPredicate\": \n\n  {\n    \"in\":\n    [ \n      \"httppush\", {\"var\" : \"tags\"} \n    ]\n    \n  },\n  \"enabled\": true,\n  \"name\": \"Test tag pour http push\"\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": "On these next requests we will create a set of Matching rule, Firing rule and Action policy that enable to push data from tagged devices to a fictive http address\n\n1) Create a matching rule that will trigger when the sending device has a tag set to \"httppush\""
					},
					"response": []
				},
				{
					"name": "Push all data to IFTTT - Create a new push http Event to action",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Push all data to IFTTT - Twitter\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"messageSelector\": {\r\n          \"origin\": \"data_new\"\r\n        }\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/test/with/key/<!Put your IFTTT key here!>\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{streamId}}\\\", \\\"value2\\\" : \\\"{{value.temperature}}\\\", \\\"value3\\\" : \\\"{{value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates a new action policy that will send all the received data to an IFTTT Webhook. <br>\nIt will embed into the content the streamId, and 2 values : temperature and hygrometry \n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				},
				{
					"name": "Push all data from tagged devices - 3) Create a new action policy",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n      \"httpPush\": [{\r\n      \"webhookUrl\": \"https://www.fictiveaddress.com\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.location}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.payload}}\\\" }\"        \r\n        \r\n      }]  \r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates an action Policy that will push Lora data to a fictive http address when the previously created Firing rule will trigger (here its id = \"1e045594-a324-492b-927c-d57da5b65771\")"
					},
					"response": []
				},
				{
					"name": "Update action policy - Push all data from tagged devices copy",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"1e045594-a324-492b-927c-d57da5b65771\"]\r\n    },\r\n    \"actions\": {\r\n       \"httpPush\": [{\r\n      \"webhookUrl\": \"https://maker.ifttt.com/trigger/Temperature/with/key/p2ATeZKT78_zocyAG5ZewMuTEIT6KNfceTpI2X4g5j5\",\r\n      \"retryOnFailure\": true,\r\n      \"content\": \"{ \\\"value1\\\" : \\\"{{matchingContext.data.streamId}}\\\", \\\"value2\\\" : \\\"{{matchingContext.data.value.temperature}}\\\", \\\"value3\\\" : \\\"{{matchingContext.data.value.hygrometry}}\\\" }\"\r\n        }]  \r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"564dd404-d2e4-4106-93b2-04e3fcfee6cb"
							]
						},
						"description": "Temporary disable the policy by setting \"enable\" to false<br>\n\nPut the Action Id into the request, here its Id is \"564dd404-d2e4-4106-93b2-04e3fcfee6cb\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/564dd404-d2e4-4106-93b2-04e3fcfee6cb\n\n<br>Restricted to API keys with at least one of the following roles : DATA_PROCESSING_W."
					},
					"response": []
				}
			],
			"description": "This section will show how to do a push http.\nWe will do 3 scenarios that push data to IFTTT :\n- all the data : this feature is available in any offer\n- triggered on a matching/firing rule\n- triggered on tagged devices\n\nThis section will use the Rule Engine features"
		},
		{
			"name": "Push Data from Lora Devices by using a Tag (need of premium Lora offer)",
			"item": [
				{
					"name": "Push Lora - Create a new MatchingRule Tag",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\n  \"dataPredicate\": \n\n  {\n    \"in\":\n    [ \n      \"httppush\", {\"var\" : \"tags\"} \n    ]\n    \n  },\n  \"enabled\": true,\n  \"name\": \"Test tag pour http push\"\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						},
						"description": "Create a matching rule that will trigger when the sending device has a tag set to \"httppush\""
					},
					"response": []
				},
				{
					"name": "Push Lora - Retrieve the list of MatchingRules for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/matching-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"matching-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Push Lora - Create a new FiringRule",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"name\": \"Test Push Lora Tag\",\r\n  \"enabled\": true,\r\n  \"matchingRuleIds\": [\"342be334-c3f6-406e-945e-77843228aa4d\"],\r\n  \"aggregationKeys\": [\"metadata.source\"],\r\n  \"firingType\": \"ALWAYS\"\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						},
						"description": "Create an \"ALWAYS\" Firing rule binded to the previously created Matching rule, here its Id is \"342be334-c3f6-406e-945e-77843228aa4d\""
					},
					"response": []
				},
				{
					"name": "Push Lora - Retrieve the list of FiringRule for a tenant",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/eventprocessing/firing-rule",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"eventprocessing",
								"firing-rule"
							]
						}
					},
					"response": []
				},
				{
					"name": "Push Lora - Create a new action policy",
					"request": {
						"method": "POST",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": true,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [\r\n          {\"cc\": [], \"cci\": [], \"to\": [\"xx.yy@orange.fr\"],\r\n            \"subjectTemplate\": \"Test Lora\",\r\n            \"contentTemplate\": \"Donnée Lora. <br/> Localisation GPS : {{matchingContext.data.location}} <br/> Payload {{matchingContext.data.value.payload}} \"\r\n            }\r\n        ]\r\n\r\n    }\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							]
						},
						"description": "Creates an action Policy that will bind a mail sending to the previously created Firing rule (here its id = \"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\")"
					},
					"response": []
				},
				{
					"name": "Push Lora - List action policies",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies?size=20&page=0",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies"
							],
							"query": [
								{
									"key": "size",
									"value": "20"
								},
								{
									"key": "page",
									"value": "0"
								}
							]
						},
						"description": "Restricted to API keys with at least one of the following roles : DATA_PROCESSING_R."
					},
					"response": []
				},
				{
					"name": "Push Lora - Save or update an action policy",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n    \"name\": \"Test Push Lora Tag\",\r\n    \"enabled\": false,\r\n    \"triggers\": {\r\n        \"eventRuleIds\": [\"fbdc2dc5-3058-47c7-84ae-7d4d3e2097e1\"]\r\n    },\r\n    \"actions\": {\r\n        \"emails\": [\r\n          {\"cc\": [], \"cci\": [], \"to\": [\"xx.yy@orange.com\"],\r\n            \"subjectTemplate\": \"Test Lora\",\r\n            \"contentTemplate\": \"Donnée Lora. <br/> Localisation GPS : {{matchingContext.data.location}} <br/> Payload {{matchingContext.data.value.payload}} \"\r\n            }\r\n        ]\r\n\r\n    }\r\n}"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/e84a5736-9f82-4e5e-8e80-967bcdced8dc",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"e84a5736-9f82-4e5e-8e80-967bcdced8dc"
							]
						},
						"description": "Udate the action policy to disable it (\"enabled\": false)<br>\n\nPut the action Id into the request, here its Id is \"e84a5736-9f82-4e5e-8e80-967bcdced8dc\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/e84a5736-9f82-4e5e-8e80-967bcdced8dc <br>"
					},
					"response": []
				},
				{
					"name": "Push Lora - delete an action policy",
					"request": {
						"method": "DELETE",
						"header": [
							{
								"key": "Accept",
								"value": "application/json"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"body": {
							"mode": "formdata",
							"formdata": []
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"event2action",
								"actionPolicies",
								"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a"
							]
						},
						"description": "Put the action Id into the request, here its Id is \"f3a1f839-31fc-4f80-a7d2-f13f0ae7041a\" : https://liveobjects.orange-business.com/api/v0/event2action/actionPolicies/f3a1f839-31fc-4f80-a7d2-f13f0ae7041a"
					},
					"response": []
				}
			],
			"description": "Set of rules to send all the data from a Lora device outside of the platform by using a Tag (\"httppush\"). \nYou must first have set this tag into your lora device properties through the portal or APIs\n\nPlease refer to the Matching rule/Firing rule/Event to action sections\n\nToday we send a mail containing the Lora payload. We will extend that to a push Http soon\n",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "b9bd8163-63d2-46f1-8a6c-9e1f48497d0c",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "c0a0d69a-c3a3-4ff6-ae67-7c9fccb07ccc",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				}
			]
		},
		{
			"name": "Device Management",
			"item": [
				{
					"name": "Campaign Management",
					"item": [
						{
							"name": "Create a new campaign",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{keyCampaign}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"description\": \"A campaign that configures parameters, sends command or updates a resource\",\r\n  \"name\": \"My Campaign Android Franck\",\r\n  \"operations\": [\r\n    {\r\n      \"action\": \"configure\",\r\n      \"definition\": {\r\n        \"assetParameters\": {\r\n          \"updateRate\": {\r\n            \"type\": \"INT32\",\r\n            \"valueInt32\": 10\r\n          }\r\n        }\r\n      }\r\n    },\r\n    {\r\n      \"action\": \"command\",\r\n      \"definition\": {\r\n        \"event\": \"buzzer\"\r\n      }\r\n    }\r\n  ],\r\n  \"planning\": {\r\n    \"startDate\": \"2018-02-04T09:23:11Z\",\r\n    \"endDate\": \"2119-07-20T15:23:11Z\"\r\n  },\r\n  \"targets\": {\r\n    \"idList\": [\r\n      \"urn:lo:nsid:android:357329073120059\"\r\n    ]\r\n  }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/deviceMgt/campaigns",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"deviceMgt",
										"campaigns"
									]
								},
								"description": "Create a new Campaign \n- on 1 device : \"urn:lo:nsid:android:357329073120059\"\n- update the configuration \"updateRate\"\n- send a command \"buzzer\"\n\n\nRestricted to API keys with at least one of the following roles : CAMPAIGN_W."
							},
							"response": []
						},
						{
							"name": "List all campaigns",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{keyCampaign}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/deviceMgt/campaigns?size=20&page=0",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"deviceMgt",
										"campaigns"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										}
									]
								},
								"description": "Restricted to API keys with at least one of the following roles : CAMPAIGN_R."
							},
							"response": []
						},
						{
							"name": "Update a campaign",
							"request": {
								"method": "PATCH",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{keyCampaign}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"description\": \"A campaign that configures parameters, sends command or updates a resource\",\r\n  \"name\": \"My Campaign Android Franck updated\",\r\n  \"operations\": [\r\n    {\r\n      \"action\": \"configure\",\r\n      \"definition\": {\r\n        \"assetParameters\": {\r\n          \"updateRate\": {\r\n            \"type\": \"INT32\",\r\n            \"valueInt32\": 5\r\n          }\r\n        }\r\n      }\r\n    },\r\n    {\r\n      \"action\": \"command\",\r\n      \"definition\": {\r\n        \"event\": \"buzzer\"\r\n      }\r\n    },\r\n    {\r\n      \"action\": \"resource\",\r\n      \"definition\": {\r\n        \"resourceId\":\"demo_splash_screen\",\r\n        \"targetVersion\":\"V5\",\r\n        \"sourceVersion\":\"V4\"\r\n      }\r\n    }\r\n  ],\r\n  \"planning\": {\r\n    \"startDate\": \"2018-01-10T09:23:11Z\",\r\n    \"endDate\": \"2119-07-20T15:23:11Z\"\r\n  },\r\n  \"targets\": {\r\n    \"idList\": [\r\n      \"urn:lo:nsid:android:357329073120059\"\r\n    ]\r\n  }\r\n}\r\n"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/deviceMgt/campaigns/ce6d8860f8f0471e87fd82255d55d102",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"deviceMgt",
										"campaigns",
										"ce6d8860f8f0471e87fd82255d55d102"
									]
								},
								"description": "Update the Campaign \"ce6d8860f8f0471e87fd82255d55d102\"\n\n- Add a firmware update : from version V4 to version V5\n\nNote : the update can only apply if the \"startDate\" is after the current date/time \n\nRestricted to API keys with at least one of the following roles : CAMPAIGN_W."
							},
							"response": []
						},
						{
							"name": "Delete the specified campaign",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{keyCampaign}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/deviceMgt/campaigns/d077f524d30648d2907dd870848c7869",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"deviceMgt",
										"campaigns",
										"d077f524d30648d2907dd870848c7869"
									]
								},
								"description": "Put the Campaign Id into the request, here its Id is \"d077f524d30648d2907dd870848c7869\" : https://liveobjects.orange-business.com/api/v0/deviceMgt/campaigns/d077f524d30648d2907dd870848c7869\n\nRestricted to API keys with at least one of the following roles : CAMPAIGN_W."
							},
							"response": []
						}
					],
					"description": "In this collection we will create a Campaign on MQTT devices.<br>\nA campaign is :<br>\n- a list of targeted devices\n- a list of actions to do on this devices : commands, config update, fimware update\n- a time schedule when this campaign will apply \n\n<br>\ncoming version will enable powerful device targeting tools <br>",
					"event": [
						{
							"listen": "prerequest",
							"script": {
								"id": "46d58b7f-c9ae-4be2-a263-676a09282ef0",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						},
						{
							"listen": "test",
							"script": {
								"id": "a48b471e-b708-491a-a516-6dd0c910497a",
								"type": "text/javascript",
								"exec": [
									""
								]
							}
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Firmware management",
					"item": [
						{
							"name": "List asset's resources <=> get the firmware Id",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/rm/asset/android/357329073120059?size=20&page=0",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"rm",
										"asset",
										"android",
										"357329073120059"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										}
									]
								},
								"description": "Get the firmware Id of the device\n\nRestricted to API keys with at least one of the following roles : DEVICE_R."
							},
							"response": []
						},
						{
							"name": "Get the asset's resources update history",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/rm/asset/android/357329073120059/update/history?size=20&page=0",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"rm",
										"asset",
										"android",
										"357329073120059",
										"update",
										"history"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										}
									]
								}
							},
							"response": []
						}
					],
					"_postman_isSubFolder": true
				},
				{
					"name": "Groups management",
					"item": [
						{
							"name": "Create the Slovakia group",
							"request": {
								"method": "POST",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n \"parent\" :\"root\",\r\n \"pathNode\":\"Slovakia\",\r\n \"description\": \"group all devices in Slovakia\"\r\n }"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/groups",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"groups"
									]
								},
								"description": "Create the \"Slovakia\" group under the \"root\"\n\nRestricted to API keys with at least one of the following roles : DEVICE_W."
							},
							"response": []
						},
						{
							"name": "List registered groups",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/groups?size=20&page=0&parent=root",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"groups"
									],
									"query": [
										{
											"key": "size",
											"value": "20"
										},
										{
											"key": "page",
											"value": "0"
										},
										{
											"key": "parent",
											"value": "root"
										}
									]
								},
								"description": "List the groups just under the Root\n\nRestricted to API keys with at least one of the following roles : DEVICE_R."
							},
							"response": []
						},
						{
							"name": "List all registered groups",
							"request": {
								"method": "GET",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/groups",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"groups"
									]
								},
								"description": "List all the groups under the root, including all the subgroups\n\nRestricted to API keys with at least one of the following roles : DEVICE_R."
							},
							"response": []
						},
						{
							"name": "Update the Slovakia group",
							"request": {
								"method": "PUT",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "The group to register"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/groups/:groupId",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"groups",
										":groupId"
									],
									"variable": [
										{
											"key": "groupId",
											"value": "{{groupId}}",
											"type": "string"
										}
									]
								},
								"description": "Change the description of the group Slovakia, its device id id : DVqmqf\n\nRestricted to API keys with at least one of the following roles : DEVICE_W."
							},
							"response": []
						},
						{
							"name": "Delete a specific group",
							"request": {
								"method": "DELETE",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "formdata",
									"formdata": []
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v0/groups/:groupId",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v0",
										"groups",
										":groupId"
									],
									"variable": [
										{
											"key": "groupId",
											"value": "{{groupId}}",
											"type": "string"
										}
									]
								},
								"description": "in that case the group id was : lekfOq\n\nRestricted to API keys with at least one of the following roles : DEVICE_W."
							},
							"response": []
						},
						{
							"name": "Assign to the romania group the device : urn:lo:nsid:android:FLG357329073120059",
							"request": {
								"method": "PATCH",
								"header": [
									{
										"key": "Accept",
										"value": "application/json"
									},
									{
										"key": "Content-Type",
										"value": "application/json"
									},
									{
										"key": "X-API-KEY",
										"value": "{{X-API-KEY}}"
									}
								],
								"body": {
									"mode": "raw",
									"raw": "{\r\n  \"id\": \"urn:lo:nsid:android:FLG357329073120059\",\r\n  \"name\": \"Test device\",\r\n  \"description\": \"Android simulator\",\r\n  \"group\": {\r\n      \"id\": \"M3IlpO\",\r\n      \"path\": \"/romania\"\r\n    }\r\n}"
								},
								"url": {
									"raw": "https://liveobjects.orange-business.com/api/v1/deviceMgt/devices/urn:lo:nsid:android:FLG357329073120059",
									"protocol": "https",
									"host": [
										"liveobjects",
										"orange-business",
										"com"
									],
									"path": [
										"api",
										"v1",
										"deviceMgt",
										"devices",
										"urn:lo:nsid:android:FLG357329073120059"
									]
								},
								"description": "Move the device urn:lo:nsid:android:FLG357329073120059 to the \"romania\" group.\nbeware of putting the device reference into the requests and the body of the request!\n\nRestricted to API keys with at least one of the following roles : DEVICE_W."
							},
							"response": []
						}
					],
					"description": "In this section we will see basic operations on groups like creata a group, update it, delete it, list groups and assign a device to a group",
					"_postman_isSubFolder": true
				}
			],
			"description": "In this collection we will see how to \n- create and update a simple Device Campaign\n- get devices (assets) formware and update history \n- manage groups and assign devices to a group ",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "70ea0e21-34bd-4d63-ae54-cfe32a95c011",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "7a2851ba-e0a5-4e1e-a465-b87e857d5778",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				}
			]
		},
		{
			"name": "Get logs & debug information",
			"item": [
				{
					"name": "Listing all the API keys",
					"request": {
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/apiKeys?size=20&showSessionKeys=false",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"apiKeys"
							],
							"query": [
								{
									"key": "size",
									"value": "20"
								},
								{
									"key": "showSessionKeys",
									"value": "false"
								}
							]
						},
						"description": "Returns a list of API keys associated to a tenant. <br>\nThe \"label\" field will help you to find the Id."
					},
					"response": []
				},
				{
					"name": "MQTT Debug - Activate/desactivate",
					"request": {
						"method": "PUT",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}"
							},
							{
								"key": "Content-Type",
								"value": "application/json"
							},
							{
								"key": "",
								"value": "",
								"disabled": true
							}
						],
						"body": {
							"mode": "raw",
							"raw": "{\r\n  \"activated\":true,\r\n  \"durationSeconds\":3600\r\n}\r\n"
						},
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/apiKeys/5948eeb20cf244dc3f90f83a/debugMode",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"apiKeys",
								"5948eeb20cf244dc3f90f83a",
								"debugMode"
							]
						},
						"description": "Put the key Id into the request, here its Id is \"5948eeb20cf244dc3f90f83a\" : https://liveobjects.orange-business.com/api/v0/apiKeys/5948eeb20cf244dc3f90f83a/debugMode <br>\n<br>\nSet \"activated\" at true and put a duration in seconds"
					},
					"response": []
				},
				{
					"name": "Retrieve messages available in your AuditLog",
					"request": {
						"auth": {
							"type": "noauth"
						},
						"method": "GET",
						"header": [
							{
								"key": "X-API-KEY",
								"value": "{{X-API-KEY}}",
								"description": "a valid API key"
							}
						],
						"url": {
							"raw": "https://liveobjects.orange-business.com/api/v0/auditlog/messages?",
							"protocol": "https",
							"host": [
								"liveobjects",
								"orange-business",
								"com"
							],
							"path": [
								"api",
								"v0",
								"auditlog",
								"messages"
							],
							"query": [
								{
									"key": "from",
									"value": "<string>",
									"description": "Search for messages after this date. Use ISO-8601 normalization.",
									"disabled": true
								},
								{
									"key": "to",
									"value": "<string>",
									"description": "Search for messages before this date. Use ISO-8601 normalization.",
									"disabled": true
								},
								{
									"key": "offset",
									"value": "0",
									"description": "Offset from the first result you want to fetch. offset + limit should not exceed 10.000.",
									"disabled": true
								},
								{
									"key": "limit",
									"value": "100",
									"description": "Maximum amount of messages to return. offset + limit should not exceed 10.000.",
									"disabled": true
								},
								{
									"key": "sort",
									"value": "desc",
									"description": "Sort order, based on timestamp field of the AuditLog message.",
									"disabled": true
								},
								{
									"key": "filters",
									"value": "<string>",
									"description": "Filter query based on parameter name = field path and parameter value = value to search for : {fiedlName}={value}. You can put several filters that way, they will all be treated with an AND operator. Common filters field names you can use : level, category, subcategory, type, source.deviceId, source.nodeId, description, detailedDescription. e.g. : level=error&source.deviceId=urn:lora:0E5EAB0ABCD00000",
									"disabled": true
								},
								{
									"key": "@any",
									"value": "<string>,<string>",
									"description": "Search for AuditLog Messages where any of the fields contains all these values.",
									"disabled": true
								}
							]
						},
						"description": "Retreive logs messages. <br>\nThis can be error messages or any connectivity/interfaces (Lora, MQTT, push http, platform...) information <br>"
					},
					"response": [
						{
							"name": "list of AuditLogMessages",
							"originalRequest": {
								"method": "GET",
								"header": [
									{
										"description": {
											"content": "a valid API key",
											"type": "text/plain"
										},
										"key": "X-API-KEY",
										"value": "<string>"
									}
								],
								"url": {
									"raw": "{{baseUrl}}/api/v0/auditlog/messages?from=<string>&to=<string>&offset=<integer>&limit=100&sort=desc&filters=<string>&@any=<string>,<string>",
									"host": [
										"{{baseUrl}}"
									],
									"path": [
										"api",
										"v0",
										"auditlog",
										"messages"
									],
									"query": [
										{
											"key": "from",
											"value": "<string>"
										},
										{
											"key": "to",
											"value": "<string>"
										},
										{
											"key": "offset",
											"value": "<integer>"
										},
										{
											"key": "limit",
											"value": "100"
										},
										{
											"key": "sort",
											"value": "desc"
										},
										{
											"key": "filters",
											"value": "<string>"
										},
										{
											"key": "@any",
											"value": "<string>,<string>"
										}
									]
								}
							},
							"status": "OK",
							"code": 200,
							"_postman_previewlanguage": "json",
							"header": [
								{
									"key": "Content-Type",
									"value": "application/json"
								}
							],
							"cookie": [],
							"body": "[\n {\n  \"category\": \"<string>\",\n  \"created\": \"<string>\",\n  \"description\": \"<string>\",\n  \"level\": \"<string>\",\n  \"subcategory\": \"<string>\",\n  \"timestamp\": \"<string>\",\n  \"type\": \"<string>\",\n  \"content\": \"<object>\",\n  \"detailedDescription\": \"<string>\",\n  \"source\": {\n   \"actionPolicyId\": \"<string>\",\n   \"campaignId\": \"<string>\",\n   \"connector\": \"<string>\",\n   \"deviceId\": \"<string>\",\n   \"eventProcessingRuleId\": \"<string>\",\n   \"nodeId\": \"<string>\"\n  }\n },\n {\n  \"category\": \"<string>\",\n  \"created\": \"<string>\",\n  \"description\": \"<string>\",\n  \"level\": \"<string>\",\n  \"subcategory\": \"<string>\",\n  \"timestamp\": \"<string>\",\n  \"type\": \"<string>\",\n  \"content\": \"<object>\",\n  \"detailedDescription\": \"<string>\",\n  \"source\": {\n   \"actionPolicyId\": \"<string>\",\n   \"campaignId\": \"<string>\",\n   \"connector\": \"<string>\",\n   \"deviceId\": \"<string>\",\n   \"eventProcessingRuleId\": \"<string>\",\n   \"nodeId\": \"<string>\"\n  }\n }\n]"
						}
					]
				}
			],
			"description": "The objective is to get logs on the platform and its interfaces.<br>\n\nIn this collection we will \n- set the debug mode on the MQTT interface for 1 hour\n- get the logs  \n<br>\n\n\nNote: as the 'payload+bridge' mode will be deprecated end 2019, you will no longer have the possibility to catch the MQTT logs by subscribing to the topic 'router/~event/v1/log/new/mqtt'<br>\n\nIn replacement you will be able to get logs on every interfaces by using the entry point : /api/v0/auditlog/messages",
			"event": [
				{
					"listen": "prerequest",
					"script": {
						"id": "35393064-e6d2-44d8-8ddc-09fb81057456",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				},
				{
					"listen": "test",
					"script": {
						"id": "38bc9035-7a6a-42b5-ad5d-3dc9d9cf167b",
						"type": "text/javascript",
						"exec": [
							""
						]
					}
				}
			]
		}
	],
	"event": [
		{
			"listen": "prerequest",
			"script": {
				"id": "914f294d-f64f-4906-9f71-e99caef16674",
				"type": "text/javascript",
				"exec": [
					""
				]
			}
		},
		{
			"listen": "test",
			"script": {
				"id": "b23e53cb-78f4-444b-978f-722d9b632254",
				"type": "text/javascript",
				"exec": [
					""
				]
			}
		}
	]
};