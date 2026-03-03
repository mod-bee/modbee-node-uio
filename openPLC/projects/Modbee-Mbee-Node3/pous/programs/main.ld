PROGRAM main
VAR
	MODBEE_HW_INPUTS0 : MODBEE_HW_INPUTS;
	MODBEE_HW_OUTPUTS0 : MODBEE_HW_OUTPUTS;
	start : bool;
	stop : bool;
	run : bool;
	TON0 : TON;
	TON1 : TON;
	TON1_DONE : bool;
	TON0_DONE : bool;
	MODBEE_READ0 : MODBEE_READ;
	MODBEE_WRITE0 : MODBEE_WRITE;
	MBEE_READ_COILS_DONE : bool;
	MBEE_DI01 : bool;
	MBEE_DI02 : bool;
	MBEE_DI03 : bool;
	MBEE_DI04 : bool;
	MBEE_DI05 : bool;
	MBEE_DI06 : bool;
	MBEE_DI07 : bool;
	MBEE_DI08 : bool;
	MBEE_WRITE_COILS_DONE : bool;
	MBEE_DO01 : bool;
	MBEE_DO02 : bool;
	MBEE_DO03 : bool;
	MBEE_DO04 : bool;
	MBEE_DO05 : bool;
	MBEE_DO06 : bool;
	MBEE_DO07 : bool;
	MBEE_DO08 : bool;
	MODBEE_CONFIG0 : MODBEE_CONFIG;
	MODBEE_READ1 : MODBEE_READ;
	MODBEE_WRITE1 : MODBEE_WRITE;
	MBEE_AI01 : int;
	MBEE_AI02 : int;
	MBEE_AI03 : int;
	MBEE_AI04 : int;
	MBEE_AO01 : real;
	MBEE_AO02 : real;
	MBEE_AO01_TEMP : int;
	MBEE_AO02_TEMP : int;
	MODBEE_HAT_PWR0 : MODBEE_HAT_PWR;
END_VAR

{
  "name": "main",
  "rungs": [
    {
      "id": "rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
      "comment": "Scan Inputs First",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        608,
        718
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "6739411",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "9868675",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          }
        },
        {
          "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "type": "block",
          "position": {
            "x": 147,
            "y": 14
          },
          "height": 540,
          "width": 192,
          "measured": {
            "width": 192,
            "height": 540
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 50
                },
                "relPosition": {
                  "x": 192,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 90
                },
                "relPosition": {
                  "x": 192,
                  "y": 76
                },
                "id": "DX01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 130
                },
                "relPosition": {
                  "x": 192,
                  "y": 116
                },
                "id": "DX02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 170
                },
                "relPosition": {
                  "x": 192,
                  "y": 156
                },
                "id": "DX03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 210
                },
                "relPosition": {
                  "x": 192,
                  "y": 196
                },
                "id": "DX04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 250
                },
                "relPosition": {
                  "x": 192,
                  "y": 236
                },
                "id": "DX05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 290
                },
                "relPosition": {
                  "x": 192,
                  "y": 276
                },
                "id": "DX06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 330
                },
                "relPosition": {
                  "x": 192,
                  "y": 316
                },
                "id": "DX07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 370
                },
                "relPosition": {
                  "x": 192,
                  "y": 356
                },
                "id": "DX08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 410
                },
                "relPosition": {
                  "x": 192,
                  "y": 396
                },
                "id": "AX01_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 450
                },
                "relPosition": {
                  "x": 192,
                  "y": 436
                },
                "id": "AX02_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 490
                },
                "relPosition": {
                  "x": 192,
                  "y": 476
                },
                "id": "AX03_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 530
                },
                "relPosition": {
                  "x": 192,
                  "y": 516
                },
                "id": "AX04_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 339,
                  "y": 50
                },
                "relPosition": {
                  "x": 192,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 90
                },
                "relPosition": {
                  "x": 192,
                  "y": 76
                },
                "id": "DX01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 130
                },
                "relPosition": {
                  "x": 192,
                  "y": 116
                },
                "id": "DX02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 170
                },
                "relPosition": {
                  "x": 192,
                  "y": 156
                },
                "id": "DX03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 210
                },
                "relPosition": {
                  "x": 192,
                  "y": 196
                },
                "id": "DX04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 250
                },
                "relPosition": {
                  "x": 192,
                  "y": 236
                },
                "id": "DX05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 290
                },
                "relPosition": {
                  "x": 192,
                  "y": 276
                },
                "id": "DX06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 330
                },
                "relPosition": {
                  "x": 192,
                  "y": 316
                },
                "id": "DX07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 370
                },
                "relPosition": {
                  "x": 192,
                  "y": 356
                },
                "id": "DX08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 410
                },
                "relPosition": {
                  "x": 192,
                  "y": 396
                },
                "id": "AX01_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 450
                },
                "relPosition": {
                  "x": 192,
                  "y": 436
                },
                "id": "AX02_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 490
                },
                "relPosition": {
                  "x": 192,
                  "y": 476
                },
                "id": "AX03_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 339,
                  "y": 530
                },
                "relPosition": {
                  "x": 192,
                  "y": 516
                },
                "id": "AX04_Scaled",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 339,
                "y": 50
              },
              "relPosition": {
                "x": 192,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "4653701",
            "variant": {
              "name": "MODBEE_HW_INPUTS",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX01",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX02",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX03",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX04",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX05",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX06",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX07",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DX08",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "AX01_Scaled",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "AX02_Scaled",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "AX03_Scaled",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "AX04_Scaled",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "MODBEE_HW_INPUTS0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_INPUTS"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "DX01",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO01",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX02",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO02",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX03",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO03",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX04",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO04",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX05",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO05",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX06",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO06",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX07",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO07",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DX08",
                "type": "output",
                "variable": {
                  "name": "MBEE_DO08",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "AX01_Scaled",
                "type": "output",
                "variable": {
                  "name": "MBEE_AO01",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_585f6686-6577-457c-b419-24c6f800252e",
          "type": "block",
          "position": {
            "x": 147,
            "y": 598
          },
          "height": 100,
          "width": 198,
          "measured": {
            "width": 198,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 634
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 674
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "EN_HAT_POWER",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 345,
                  "y": 634
                },
                "relPosition": {
                  "x": 198,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 634
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 674
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "EN_HAT_POWER",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 345,
                  "y": 634
                },
                "relPosition": {
                  "x": 198,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 634
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 345,
                "y": 634
              },
              "relPosition": {
                "x": 198,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "7265399",
            "variant": {
              "name": "MODBEE_HAT_PWR",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "EN_HAT_POWER",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "MODBEE_HAT_PWR0",
              "type": {
                "definition": "derived",
                "value": "MODBEE_HAT_PWR"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "EN_HAT_POWER",
                "type": "input",
                "variable": {
                  "name": "TRUE"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e",
          "type": "parallel",
          "position": {
            "x": 465,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 465,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 465,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 469,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 465,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 469,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "4487988",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 469,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 469,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          }
        },
        {
          "id": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "type": "powerRail",
          "position": {
            "x": 605,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 605
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "4744842",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_ab8e6e2a-3299-40a1-976b-e884462d69ec",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2841877",
            "variable": {
              "name": "MBEE_DO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_ab8e6e2a-3299-40a1-976b-e884462d69ec"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX01",
              "variableType": {
                "name": "DX01",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_4032f7c5-fba4-43ef-98d3-893a1fb503d7",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9593307",
            "variable": {
              "name": "MBEE_DO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_4032f7c5-fba4-43ef-98d3-893a1fb503d7"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX02",
              "variableType": {
                "name": "DX02",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_a4d1601d-9e44-4156-be17-212224586926",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 154
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 170
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1450903",
            "variable": {
              "name": "MBEE_DO03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_a4d1601d-9e44-4156-be17-212224586926"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX03",
              "variableType": {
                "name": "DX03",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_ac780039-ed12-4e23-8222-570bf4e19eae",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 194
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 210
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3092780",
            "variable": {
              "name": "MBEE_DO04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_ac780039-ed12-4e23-8222-570bf4e19eae"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX04",
              "variableType": {
                "name": "DX04",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_ebd191d7-6cf0-459f-b60f-db2035c7b7af",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 234
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 250
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2528912",
            "variable": {
              "name": "MBEE_DO05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_ebd191d7-6cf0-459f-b60f-db2035c7b7af"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX05",
              "variableType": {
                "name": "DX05",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_aab57ed6-bf78-44c0-9d3a-d4cdf53abcb9",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 274
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 290
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "6892892",
            "variable": {
              "name": "MBEE_DO06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_aab57ed6-bf78-44c0-9d3a-d4cdf53abcb9"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX06",
              "variableType": {
                "name": "DX06",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_813b16b7-d294-43d5-9119-d8a76a3d0418",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 314
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 330
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3583781",
            "variable": {
              "name": "MBEE_DO07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_813b16b7-d294-43d5-9119-d8a76a3d0418"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX07",
              "variableType": {
                "name": "DX07",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_da60b139-11c7-4b7b-8620-c2b22f03a2fd",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 354
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 370
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "8449408",
            "variable": {
              "name": "MBEE_DO08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_da60b139-11c7-4b7b-8620-c2b22f03a2fd"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "DX08",
              "variableType": {
                "name": "DX08",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_9e1ab5f9-b16b-45f6-9684-4355db0dc815",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 394
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 410
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2754571",
            "variable": {
              "name": "MBEE_AO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_9e1ab5f9-b16b-45f6-9684-4355db0dc815"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "AX01_Scaled",
              "variableType": {
                "name": "AX01_Scaled",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_8ab5014d-c937-41c1-8b2f-1f065c562093",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 434
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 450
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3618091",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "AX02_Scaled",
              "variableType": {
                "name": "AX02_Scaled",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_ec5737be-41ba-42aa-91df-d0979d986165",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 474
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 490
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 490
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 490
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "8365388",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "AX03_Scaled",
              "variableType": {
                "name": "AX03_Scaled",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_8b46c667-4788-497b-b08f-651dce75ccc5",
          "type": "variable",
          "position": {
            "x": 369,
            "y": 514
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 530
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 369,
                  "y": 530
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 369,
                "y": 530
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "4651091",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
              "handleId": "AX04_Scaled",
              "variableType": {
                "name": "AX04_Scaled",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_a7639380-2984-4262-9b9a-e778e50b0d16",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 658
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 674
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 674
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 674
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3772934",
            "variable": {
              "name": "TRUE"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_585f6686-6577-457c-b419-24c6f800252e",
              "handleId": "EN_HAT_POWER",
              "variableType": {
                "name": "EN_HAT_POWER",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110_PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3__left-rail_input",
          "source": "left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474__output-right_EN",
          "source": "PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3",
          "sourceHandle": "output-right",
          "target": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e__ENO_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e_right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110__output-right_right-rail",
          "source": "PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e",
          "sourceHandle": "output-right",
          "target": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3_BLOCK_585f6686-6577-457c-b419-24c6f800252e__output-down_EN",
          "source": "PARALLEL_OPEN_e4b14dc2-96d4-4c16-9bf8-97f6dbf732c3",
          "sourceHandle": "output-down",
          "target": "BLOCK_585f6686-6577-457c-b419-24c6f800252e",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_585f6686-6577-457c-b419-24c6f800252e_PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e__ENO_input-down",
          "source": "BLOCK_585f6686-6577-457c-b419-24c6f800252e",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_91799dc7-f52b-4892-81fa-a9e66b49d80e",
          "targetHandle": "input-down"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_ab8e6e2a-3299-40a1-976b-e884462d69ec__DX01_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX01",
          "target": "VARIABLE_ab8e6e2a-3299-40a1-976b-e884462d69ec",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_4032f7c5-fba4-43ef-98d3-893a1fb503d7__DX02_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX02",
          "target": "VARIABLE_4032f7c5-fba4-43ef-98d3-893a1fb503d7",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_a4d1601d-9e44-4156-be17-212224586926__DX03_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX03",
          "target": "VARIABLE_a4d1601d-9e44-4156-be17-212224586926",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_ac780039-ed12-4e23-8222-570bf4e19eae__DX04_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX04",
          "target": "VARIABLE_ac780039-ed12-4e23-8222-570bf4e19eae",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_ebd191d7-6cf0-459f-b60f-db2035c7b7af__DX05_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX05",
          "target": "VARIABLE_ebd191d7-6cf0-459f-b60f-db2035c7b7af",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_aab57ed6-bf78-44c0-9d3a-d4cdf53abcb9__DX06_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX06",
          "target": "VARIABLE_aab57ed6-bf78-44c0-9d3a-d4cdf53abcb9",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_813b16b7-d294-43d5-9119-d8a76a3d0418__DX07_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX07",
          "target": "VARIABLE_813b16b7-d294-43d5-9119-d8a76a3d0418",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_da60b139-11c7-4b7b-8620-c2b22f03a2fd__DX08_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "DX08",
          "target": "VARIABLE_da60b139-11c7-4b7b-8620-c2b22f03a2fd",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_9e1ab5f9-b16b-45f6-9684-4355db0dc815__AX01_Scaled_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "AX01_Scaled",
          "target": "VARIABLE_9e1ab5f9-b16b-45f6-9684-4355db0dc815",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_8ab5014d-c937-41c1-8b2f-1f065c562093__AX02_Scaled_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "AX02_Scaled",
          "target": "VARIABLE_8ab5014d-c937-41c1-8b2f-1f065c562093",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_ec5737be-41ba-42aa-91df-d0979d986165__AX03_Scaled_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "AX03_Scaled",
          "target": "VARIABLE_ec5737be-41ba-42aa-91df-d0979d986165",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474_VARIABLE_8b46c667-4788-497b-b08f-651dce75ccc5__AX04_Scaled_input",
          "source": "BLOCK_dd2dd951-f9b9-461d-a4df-3cf8dfa7b474",
          "sourceHandle": "AX04_Scaled",
          "target": "VARIABLE_8b46c667-4788-497b-b08f-651dce75ccc5",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_a7639380-2984-4262-9b9a-e778e50b0d16_BLOCK_585f6686-6577-457c-b419-24c6f800252e__output_EN_HAT_POWER",
          "source": "VARIABLE_a7639380-2984-4262-9b9a-e778e50b0d16",
          "sourceHandle": "output",
          "target": "BLOCK_585f6686-6577-457c-b419-24c6f800252e",
          "targetHandle": "EN_HAT_POWER"
        }
      ]
    },
    {
      "id": "rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
      "comment": "Polling Timer for Modbee",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        633,
        278
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "2630839",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "3673597",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_1da6bd6d-e1a7-4919-80f5-719506359c5e",
          "type": "contact",
          "position": {
            "x": 72,
            "y": 38
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 72,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 96,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "negated",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 72,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 96,
                  "y": 50
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 72,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 96,
                "y": 50
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "1412877",
            "variable": {
              "name": "TON1_DONE",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
          "type": "block",
          "position": {
            "x": 261,
            "y": 14
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 261,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 261,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 261,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 261,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 327,
                  "y": 50
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 90
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 261,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 327,
                "y": 50
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "2843988",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON0",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "T#500ms"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_69da7037-6f7f-41f5-9acb-41518ea09d1a",
          "type": "coil",
          "position": {
            "x": 492,
            "y": 38
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 492,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 520,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 492,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 520,
                  "y": 50
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 492,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 520,
                "y": 50
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5395936",
            "variable": {
              "name": "TON0_DONE",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "CONTACT_fb5be1ce-9a12-44c5-9248-eb0efb8f8480",
          "type": "contact",
          "position": {
            "x": 72,
            "y": 182
          },
          "height": 24,
          "width": 24,
          "measured": {
            "width": 24,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 72,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 96,
                  "y": 194
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 72,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 96,
                  "y": 194
                },
                "relPosition": {
                  "x": 24,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 72,
                "y": 194
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 96,
                "y": 194
              },
              "relPosition": {
                "x": 24,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "5328108",
            "variable": {
              "name": "TON0_DONE"
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
          "type": "block",
          "position": {
            "x": 261,
            "y": 158
          },
          "height": 100,
          "width": 66,
          "measured": {
            "width": 66,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 261,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 261,
                  "y": 234
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 194
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 234
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 261,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 261,
                  "y": 234
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "PT",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 327,
                  "y": 194
                },
                "relPosition": {
                  "x": 66,
                  "y": 36
                },
                "id": "Q",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 327,
                  "y": 234
                },
                "relPosition": {
                  "x": 66,
                  "y": 76
                },
                "id": "ET",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 261,
                "y": 194
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "IN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 327,
                "y": 194
              },
              "relPosition": {
                "x": 66,
                "y": 36
              },
              "id": "Q",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "2106964",
            "variant": {
              "name": "TON",
              "type": "function-block",
              "language": "st",
              "variables": [
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "documentation": "first input parameter"
                },
                {
                  "name": "PT",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "documentation": "second input parameter"
                },
                {
                  "name": "Q",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  },
                  "documentation": "first output parameter"
                },
                {
                  "name": "ET",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  },
                  "initialValue": {
                    "value": "T#0s"
                  },
                  "documentation": "second output parameter"
                },
                {
                  "name": "STATE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "SINT"
                  },
                  "initialValue": {
                    "value": "0"
                  },
                  "documentation": "internal state: 0-reset, 1-counting, 2-set"
                },
                {
                  "name": "PREV_IN",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  },
                  "initialValue": {
                    "value": "FALSE"
                  }
                },
                {
                  "name": "CURRENT_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                },
                {
                  "name": "START_TIME",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "TIME"
                  }
                }
              ],
              "body": "{__SET_VAR(data__->,CURRENT_TIME,,__CURRENT_TIME)}\n\n      IF ((STATE = 0) AND NOT(PREV_IN) AND IN)   (* found rising edge on IN *)\n      THEN\n        (* start timer... *)\n        STATE := 1;\n        Q := TRUE;\n        START_TIME := CURRENT_TIME;\n\n      ELSE\n        (* STATE is 1 or 2 !! *)\n        IF (NOT(IN))\n        THEN\n          ET := T#0s;\n          Q := FALSE;\n          STATE := 0;\n\n        ELSIF (STATE = 1)\n        THEN\n          IF ((START_TIME + PT) <= CURRENT_TIME)\n          THEN\n            STATE := 2;\n            Q := TRUE;\n            ET := PT;\n          ELSE\n            ET := CURRENT_TIME - START_TIME;\n          END_IF;\n        END_IF;\n\n      END_IF;\n\n      PREV_IN := IN;",
              "documentation": "The on-delay timer can be used to delay setting an output true, for fixed period after an input becomes true."
            },
            "variable": {
              "name": "TON1",
              "type": {
                "definition": "derived",
                "value": "TON"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": false,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "PT",
                "type": "input",
                "variable": {
                  "name": "T#20ms"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "COIL_e2d841c5-1ca0-43a7-a169-0ffb196594e8",
          "type": "coil",
          "position": {
            "x": 492,
            "y": 182
          },
          "height": 24,
          "width": 28,
          "measured": {
            "width": 28,
            "height": 24
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 492,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              },
              {
                "glbPosition": {
                  "x": 520,
                  "y": 194
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "variant": "default",
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 492,
                  "y": 194
                },
                "relPosition": {
                  "x": 0,
                  "y": 12
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target",
                "style": {
                  "left": -3
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 520,
                  "y": 194
                },
                "relPosition": {
                  "x": 28,
                  "y": 12
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source",
                "style": {
                  "right": -3
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 492,
                "y": 194
              },
              "relPosition": {
                "x": 0,
                "y": 12
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target",
              "style": {
                "left": -3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 520,
                "y": 194
              },
              "relPosition": {
                "x": 28,
                "y": 12
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source",
              "style": {
                "right": -3
              }
            },
            "numericId": "1268923",
            "variable": {
              "name": "TON1_DONE",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1",
          "type": "parallel",
          "position": {
            "x": 565,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 565,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 565,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 569,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 565,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 569,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "9977154",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 569,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 569,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "type": "powerRail",
          "position": {
            "x": 630,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 630
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "6695444",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_3bcef9fe-f25e-4e28-9b0d-af741d767348",
          "type": "variable",
          "position": {
            "x": 151,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 311,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 311,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 311,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3737623",
            "variable": {
              "name": "T#500ms"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c555f2df-0906-4978-b63d-4e8670e4a384",
          "type": "variable",
          "position": {
            "x": 357,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 357,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 357,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 357,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3302827",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4ba09e87-e9b9-4dd5-8a23-8acbeb439650",
          "type": "variable",
          "position": {
            "x": 151,
            "y": 218
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 311,
                  "y": 234
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 311,
                  "y": 234
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 311,
                "y": 234
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6093244",
            "variable": {
              "name": "T#20ms"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
              "handleId": "PT",
              "variableType": {
                "name": "PT",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "documentation": "second input parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_98e3660f-822e-4cac-9e38-ee9b3687bc2f",
          "type": "variable",
          "position": {
            "x": 357,
            "y": 218
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 357,
                  "y": 234
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 357,
                  "y": 234
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 357,
                "y": 234
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5833488",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
              "handleId": "ET",
              "variableType": {
                "name": "ET",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "TIME"
                },
                "initialValue": {
                  "value": "T#0s"
                },
                "documentation": "second output parameter"
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1_right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79__output-right_right-rail",
          "source": "PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1",
          "sourceHandle": "output-right",
          "target": "right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6_CONTACT_fb5be1ce-9a12-44c5-9248-eb0efb8f8480__output-down_input",
          "source": "PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6",
          "sourceHandle": "output-down",
          "target": "CONTACT_fb5be1ce-9a12-44c5-9248-eb0efb8f8480",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_fb5be1ce-9a12-44c5-9248-eb0efb8f8480_BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897__output_IN",
          "source": "CONTACT_fb5be1ce-9a12-44c5-9248-eb0efb8f8480",
          "sourceHandle": "output",
          "target": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
          "targetHandle": "IN"
        },
        {
          "id": "e_PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6_CONTACT_1da6bd6d-e1a7-4919-80f5-719506359c5e__output-right_input",
          "source": "PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6",
          "sourceHandle": "output-right",
          "target": "CONTACT_1da6bd6d-e1a7-4919-80f5-719506359c5e",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_1da6bd6d-e1a7-4919-80f5-719506359c5e_BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1__output_IN",
          "source": "CONTACT_1da6bd6d-e1a7-4919-80f5-719506359c5e",
          "sourceHandle": "output",
          "target": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
          "targetHandle": "IN"
        },
        {
          "id": "e_left-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79_PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6__left-rail_input",
          "source": "left-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_e118de6d-beab-47cc-8c5c-2281dd23d9e6",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1_COIL_69da7037-6f7f-41f5-9acb-41518ea09d1a__Q_input",
          "source": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
          "sourceHandle": "Q",
          "target": "COIL_69da7037-6f7f-41f5-9acb-41518ea09d1a",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_69da7037-6f7f-41f5-9acb-41518ea09d1a_PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1__output_input",
          "source": "COIL_69da7037-6f7f-41f5-9acb-41518ea09d1a",
          "sourceHandle": "output",
          "target": "PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897_COIL_e2d841c5-1ca0-43a7-a169-0ffb196594e8__Q_input",
          "source": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
          "sourceHandle": "Q",
          "target": "COIL_e2d841c5-1ca0-43a7-a169-0ffb196594e8",
          "targetHandle": "input"
        },
        {
          "id": "e_COIL_e2d841c5-1ca0-43a7-a169-0ffb196594e8_PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1__output_input-down",
          "source": "COIL_e2d841c5-1ca0-43a7-a169-0ffb196594e8",
          "sourceHandle": "output",
          "target": "PARALLEL_CLOSE_e99f54c1-841f-4ddc-a12d-8240ae7508b1",
          "targetHandle": "input-down"
        },
        {
          "id": "e_VARIABLE_3bcef9fe-f25e-4e28-9b0d-af741d767348_BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1__output_PT",
          "source": "VARIABLE_3bcef9fe-f25e-4e28-9b0d-af741d767348",
          "sourceHandle": "output",
          "target": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1_VARIABLE_c555f2df-0906-4978-b63d-4e8670e4a384__ET_input",
          "source": "BLOCK_cead302c-7da8-4ff5-beb2-fdc70d5678f1",
          "sourceHandle": "ET",
          "target": "VARIABLE_c555f2df-0906-4978-b63d-4e8670e4a384",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_4ba09e87-e9b9-4dd5-8a23-8acbeb439650_BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897__output_PT",
          "source": "VARIABLE_4ba09e87-e9b9-4dd5-8a23-8acbeb439650",
          "sourceHandle": "output",
          "target": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
          "targetHandle": "PT"
        },
        {
          "id": "e_BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897_VARIABLE_98e3660f-822e-4cac-9e38-ee9b3687bc2f__ET_input",
          "source": "BLOCK_17af6d65-43cb-49ee-83cd-8494bfb60897",
          "sourceHandle": "ET",
          "target": "VARIABLE_98e3660f-822e-4cac-9e38-ee9b3687bc2f",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        1002,
        3606
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "5887326",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "2659837",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "type": "block",
          "position": {
            "x": 147,
            "y": 14
          },
          "height": 820,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 820
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 50
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 90
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 130
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 170
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 210
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 250
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 290
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 330
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 370
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 410
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 450
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 490
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "COIL_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 530
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 570
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 610
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 650
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 690
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 730
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 770
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 810
                },
                "relPosition": {
                  "x": 216,
                  "y": 796
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 363,
                  "y": 50
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 90
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 130
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 170
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 210
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 250
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 290
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 330
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 370
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 410
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 450
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 490
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "COIL_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 530
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 570
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 610
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 650
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 690
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 730
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 770
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 810
                },
                "relPosition": {
                  "x": 216,
                  "y": 796
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 363,
                "y": 50
              },
              "relPosition": {
                "x": 216,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "7574119",
            "variant": {
              "language": "cpp",
              "name": "MODBEE_READ",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ID",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ONLINE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_01",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_02",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_03",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_04",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_05",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_06",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_07",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_08",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_01",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_02",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_03",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_04",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_05",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_06",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_07",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_08",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK\n *\n *  ---------------------------------------------------------------\n *  - This function block runs **in sync** with the PLC runtime.\n *  - The `setup()` function is called once when the block initializes.\n *  - The `loop()` function is called at every PLC scan cycle.\n *  - Block input and output variables declared in the variable table\n *    can be accessed directly by name in this C/C++ code.\n *\n *  This block executes as part of the main PLC process and follows\n *  the configured scan time in the Resources. Use it for real-time\n *  control logic, fast I/O operations, or any C-based algorithms.\n *\n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async read with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Copy results when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdio.h>\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\ntypedef struct\n{\n  void *key; // stable per-instance key (pointer into FB instance)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t node_id;\n  uint16_t start_addr;\n  uint32_t operation_id;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  bool ists_buffer[MAX_ELEMENTS];\n  int16_t hreg_buffer[MAX_ELEMENTS];\n  int16_t ireg_buffer[MAX_ELEMENTS];\n} ModbeeReadCtx;\n\nstatic ModbeeReadCtx s_modbee_read_ctx[MAX_INSTANCES];\n\nstatic ModbeeReadCtx *get_modbee_read_ctx(MODBEE_READ_VARS *vars)\n{\n  (void)vars;\n  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].key == key)\n      return &s_modbee_read_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbee_read_ctx[i].in_use)\n    {\n      s_modbee_read_ctx[i].in_use = true;\n      s_modbee_read_ctx[i].key = key;\n      s_modbee_read_ctx[i].last_req = false;\n      s_modbee_read_ctx[i].started = false;\n      s_modbee_read_ctx[i].queued = false;\n      s_modbee_read_ctx[i].completed = false;\n      s_modbee_read_ctx[i].reg_type = 0xFF;\n      s_modbee_read_ctx[i].len = 0;\n      s_modbee_read_ctx[i].node_id = 0;\n      s_modbee_read_ctx[i].start_addr = 0;\n      s_modbee_read_ctx[i].operation_id = 0;\n      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)\n      {\n        s_modbee_read_ctx[i].coil_buffer[j] = false;\n        s_modbee_read_ctx[i].ists_buffer[j] = false;\n        s_modbee_read_ctx[i].hreg_buffer[j] = 0;\n        s_modbee_read_ctx[i].ireg_buffer[j] = 0;\n      }\n      return &s_modbee_read_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic inline void reset_modbee_read_ctx(ModbeeReadCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->operation_id = 0;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\n// Callback for read completion. We map operationId back to the owning instance.\nvoid modbeeReadCallback(uint32_t operationId)\n{\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].queued && s_modbee_read_ctx[i].operation_id == operationId)\n    {\n      s_modbee_read_ctx[i].completed = true;\n      return;\n    }\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n  NODE_ONLINE = false;\n}\n\nvoid loop()\n{\n  ModbeeReadCtx *ctx = get_modbee_read_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = false;\n    return;\n  }\n\n  // ===== STATE 1: REQ falling edge - RESET =====\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    DONE = false;\n    ERROR = false;\n    NODE_ONLINE = false;\n    reset_modbee_read_ctx(ctx);\n    return;\n  }\n  \n  // ===== STATE 2: REQ rising edge - START OPERATION =====\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);\n    if (!NODE_ONLINE)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    const uint8_t reg_type = (uint8_t)REG_TYPE;\n    if (reg_type > 3)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->operation_id = 0;\n    ctx->len = len;\n    ctx->reg_type = reg_type;\n    ctx->node_id = (uint8_t)NODE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    uint32_t operation_id = 0;\n    switch (ctx->reg_type)\n    {\n    case 0:\n      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 1:\n      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 2:\n      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 3:\n      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    default:\n      break;\n    }\n\n    if (operation_id == 0)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    ctx->operation_id = operation_id;\n    ctx->queued = true;\n    return;\n  }\n  \n  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====\n  if (!REQ || DONE)\n    return;\n\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = false;\n      ctx->queued = false;\n      ctx->started = false;\n      ctx->operation_id = 0;\n\n      const uint8_t len = ctx->len;\n      switch (ctx->reg_type)\n      {\n      case 0:\n        COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;\n        COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;\n        COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;\n        COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;\n        COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;\n        COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;\n        COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;\n        COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;\n        break;\n      case 1:\n        COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;\n        COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;\n        COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;\n        COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;\n        COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;\n        COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;\n        COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;\n        COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;\n        break;\n      case 2:\n        REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;\n        REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;\n        REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;\n        REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;\n        REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;\n        REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;\n        REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;\n        REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;\n        break;\n      case 3:\n        REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;\n        REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;\n        REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;\n        REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;\n        REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;\n        REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;\n        REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;\n        REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;\n        break;\n      default:\n        break;\n      }\n    }\n    return;\n  }\n  \n  // Not queued anymore and not done yet: nothing to do.\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBEE_READ0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_READ"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "REG_TYPE",
                "type": "input",
                "variable": {
                  "name": "1"
                }
              },
              {
                "handleId": "START_ADDR",
                "type": "input",
                "variable": {
                  "name": "100"
                }
              },
              {
                "handleId": "LENGTH",
                "type": "input",
                "variable": {
                  "name": "8"
                }
              },
              {
                "handleId": "COIL_01",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI01",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_02",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI02",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_03",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI03",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_04",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI04",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_05",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI05",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_06",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI06",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_07",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI07",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_08",
                "type": "output",
                "variable": {
                  "name": "MBEE_DI08",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "REQ",
                "type": "input",
                "variable": {
                  "name": "TON0_DONE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "NODE_ID",
                "type": "input",
                "variable": {
                  "name": "4"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 913
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 914
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 914
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "1225957",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 914
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 914
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "type": "block",
          "position": {
            "x": 147,
            "y": 878
          },
          "height": 820,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 820
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 954
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 994
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1034
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1074
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1114
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 914
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 954
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 994
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1034
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1074
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1114
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1154
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1194
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1234
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1274
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1314
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1354
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "COIL_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1394
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1434
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1474
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1514
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1554
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1594
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1634
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1674
                },
                "relPosition": {
                  "x": 216,
                  "y": 796
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 954
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 994
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1034
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1074
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1114
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 363,
                  "y": 914
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 954
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 994
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1034
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1074
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1114
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1154
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1194
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1234
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1274
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1314
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1354
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "COIL_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1394
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_01",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1434
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_02",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1474
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_03",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1514
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_04",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1554
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_05",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1594
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_06",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1634
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_07",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1674
                },
                "relPosition": {
                  "x": 216,
                  "y": 796
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 914
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 363,
                "y": 914
              },
              "relPosition": {
                "x": 216,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "294289",
            "variant": {
              "language": "cpp",
              "name": "MODBEE_READ",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ID",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ONLINE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_01",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_02",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_03",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_04",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_05",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_06",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_07",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_08",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_01",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_02",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_03",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_04",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_05",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_06",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_07",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_08",
                  "class": "output",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK\n *\n *  ---------------------------------------------------------------\n *  - This function block runs **in sync** with the PLC runtime.\n *  - The `setup()` function is called once when the block initializes.\n *  - The `loop()` function is called at every PLC scan cycle.\n *  - Block input and output variables declared in the variable table\n *    can be accessed directly by name in this C/C++ code.\n *\n *  This block executes as part of the main PLC process and follows\n *  the configured scan time in the Resources. Use it for real-time\n *  control logic, fast I/O operations, or any C-based algorithms.\n *\n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async read with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Copy results when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdio.h>\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\ntypedef struct\n{\n  void *key; // stable per-instance key (pointer into FB instance)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t node_id;\n  uint16_t start_addr;\n  uint32_t operation_id;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  bool ists_buffer[MAX_ELEMENTS];\n  int16_t hreg_buffer[MAX_ELEMENTS];\n  int16_t ireg_buffer[MAX_ELEMENTS];\n} ModbeeReadCtx;\n\nstatic ModbeeReadCtx s_modbee_read_ctx[MAX_INSTANCES];\n\nstatic ModbeeReadCtx *get_modbee_read_ctx(MODBEE_READ_VARS *vars)\n{\n  (void)vars;\n  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].key == key)\n      return &s_modbee_read_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbee_read_ctx[i].in_use)\n    {\n      s_modbee_read_ctx[i].in_use = true;\n      s_modbee_read_ctx[i].key = key;\n      s_modbee_read_ctx[i].last_req = false;\n      s_modbee_read_ctx[i].started = false;\n      s_modbee_read_ctx[i].queued = false;\n      s_modbee_read_ctx[i].completed = false;\n      s_modbee_read_ctx[i].reg_type = 0xFF;\n      s_modbee_read_ctx[i].len = 0;\n      s_modbee_read_ctx[i].node_id = 0;\n      s_modbee_read_ctx[i].start_addr = 0;\n      s_modbee_read_ctx[i].operation_id = 0;\n      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)\n      {\n        s_modbee_read_ctx[i].coil_buffer[j] = false;\n        s_modbee_read_ctx[i].ists_buffer[j] = false;\n        s_modbee_read_ctx[i].hreg_buffer[j] = 0;\n        s_modbee_read_ctx[i].ireg_buffer[j] = 0;\n      }\n      return &s_modbee_read_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic inline void reset_modbee_read_ctx(ModbeeReadCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->operation_id = 0;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\n// Callback for read completion. We map operationId back to the owning instance.\nvoid modbeeReadCallback(uint32_t operationId)\n{\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_read_ctx[i].in_use && s_modbee_read_ctx[i].queued && s_modbee_read_ctx[i].operation_id == operationId)\n    {\n      s_modbee_read_ctx[i].completed = true;\n      return;\n    }\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n  NODE_ONLINE = false;\n}\n\nvoid loop()\n{\n  ModbeeReadCtx *ctx = get_modbee_read_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = false;\n    return;\n  }\n\n  // ===== STATE 1: REQ falling edge - RESET =====\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    DONE = false;\n    ERROR = false;\n    NODE_ONLINE = false;\n    reset_modbee_read_ctx(ctx);\n    return;\n  }\n  \n  // ===== STATE 2: REQ rising edge - START OPERATION =====\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);\n    if (!NODE_ONLINE)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    const uint8_t reg_type = (uint8_t)REG_TYPE;\n    if (reg_type > 3)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->operation_id = 0;\n    ctx->len = len;\n    ctx->reg_type = reg_type;\n    ctx->node_id = (uint8_t)NODE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    uint32_t operation_id = 0;\n    switch (ctx->reg_type)\n    {\n    case 0:\n      operation_id = io.mbee.readCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 1:\n      operation_id = io.mbee.readIstsManual(ctx->node_id, ctx->start_addr, ctx->ists_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 2:\n      operation_id = io.mbee.readHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    case 3:\n      operation_id = io.mbee.readIregManual(ctx->node_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, 0, modbeeReadCallback);\n      break;\n    default:\n      break;\n    }\n\n    if (operation_id == 0)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_read_ctx(ctx);\n      return;\n    }\n\n    ctx->operation_id = operation_id;\n    ctx->queued = true;\n    return;\n  }\n  \n  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====\n  if (!REQ || DONE)\n    return;\n\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = false;\n      ctx->queued = false;\n      ctx->started = false;\n      ctx->operation_id = 0;\n\n      const uint8_t len = ctx->len;\n      switch (ctx->reg_type)\n      {\n      case 0:\n        COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;\n        COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;\n        COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;\n        COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;\n        COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;\n        COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;\n        COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;\n        COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;\n        break;\n      case 1:\n        COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;\n        COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;\n        COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;\n        COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;\n        COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;\n        COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;\n        COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;\n        COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;\n        break;\n      case 2:\n        REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;\n        REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;\n        REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;\n        REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;\n        REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;\n        REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;\n        REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;\n        REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;\n        break;\n      case 3:\n        REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;\n        REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;\n        REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;\n        REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;\n        REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;\n        REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;\n        REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;\n        REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;\n        break;\n      default:\n        break;\n      }\n    }\n    return;\n  }\n  \n  // Not queued anymore and not done yet: nothing to do.\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBEE_READ1",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_READ"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "REG_01",
                "type": "output",
                "variable": {
                  "name": "MBEE_AI01",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": true
                }
              },
              {
                "handleId": "REG_02",
                "type": "output",
                "variable": {
                  "name": "MBEE_AI02",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": true
                }
              },
              {
                "handleId": "REG_03",
                "type": "output",
                "variable": {
                  "name": "MBEE_AI03",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": true
                }
              },
              {
                "handleId": "REG_04",
                "type": "output",
                "variable": {
                  "name": "MBEE_AI04",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": true
                }
              },
              {
                "handleId": "REG_TYPE",
                "type": "input",
                "variable": {
                  "name": "3"
                }
              },
              {
                "handleId": "START_ADDR",
                "type": "input",
                "variable": {
                  "name": "100"
                }
              },
              {
                "handleId": "LENGTH",
                "type": "input",
                "variable": {
                  "name": "4"
                }
              },
              {
                "handleId": "REQ",
                "type": "input",
                "variable": {
                  "name": "TON0_DONE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "NODE_ID",
                "type": "input",
                "variable": {
                  "name": "4"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 1777
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 1778
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 1778
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "3704289",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 1778
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 1778
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "type": "block",
          "position": {
            "x": 147,
            "y": 1742
          },
          "height": 900,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 900
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1818
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1858
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1898
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1938
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1978
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2018
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COIL_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2058
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "COIL_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2098
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "COIL_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2138
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "COIL_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2178
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "COIL_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2218
                },
                "relPosition": {
                  "x": 0,
                  "y": 476
                },
                "id": "COIL_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2258
                },
                "relPosition": {
                  "x": 0,
                  "y": 516
                },
                "id": "COIL_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2298
                },
                "relPosition": {
                  "x": 0,
                  "y": 556
                },
                "id": "COIL_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2338
                },
                "relPosition": {
                  "x": 0,
                  "y": 596
                },
                "id": "REG_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2378
                },
                "relPosition": {
                  "x": 0,
                  "y": 636
                },
                "id": "REG_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2418
                },
                "relPosition": {
                  "x": 0,
                  "y": 676
                },
                "id": "REG_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2458
                },
                "relPosition": {
                  "x": 0,
                  "y": 716
                },
                "id": "REG_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2498
                },
                "relPosition": {
                  "x": 0,
                  "y": 756
                },
                "id": "REG_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2538
                },
                "relPosition": {
                  "x": 0,
                  "y": 796
                },
                "id": "REG_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2578
                },
                "relPosition": {
                  "x": 0,
                  "y": 836
                },
                "id": "REG_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 836,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2618
                },
                "relPosition": {
                  "x": 0,
                  "y": 876
                },
                "id": "REG_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 876,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1778
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1818
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1858
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1898
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1818
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1858
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1898
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1938
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1978
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2018
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COIL_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2058
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "COIL_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2098
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "COIL_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2138
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "COIL_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2178
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "COIL_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2218
                },
                "relPosition": {
                  "x": 0,
                  "y": 476
                },
                "id": "COIL_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2258
                },
                "relPosition": {
                  "x": 0,
                  "y": 516
                },
                "id": "COIL_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2298
                },
                "relPosition": {
                  "x": 0,
                  "y": 556
                },
                "id": "COIL_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2338
                },
                "relPosition": {
                  "x": 0,
                  "y": 596
                },
                "id": "REG_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2378
                },
                "relPosition": {
                  "x": 0,
                  "y": 636
                },
                "id": "REG_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2418
                },
                "relPosition": {
                  "x": 0,
                  "y": 676
                },
                "id": "REG_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2458
                },
                "relPosition": {
                  "x": 0,
                  "y": 716
                },
                "id": "REG_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2498
                },
                "relPosition": {
                  "x": 0,
                  "y": 756
                },
                "id": "REG_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2538
                },
                "relPosition": {
                  "x": 0,
                  "y": 796
                },
                "id": "REG_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2578
                },
                "relPosition": {
                  "x": 0,
                  "y": 836
                },
                "id": "REG_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 836,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2618
                },
                "relPosition": {
                  "x": 0,
                  "y": 876
                },
                "id": "REG_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 876,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1778
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1818
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1858
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 363,
                  "y": 1898
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 1778
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 363,
                "y": 1778
              },
              "relPosition": {
                "x": 216,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "4937963",
            "variant": {
              "language": "cpp",
              "name": "MODBEE_WRITE",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ID",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_01",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_02",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_03",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_04",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_05",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_06",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_07",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_08",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_01",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_02",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_03",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_04",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_05",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_06",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_07",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_08",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ONLINE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK\n *\n *  ---------------------------------------------------------------\n *  - This function block runs **in sync** with the PLC runtime.\n *  - The `setup()` function is called once when the block initializes.\n *  - The `loop()` function is called at every PLC scan cycle.\n *  - Block input and output variables declared in the variable table\n *    can be accessed directly by name in this C/C++ code.\n *\n *  This block executes as part of the main PLC process and follows\n *  the configured scan time in the Resources. Use it for real-time\n *  control logic, fast I/O operations, or any C-based algorithms.\n *\n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async write with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Set DONE when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdio.h>\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\ntypedef struct\n{\n  void *key; // stable per-instance key (pointer into FB instance)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t node_id;\n  uint16_t start_addr;\n  uint32_t operation_id;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  int16_t hreg_buffer[MAX_ELEMENTS];\n} ModbeeWriteCtx;\n\nstatic ModbeeWriteCtx s_modbee_write_ctx[MAX_INSTANCES];\n\nstatic ModbeeWriteCtx *get_modbee_write_ctx(MODBEE_WRITE_VARS *vars)\n{\n  (void)vars;\n  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].key == key)\n      return &s_modbee_write_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbee_write_ctx[i].in_use)\n    {\n      s_modbee_write_ctx[i].in_use = true;\n      s_modbee_write_ctx[i].key = key;\n      s_modbee_write_ctx[i].last_req = false;\n      s_modbee_write_ctx[i].started = false;\n      s_modbee_write_ctx[i].queued = false;\n      s_modbee_write_ctx[i].completed = false;\n      s_modbee_write_ctx[i].reg_type = 0xFF;\n      s_modbee_write_ctx[i].len = 0;\n      s_modbee_write_ctx[i].node_id = 0;\n      s_modbee_write_ctx[i].start_addr = 0;\n      s_modbee_write_ctx[i].operation_id = 0;\n      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)\n      {\n        s_modbee_write_ctx[i].coil_buffer[j] = false;\n        s_modbee_write_ctx[i].hreg_buffer[j] = 0;\n      }\n      return &s_modbee_write_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic inline void reset_modbee_write_ctx(ModbeeWriteCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->operation_id = 0;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\n// Callback for write completion. We map operationId back to the owning instance.\nvoid modbeeWriteCallback(uint32_t operationId)\n{\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].queued && s_modbee_write_ctx[i].operation_id == operationId)\n    {\n      s_modbee_write_ctx[i].completed = true;\n      return;\n    }\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n  NODE_ONLINE = false;\n}\n\nvoid loop()\n{\n  ModbeeWriteCtx *ctx = get_modbee_write_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = false;\n    return;\n  }\n  \n  // ===== STATE 1: REQ falling edge - RESET =====\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    DONE = false;\n    ERROR = false;\n    NODE_ONLINE = false;\n    reset_modbee_write_ctx(ctx);\n    return;\n  }\n  \n  // ===== STATE 2: REQ rising edge - START OPERATION =====\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n    \n    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);\n    if (!NODE_ONLINE) {\n      ERROR = true;\n      DONE = false;  // Error occurred, operation not done\n      return;\n    }\n    \n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = false;  // Error occurred, operation not done\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    const uint8_t reg_type = (uint8_t)REG_TYPE;\n    if (reg_type != 0 && reg_type != 2)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->operation_id = 0;\n    ctx->len = len;\n    ctx->reg_type = reg_type;\n    ctx->node_id = (uint8_t)NODE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)\n    {\n      ctx->coil_buffer[i] = false;\n      ctx->hreg_buffer[i] = 0;\n    }\n\n    if (ctx->reg_type == 0)\n    {\n      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;\n      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;\n      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;\n      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;\n      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;\n      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;\n      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;\n      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;\n    }\n    else\n    {\n      ctx->hreg_buffer[0] = (len > 0) ? (int16_t)REG_01 : 0;\n      ctx->hreg_buffer[1] = (len > 1) ? (int16_t)REG_02 : 0;\n      ctx->hreg_buffer[2] = (len > 2) ? (int16_t)REG_03 : 0;\n      ctx->hreg_buffer[3] = (len > 3) ? (int16_t)REG_04 : 0;\n      ctx->hreg_buffer[4] = (len > 4) ? (int16_t)REG_05 : 0;\n      ctx->hreg_buffer[5] = (len > 5) ? (int16_t)REG_06 : 0;\n      ctx->hreg_buffer[6] = (len > 6) ? (int16_t)REG_07 : 0;\n      ctx->hreg_buffer[7] = (len > 7) ? (int16_t)REG_08 : 0;\n    }\n\n    uint32_t operation_id = 0;\n    if (ctx->reg_type == 0)\n      operation_id = io.mbee.writeCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeWriteCallback);\n    else\n      operation_id = io.mbee.writeHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeWriteCallback);\n\n    if (operation_id == 0)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    ctx->operation_id = operation_id;\n    ctx->queued = true;\n    return;\n  }\n  \n  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====\n  if (!REQ || DONE)\n    return;\n\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = false;\n      ctx->queued = false;\n      ctx->started = false;\n      ctx->operation_id = 0;\n    }\n    return;\n  }\n  \n  // Not queued anymore and not done yet: nothing to do.\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBEE_WRITE0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_WRITE"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "COIL_01",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO01",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_02",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO02",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_03",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO03",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_04",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO04",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_05",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO05",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_06",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO06",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_07",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO07",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "COIL_08",
                "type": "input",
                "variable": {
                  "name": "MBEE_DO08",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "REQ",
                "type": "input",
                "variable": {
                  "name": "TON0_DONE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "REG_TYPE",
                "type": "input",
                "variable": {
                  "name": "0"
                }
              },
              {
                "handleId": "START_ADDR",
                "type": "input",
                "variable": {
                  "name": "100"
                }
              },
              {
                "handleId": "LENGTH",
                "type": "input",
                "variable": {
                  "name": "8"
                }
              },
              {
                "handleId": "NODE_ID",
                "type": "input",
                "variable": {
                  "name": "4"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 2721
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 23,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "input-top",
                "position": "top",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 27,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "output-down",
                "position": "bottom",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 23,
                "y": 2722
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 2722
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "7306523",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 2722
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "input-top",
              "position": "top",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 2722
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "output-down",
              "position": "bottom",
              "type": "source",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelCloseReference": "PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14",
            "type": "open",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          }
        },
        {
          "id": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
          "type": "block",
          "position": {
            "x": 147,
            "y": 2686
          },
          "height": 100,
          "width": 132,
          "measured": {
            "width": 132,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2722
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2762
                },
                "relPosition": {
                  "x": 132,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2722
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2762
                },
                "relPosition": {
                  "x": 132,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 2722
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 279,
                "y": 2722
              },
              "relPosition": {
                "x": 132,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "1445590",
            "variant": {
              "name": "REAL_TO_INT",
              "type": "function",
              "language": "st",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "OUT",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  }
                },
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                }
              ],
              "body": "Data type conversion",
              "documentation": "(IN: REAL) => OUT: INT",
              "extensible": false
            },
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "IN",
                "type": "input",
                "variable": {
                  "name": "MBEE_AO01",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "OUT",
                "type": "output",
                "variable": {
                  "name": "MBEE_AO01_TEMP",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
          "type": "block",
          "position": {
            "x": 147,
            "y": 2830
          },
          "height": 100,
          "width": 132,
          "measured": {
            "width": 132,
            "height": 100
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2866
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2906
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2866
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2906
                },
                "relPosition": {
                  "x": 132,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2866
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 147,
                  "y": 2906
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "IN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2866
                },
                "relPosition": {
                  "x": 132,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 279,
                  "y": 2906
                },
                "relPosition": {
                  "x": 132,
                  "y": 76
                },
                "id": "OUT",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 2866
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 279,
                "y": 2866
              },
              "relPosition": {
                "x": 132,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "5476008",
            "variant": {
              "name": "REAL_TO_INT",
              "type": "function",
              "language": "st",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "OUT",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "INT"
                  }
                },
                {
                  "name": "IN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                }
              ],
              "body": "Data type conversion",
              "documentation": "(IN: REAL) => OUT: INT",
              "extensible": false
            },
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": true,
            "connectedVariables": [
              {
                "handleId": "IN",
                "type": "input",
                "variable": {
                  "name": "MBEE_AO02",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "class": "local",
                  "location": "",
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "OUT",
                "type": "output",
                "variable": {
                  "name": "MBEE_AO02_TEMP",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14",
          "type": "parallel",
          "position": {
            "x": 399,
            "y": 2721
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 399,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 399,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 403,
                  "y": 2722
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 399,
                "y": 2722
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 403,
                "y": 2722
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "6760837",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 403,
                "y": 2722
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 403,
                "y": 2722
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false
          }
        },
        {
          "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "type": "block",
          "position": {
            "x": 523,
            "y": 2686
          },
          "height": 900,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 900
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2802
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2842
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2882
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2922
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2962
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COIL_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3002
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "COIL_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3042
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "COIL_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3082
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "COIL_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3122
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "COIL_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3162
                },
                "relPosition": {
                  "x": 0,
                  "y": 476
                },
                "id": "COIL_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3202
                },
                "relPosition": {
                  "x": 0,
                  "y": 516
                },
                "id": "COIL_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3242
                },
                "relPosition": {
                  "x": 0,
                  "y": 556
                },
                "id": "COIL_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3282
                },
                "relPosition": {
                  "x": 0,
                  "y": 596
                },
                "id": "REG_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3322
                },
                "relPosition": {
                  "x": 0,
                  "y": 636
                },
                "id": "REG_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3362
                },
                "relPosition": {
                  "x": 0,
                  "y": 676
                },
                "id": "REG_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3402
                },
                "relPosition": {
                  "x": 0,
                  "y": 716
                },
                "id": "REG_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3442
                },
                "relPosition": {
                  "x": 0,
                  "y": 756
                },
                "id": "REG_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3482
                },
                "relPosition": {
                  "x": 0,
                  "y": 796
                },
                "id": "REG_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3522
                },
                "relPosition": {
                  "x": 0,
                  "y": 836
                },
                "id": "REG_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 836,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3562
                },
                "relPosition": {
                  "x": 0,
                  "y": 876
                },
                "id": "REG_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 876,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2722
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2762
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2802
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2842
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2722
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "REQ",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2802
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "NODE_ID",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2842
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "REG_TYPE",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2882
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "START_ADDR",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2922
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "LENGTH",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2962
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COIL_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3002
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "COIL_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3042
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "COIL_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3082
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "COIL_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3122
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "COIL_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3162
                },
                "relPosition": {
                  "x": 0,
                  "y": 476
                },
                "id": "COIL_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 476,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3202
                },
                "relPosition": {
                  "x": 0,
                  "y": 516
                },
                "id": "COIL_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 516,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3242
                },
                "relPosition": {
                  "x": 0,
                  "y": 556
                },
                "id": "COIL_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 556,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3282
                },
                "relPosition": {
                  "x": 0,
                  "y": 596
                },
                "id": "REG_01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 596,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3322
                },
                "relPosition": {
                  "x": 0,
                  "y": 636
                },
                "id": "REG_02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 636,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3362
                },
                "relPosition": {
                  "x": 0,
                  "y": 676
                },
                "id": "REG_03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 676,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3402
                },
                "relPosition": {
                  "x": 0,
                  "y": 716
                },
                "id": "REG_04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 716,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3442
                },
                "relPosition": {
                  "x": 0,
                  "y": 756
                },
                "id": "REG_05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3482
                },
                "relPosition": {
                  "x": 0,
                  "y": 796
                },
                "id": "REG_06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 796,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3522
                },
                "relPosition": {
                  "x": 0,
                  "y": 836
                },
                "id": "REG_07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 836,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 523,
                  "y": 3562
                },
                "relPosition": {
                  "x": 0,
                  "y": 876
                },
                "id": "REG_08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 876,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2722
                },
                "relPosition": {
                  "x": 216,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2762
                },
                "relPosition": {
                  "x": 216,
                  "y": 76
                },
                "id": "DONE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2802
                },
                "relPosition": {
                  "x": 216,
                  "y": 116
                },
                "id": "ERROR",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "right": 0
                }
              },
              {
                "glbPosition": {
                  "x": 739,
                  "y": 2842
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "NODE_ONLINE",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 523,
                "y": 2722
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 739,
                "y": 2722
              },
              "relPosition": {
                "x": 216,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "9170091",
            "variant": {
              "language": "cpp",
              "name": "MODBEE_WRITE",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ID",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "value": "WORD",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "value": "BYTE",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_01",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_02",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_03",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_04",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_05",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_06",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_07",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "COIL_08",
                  "class": "input",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_01",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_02",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_03",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_04",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_05",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_06",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_07",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "REG_08",
                  "class": "input",
                  "type": {
                    "value": "INT",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                },
                {
                  "name": "NODE_ONLINE",
                  "class": "output",
                  "type": {
                    "value": "BOOL",
                    "definition": "base-type"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK\n *\n *  ---------------------------------------------------------------\n *  - This function block runs **in sync** with the PLC runtime.\n *  - The `setup()` function is called once when the block initializes.\n *  - The `loop()` function is called at every PLC scan cycle.\n *  - Block input and output variables declared in the variable table\n *    can be accessed directly by name in this C/C++ code.\n *\n *  This block executes as part of the main PLC process and follows\n *  the configured scan time in the Resources. Use it for real-time\n *  control logic, fast I/O operations, or any C-based algorithms.\n *\n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async write with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Set DONE when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdio.h>\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\ntypedef struct\n{\n  void *key; // stable per-instance key (pointer into FB instance)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t node_id;\n  uint16_t start_addr;\n  uint32_t operation_id;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  int16_t hreg_buffer[MAX_ELEMENTS];\n} ModbeeWriteCtx;\n\nstatic ModbeeWriteCtx s_modbee_write_ctx[MAX_INSTANCES];\n\nstatic ModbeeWriteCtx *get_modbee_write_ctx(MODBEE_WRITE_VARS *vars)\n{\n  (void)vars;\n  // Use macro-safe stable address: &REQ expands to &(*(vars->REQ)) in generated code.\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].key == key)\n      return &s_modbee_write_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbee_write_ctx[i].in_use)\n    {\n      s_modbee_write_ctx[i].in_use = true;\n      s_modbee_write_ctx[i].key = key;\n      s_modbee_write_ctx[i].last_req = false;\n      s_modbee_write_ctx[i].started = false;\n      s_modbee_write_ctx[i].queued = false;\n      s_modbee_write_ctx[i].completed = false;\n      s_modbee_write_ctx[i].reg_type = 0xFF;\n      s_modbee_write_ctx[i].len = 0;\n      s_modbee_write_ctx[i].node_id = 0;\n      s_modbee_write_ctx[i].start_addr = 0;\n      s_modbee_write_ctx[i].operation_id = 0;\n      for (uint8_t j = 0; j < MAX_ELEMENTS; j++)\n      {\n        s_modbee_write_ctx[i].coil_buffer[j] = false;\n        s_modbee_write_ctx[i].hreg_buffer[j] = 0;\n      }\n      return &s_modbee_write_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic inline void reset_modbee_write_ctx(ModbeeWriteCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->operation_id = 0;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\n// Callback for write completion. We map operationId back to the owning instance.\nvoid modbeeWriteCallback(uint32_t operationId)\n{\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbee_write_ctx[i].in_use && s_modbee_write_ctx[i].queued && s_modbee_write_ctx[i].operation_id == operationId)\n    {\n      s_modbee_write_ctx[i].completed = true;\n      return;\n    }\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n  NODE_ONLINE = false;\n}\n\nvoid loop()\n{\n  ModbeeWriteCtx *ctx = get_modbee_write_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = false;\n    return;\n  }\n  \n  // ===== STATE 1: REQ falling edge - RESET =====\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    DONE = false;\n    ERROR = false;\n    NODE_ONLINE = false;\n    reset_modbee_write_ctx(ctx);\n    return;\n  }\n  \n  // ===== STATE 2: REQ rising edge - START OPERATION =====\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n    \n    NODE_ONLINE = io.mbee.isNodeKnown(NODE_ID);\n    if (!NODE_ONLINE) {\n      ERROR = true;\n      DONE = false;  // Error occurred, operation not done\n      return;\n    }\n    \n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = false;  // Error occurred, operation not done\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    const uint8_t reg_type = (uint8_t)REG_TYPE;\n    if (reg_type != 0 && reg_type != 2)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->operation_id = 0;\n    ctx->len = len;\n    ctx->reg_type = reg_type;\n    ctx->node_id = (uint8_t)NODE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)\n    {\n      ctx->coil_buffer[i] = false;\n      ctx->hreg_buffer[i] = 0;\n    }\n\n    if (ctx->reg_type == 0)\n    {\n      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;\n      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;\n      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;\n      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;\n      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;\n      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;\n      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;\n      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;\n    }\n    else\n    {\n      ctx->hreg_buffer[0] = (len > 0) ? (int16_t)REG_01 : 0;\n      ctx->hreg_buffer[1] = (len > 1) ? (int16_t)REG_02 : 0;\n      ctx->hreg_buffer[2] = (len > 2) ? (int16_t)REG_03 : 0;\n      ctx->hreg_buffer[3] = (len > 3) ? (int16_t)REG_04 : 0;\n      ctx->hreg_buffer[4] = (len > 4) ? (int16_t)REG_05 : 0;\n      ctx->hreg_buffer[5] = (len > 5) ? (int16_t)REG_06 : 0;\n      ctx->hreg_buffer[6] = (len > 6) ? (int16_t)REG_07 : 0;\n      ctx->hreg_buffer[7] = (len > 7) ? (int16_t)REG_08 : 0;\n    }\n\n    uint32_t operation_id = 0;\n    if (ctx->reg_type == 0)\n      operation_id = io.mbee.writeCoilManual(ctx->node_id, ctx->start_addr, ctx->coil_buffer, ctx->len, 0, modbeeWriteCallback);\n    else\n      operation_id = io.mbee.writeHregManual(ctx->node_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, 0, modbeeWriteCallback);\n\n    if (operation_id == 0)\n    {\n      ERROR = true;\n      DONE = false;\n      reset_modbee_write_ctx(ctx);\n      return;\n    }\n\n    ctx->operation_id = operation_id;\n    ctx->queued = true;\n    return;\n  }\n  \n  // ===== STATE 3: OPERATION PENDING - WAIT FOR COMPLETION =====\n  if (!REQ || DONE)\n    return;\n\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = false;\n      ctx->queued = false;\n      ctx->started = false;\n      ctx->operation_id = 0;\n    }\n    return;\n  }\n  \n  // Not queued anymore and not done yet: nothing to do.\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBEE_WRITE1",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_WRITE"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "REQ",
                "type": "input",
                "variable": {
                  "name": "TON0_DONE",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "REG_TYPE",
                "type": "input",
                "variable": {
                  "name": "2"
                }
              },
              {
                "handleId": "START_ADDR",
                "type": "input",
                "variable": {
                  "name": "100"
                }
              },
              {
                "handleId": "LENGTH",
                "type": "input",
                "variable": {
                  "name": "2"
                }
              },
              {
                "handleId": "REG_01",
                "type": "input",
                "variable": {
                  "name": "MBEE_AO01_TEMP",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "REG_02",
                "type": "input",
                "variable": {
                  "name": "MBEE_AO02_TEMP",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "NODE_ID",
                "type": "input",
                "variable": {
                  "name": "4"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55",
          "type": "parallel",
          "position": {
            "x": 859,
            "y": 1777
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 1778
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 1778
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 859,
                "y": 1778
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 1778
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "2295596",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 1778
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 1778
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb",
          "type": "parallel",
          "position": {
            "x": 859,
            "y": 913
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 914
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 914
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 859,
                "y": 914
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 914
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "10586979",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 914
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 914
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea",
          "type": "parallel",
          "position": {
            "x": 859,
            "y": 49
          },
          "height": 2,
          "width": 4,
          "measured": {
            "width": 4,
            "height": 2
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 859,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 1
                },
                "id": "input",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "left": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 2
                },
                "id": "input-down",
                "position": "bottom",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "bottom": 1
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 4,
                  "y": 1
                },
                "id": "output-right",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "visibility": "hidden",
                  "right": 3
                }
              },
              {
                "glbPosition": {
                  "x": 863,
                  "y": 50
                },
                "relPosition": {
                  "x": 2,
                  "y": 0
                },
                "id": "output-top",
                "position": "top",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 1
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 859,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 1
              },
              "id": "input",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "left": 3
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 50
              },
              "relPosition": {
                "x": 4,
                "y": 1
              },
              "id": "output-right",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "visibility": "hidden",
                "right": 3
              }
            },
            "numericId": "2998492",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 2
              },
              "id": "input-down",
              "position": "bottom",
              "type": "target",
              "isConnectable": false,
              "style": {
                "bottom": 1
              }
            },
            "parallelOutputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 50
              },
              "relPosition": {
                "x": 2,
                "y": 0
              },
              "id": "output-top",
              "position": "top",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 1
              }
            },
            "parallelOpenReference": "PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100",
            "type": "close",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "type": "powerRail",
          "position": {
            "x": 999,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 999
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "8492091",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_5f19af42-5b57-4c1e-8385-72648bf1cac7",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7447148",
            "variable": {
              "name": "TON0_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_5f19af42-5b57-4c1e-8385-72648bf1cac7"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_65b683a2-87a6-4c72-9df8-201009560de8",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 130
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1377967",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "NODE_ID",
              "variableType": {
                "name": "NODE_ID",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f73e4645-bf31-4b1b-bcf5-43fe264d27fa",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 154
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 170
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9166949",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_93c7dff8-dc63-4c7c-9579-f03f0333ce17",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 194
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 210
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7643546",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_7c4fb78e-b841-45c4-9750-81d7daf0c9c7",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 234
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 250
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 250
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 250
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9844086",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_76fffbd7-6d51-4c90-90d3-0ac42579bda3",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 90
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5926970",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e788c391-5625-43f8-b4f4-0ce849b8d71d",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 130
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1102032",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_381abee6-a64e-491d-a16c-3584b76b3590",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 154
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 170
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "789711",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "NODE_ONLINE",
              "variableType": {
                "name": "NODE_ONLINE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_48b15b1f-3a59-42ec-9852-df488431f61b",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 194
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 210
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9949431",
            "variable": {
              "name": "MBEE_DI01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_48b15b1f-3a59-42ec-9852-df488431f61b"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_01",
              "variableType": {
                "name": "COIL_01",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_36d737a8-fa70-44fc-8d4f-6da994f743ca",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 234
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 250
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "4504089",
            "variable": {
              "name": "MBEE_DI02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_36d737a8-fa70-44fc-8d4f-6da994f743ca"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_02",
              "variableType": {
                "name": "COIL_02",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_aff80b0c-900f-4867-ad92-372df2993781",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 274
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 290
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "6087157",
            "variable": {
              "name": "MBEE_DI03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_aff80b0c-900f-4867-ad92-372df2993781"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_03",
              "variableType": {
                "name": "COIL_03",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_e7b87598-58e2-4515-b4c9-2336baf7d62a",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 314
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 330
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1864144",
            "variable": {
              "name": "MBEE_DI04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_e7b87598-58e2-4515-b4c9-2336baf7d62a"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_04",
              "variableType": {
                "name": "COIL_04",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_e9846924-9b51-4257-bdfb-a6a91d406192",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 354
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 370
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "446550",
            "variable": {
              "name": "MBEE_DI05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_e9846924-9b51-4257-bdfb-a6a91d406192"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_05",
              "variableType": {
                "name": "COIL_05",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_a10e28d5-f81f-429e-bbe8-8e938dfb8cfe",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 394
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 410
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1207351",
            "variable": {
              "name": "MBEE_DI06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_a10e28d5-f81f-429e-bbe8-8e938dfb8cfe"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_06",
              "variableType": {
                "name": "COIL_06",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_f3a1bbc7-27d5-43e4-9e6c-131d707753f0",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 434
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 450
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2361326",
            "variable": {
              "name": "MBEE_DI07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_f3a1bbc7-27d5-43e4-9e6c-131d707753f0"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_07",
              "variableType": {
                "name": "COIL_07",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_d87ffdc5-fa0e-4f52-9881-85232cb85d36",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 474
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 490
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 490
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 490
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1226345",
            "variable": {
              "name": "MBEE_DI08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_d87ffdc5-fa0e-4f52-9881-85232cb85d36"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "COIL_08",
              "variableType": {
                "name": "COIL_08",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_1fc82d2e-a60c-4e8e-9adb-4780bbad28a0",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 514
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 530
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 530
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 530
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1023992",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_01",
              "variableType": {
                "name": "REG_01",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5b3cd36b-746f-4974-872b-e63b1d453e08",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 554
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 570
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 570
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 570
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3386565",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_02",
              "variableType": {
                "name": "REG_02",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_a5f43ea3-bdb5-47fd-bd3e-4f4b100e888a",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 594
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 610
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 610
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 610
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7934647",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_03",
              "variableType": {
                "name": "REG_03",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f952e228-d851-4277-bdd7-e515dbda43ad",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 634
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 650
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 650
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 650
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2254785",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_04",
              "variableType": {
                "name": "REG_04",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_a6cddd9d-b9f4-408b-87b6-e902df93cdb5",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 674
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 690
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 690
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 690
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9113659",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_05",
              "variableType": {
                "name": "REG_05",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_71e2903b-ef78-493e-943e-57e9103feafa",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 714
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 730
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 730
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 730
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3609517",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_06",
              "variableType": {
                "name": "REG_06",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5edd299b-f478-48e0-b8e5-c88402df9c83",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 754
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 770
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 770
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 770
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1245264",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_07",
              "variableType": {
                "name": "REG_07",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e08ff130-ab64-41f7-9ee4-1ddc15ac72d1",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 794
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 810
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 810
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 810
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "715104",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
              "handleId": "REG_08",
              "variableType": {
                "name": "REG_08",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5023feb9-c0c6-46ea-bf7a-b4f3081676c5",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 938
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 954
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 954
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 954
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1348515",
            "variable": {
              "name": "TON0_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_5023feb9-c0c6-46ea-bf7a-b4f3081676c5"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_73222ab1-5052-4730-b5c4-81117cd0593b",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 978
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 994
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 994
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 994
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6508103",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "NODE_ID",
              "variableType": {
                "name": "NODE_ID",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_aabac02f-4bab-466b-8ad9-4448af808bf1",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1018
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1034
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1034
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1034
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9808925",
            "variable": {
              "name": "3"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e21b86b7-e80c-4850-828d-254df181e6c1",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1058
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1074
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1074
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1074
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4674019",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d6862223-24fe-414a-a6b9-c8410cfaa1d8",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1098
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1114
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1114
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1114
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4728581",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4ac07011-98f4-4ec8-b684-d9b495eab0d4",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 938
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 954
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 954
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 954
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3144539",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_89dda293-e07e-4cab-a252-82cd8975950c",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 978
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 994
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 994
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 994
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "6583269",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5c80f31d-912d-4e29-b431-ccb62ba9fed5",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1018
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1034
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1034
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1034
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3322235",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "NODE_ONLINE",
              "variableType": {
                "name": "NODE_ONLINE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_638c4a6b-bbc7-4572-bb83-2d3c97d735fe",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1058
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1074
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1074
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1074
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9157903",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_01",
              "variableType": {
                "name": "COIL_01",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_77419f7f-85ec-435e-93e9-5065ffe5f35a",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1098
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1114
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1114
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1114
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9975068",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_02",
              "variableType": {
                "name": "COIL_02",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_6e4ca534-86ea-4aea-be18-07bba03f2947",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1138
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1154
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1154
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1154
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7870680",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_03",
              "variableType": {
                "name": "COIL_03",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e58a590e-d987-4d6b-98bc-69ad7a612e40",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1178
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1194
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1194
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1194
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5433343",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_04",
              "variableType": {
                "name": "COIL_04",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_b6a3dbaf-5d7e-4d2d-aca1-7c40700eb525",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1218
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1234
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1234
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1234
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "964089",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_05",
              "variableType": {
                "name": "COIL_05",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_0fcfc01d-7852-4251-aff4-4d47797623f7",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1258
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1274
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1274
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1274
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "4534548",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_06",
              "variableType": {
                "name": "COIL_06",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_438ca551-ae88-48a6-9e95-13ab93f40523",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1298
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1314
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1314
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1314
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9965970",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_07",
              "variableType": {
                "name": "COIL_07",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_19ffdf8b-a610-4b61-b064-2c0353994b0b",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1338
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1354
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1354
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1354
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7338839",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "COIL_08",
              "variableType": {
                "name": "COIL_08",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_81a80b25-54f8-4205-b902-cada2df733ae",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1378
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1394
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1394
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1394
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7171839",
            "variable": {
              "name": "MBEE_AI01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_81a80b25-54f8-4205-b902-cada2df733ae"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_01",
              "variableType": {
                "name": "REG_01",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_f9e0fc23-84c3-44f8-98ce-6674ea778fe7",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1418
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1434
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1434
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1434
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3233638",
            "variable": {
              "name": "MBEE_AI02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_f9e0fc23-84c3-44f8-98ce-6674ea778fe7"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_02",
              "variableType": {
                "name": "REG_02",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_beefdd12-2b66-46c8-bce9-ac7c19da69a6",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1458
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1474
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1474
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1474
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "8072510",
            "variable": {
              "name": "MBEE_AI03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_beefdd12-2b66-46c8-bce9-ac7c19da69a6"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_03",
              "variableType": {
                "name": "REG_03",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_547497b2-21a3-463a-b928-01b53e7e8418",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1498
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1514
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1514
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1514
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2155623",
            "variable": {
              "name": "MBEE_AI04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_547497b2-21a3-463a-b928-01b53e7e8418"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_04",
              "variableType": {
                "name": "REG_04",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_2a1d9ad3-2e38-4bf1-a357-5ffad9290677",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1538
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1554
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1554
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1554
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9236492",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_05",
              "variableType": {
                "name": "REG_05",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_013eaeb0-e9aa-4400-a141-cd5981e020d6",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1578
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1594
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1594
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1594
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "5583482",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_06",
              "variableType": {
                "name": "REG_06",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_6ec9d453-ed52-4edd-8054-abab2fb300fa",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1618
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1634
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1634
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1634
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "10246014",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_07",
              "variableType": {
                "name": "REG_07",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c8038bf5-0576-404a-9e76-136d97c9aa5e",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1658
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1674
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1674
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1674
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1811948",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
              "handleId": "REG_08",
              "variableType": {
                "name": "REG_08",
                "class": "output",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_585c6244-d0f1-44de-b1d3-2327a60745ff",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1802
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1818
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1818
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1818
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4811353",
            "variable": {
              "name": "TON0_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_585c6244-d0f1-44de-b1d3-2327a60745ff"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_204d2aac-5975-4ef3-bcc9-a5d6bec5f1b5",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1842
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1858
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1858
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1858
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3622238",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "NODE_ID",
              "variableType": {
                "name": "NODE_ID",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_bbdd2e32-f559-43eb-9dc9-9bcdd6af2f80",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1882
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1898
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1898
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1898
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7122857",
            "variable": {
              "name": "0"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_bd6a7ee0-5ef1-4756-b553-c7018c6d55bf",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1922
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1938
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1938
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1938
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "2703689",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_39797d3a-83a7-483d-b032-3c8d42146076",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1962
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1978
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 1978
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 1978
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4673557",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_b3fe7a7e-95e8-49b1-aeed-74172335f7b0",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2002
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2018
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2018
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2018
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5503774",
            "variable": {
              "name": "MBEE_DO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_b3fe7a7e-95e8-49b1-aeed-74172335f7b0"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_01",
              "variableType": {
                "name": "COIL_01",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_c6ca0230-d4e9-49ab-98d3-04f449b8f5b7",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2042
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2058
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2058
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2058
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6572531",
            "variable": {
              "name": "MBEE_DO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_c6ca0230-d4e9-49ab-98d3-04f449b8f5b7"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_02",
              "variableType": {
                "name": "COIL_02",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_7b81e677-4fc9-49d0-9654-8f552150ddf7",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2082
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2098
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2098
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2098
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9371454",
            "variable": {
              "name": "MBEE_DO03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_7b81e677-4fc9-49d0-9654-8f552150ddf7"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_03",
              "variableType": {
                "name": "COIL_03",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_2f14d5a6-9141-4523-8af7-7b799a07e2ef",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2122
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2138
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2138
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2138
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1740232",
            "variable": {
              "name": "MBEE_DO04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_2f14d5a6-9141-4523-8af7-7b799a07e2ef"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_04",
              "variableType": {
                "name": "COIL_04",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_6ee39a90-8743-4dc9-a9cc-54cd59c5a9bf",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2162
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2178
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2178
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2178
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4389716",
            "variable": {
              "name": "MBEE_DO05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_6ee39a90-8743-4dc9-a9cc-54cd59c5a9bf"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_05",
              "variableType": {
                "name": "COIL_05",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_f0aafa32-4880-4747-b47d-7bcbaf69aba6",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2202
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2218
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2218
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2218
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6788742",
            "variable": {
              "name": "MBEE_DO06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_f0aafa32-4880-4747-b47d-7bcbaf69aba6"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_06",
              "variableType": {
                "name": "COIL_06",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_40285e74-eed4-4a93-911f-ac7a1e7d3189",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2242
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2258
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2258
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2258
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3297437",
            "variable": {
              "name": "MBEE_DO07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_40285e74-eed4-4a93-911f-ac7a1e7d3189"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_07",
              "variableType": {
                "name": "COIL_07",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_0ee22e06-61f6-43c4-8861-dd25106c4f2c",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2282
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2298
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2298
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2298
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3161630",
            "variable": {
              "name": "MBEE_DO08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_0ee22e06-61f6-43c4-8861-dd25106c4f2c"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "COIL_08",
              "variableType": {
                "name": "COIL_08",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_05aadfd8-ac8d-44e7-9566-c58058cee644",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2322
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2338
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2338
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2338
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "935626",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_01",
              "variableType": {
                "name": "REG_01",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_b8ea767f-0930-4735-99ab-96979ab75a86",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2362
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2378
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2378
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2378
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4654926",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_02",
              "variableType": {
                "name": "REG_02",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_fdbc3983-648f-4f1b-8859-2943ec37e2bf",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2402
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2418
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2418
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2418
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1723519",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_03",
              "variableType": {
                "name": "REG_03",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_49fad52c-9994-40e5-accd-7c7990742634",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2442
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2458
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2458
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2458
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6031482",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_04",
              "variableType": {
                "name": "REG_04",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_0fda701f-2b4c-4eaf-b93a-64e8e98501ab",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2482
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2498
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2498
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2498
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1061372",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_05",
              "variableType": {
                "name": "REG_05",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5885eceb-a913-460e-85e7-42697f4e19cf",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2522
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2538
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2538
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2538
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5413752",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_06",
              "variableType": {
                "name": "REG_06",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_df58ccd7-f247-4b48-83c1-0397aed286eb",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2562
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2578
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2578
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2578
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "844559",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_07",
              "variableType": {
                "name": "REG_07",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_fc87cadc-ba52-49f2-bf34-0206cc1d897b",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2602
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2618
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2618
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2618
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "813528",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "REG_08",
              "variableType": {
                "name": "REG_08",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_30eb3f20-9a24-4dff-ac1b-2a695ac5e750",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1802
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1818
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1818
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1818
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "3083672",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e6ed7df1-da55-4cf0-8910-b936aa0daf31",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1842
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1858
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1858
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1858
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9662449",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d63c9cdb-a26c-48fc-97a2-357ab15a085d",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 1882
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1898
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 393,
                  "y": 1898
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 393,
                "y": 1898
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9736388",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
              "handleId": "NODE_ONLINE",
              "variableType": {
                "name": "NODE_ONLINE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_10418199-32be-447c-a446-3e40d6431498",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2746
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2762
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2762
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2762
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3904885",
            "variable": {
              "name": "MBEE_AO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_10418199-32be-447c-a446-3e40d6431498"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
              "handleId": "IN",
              "variableType": {
                "name": "IN",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_78ddc646-0108-470d-a4b9-48f4e32928fe",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 2746
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 309,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 309,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 309,
                "y": 2762
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "8190894",
            "variable": {
              "name": "MBEE_AO01_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_78ddc646-0108-470d-a4b9-48f4e32928fe"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
              "handleId": "OUT",
              "variableType": {
                "name": "OUT",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_4f902aea-a13e-40df-9cec-3e02fd21c5db",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2890
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2906
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 197,
                  "y": 2906
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 197,
                "y": 2906
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5369483",
            "variable": {
              "name": "MBEE_AO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_4f902aea-a13e-40df-9cec-3e02fd21c5db"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
              "handleId": "IN",
              "variableType": {
                "name": "IN",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_47c7d5c4-1a44-42e0-9a75-310d191569f3",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 2890
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 309,
                  "y": 2906
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 309,
                  "y": 2906
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 309,
                "y": 2906
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "7242991",
            "variable": {
              "name": "MBEE_AO02_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_47c7d5c4-1a44-42e0-9a75-310d191569f3"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
              "handleId": "OUT",
              "variableType": {
                "name": "OUT",
                "class": "output",
                "type": {
                  "definition": "base-type",
                  "value": "INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_5892399b-5d2f-48c0-b700-b9cfeda0f6bf",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2746
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2762
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2762
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2762
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1787125",
            "variable": {
              "name": "TON0_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_5892399b-5d2f-48c0-b700-b9cfeda0f6bf"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_484af5eb-6452-49d0-9bce-fe318e771a69",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2786
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2802
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2802
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2802
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "2358937",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "NODE_ID",
              "variableType": {
                "name": "NODE_ID",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_38a2e9e8-5913-453c-a209-14063bf44b0c",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2826
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2842
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2842
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2842
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7927298",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f36cb153-ff86-45f6-b7df-c660f2f3acf3",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2866
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2882
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2882
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2882
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "8553865",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "value": "WORD",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_7e8065ab-66e6-4ba6-aaca-8607ea73fb87",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2906
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2922
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2922
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2922
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "915885",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "value": "BYTE",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_97835b72-06d5-447c-884c-3f6c02f23fb4",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2946
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2962
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 2962
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 2962
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5598457",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_01",
              "variableType": {
                "name": "COIL_01",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c3e85222-ecbf-4e0e-950f-8df584131316",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2986
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3002
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3002
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3002
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1357916",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_02",
              "variableType": {
                "name": "COIL_02",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_1b146336-1e52-4650-9531-e0bc365a2934",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3026
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3042
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3042
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3042
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1091491",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_03",
              "variableType": {
                "name": "COIL_03",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5c827d04-f14a-4fea-8705-b898768939fb",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3066
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3082
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3082
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3082
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5546979",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_04",
              "variableType": {
                "name": "COIL_04",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_2525e584-e82d-4344-88e2-b0d2f9fa2033",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3106
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3122
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3122
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3122
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4696241",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_05",
              "variableType": {
                "name": "COIL_05",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c999aa26-06cc-43e0-8b4c-9a80af232709",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3146
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3162
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3162
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3162
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7914696",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_06",
              "variableType": {
                "name": "COIL_06",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_58d68f28-14d0-4a5d-bc85-ee5ee88ee15a",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3186
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3202
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3202
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3202
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "2114645",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_07",
              "variableType": {
                "name": "COIL_07",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f67ff0cf-a01d-404a-a400-30ffe5c96b66",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3226
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3242
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3242
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3242
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "4120118",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "COIL_08",
              "variableType": {
                "name": "COIL_08",
                "class": "input",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d8b6eb85-738b-4d4c-ad9e-497a6df07cee",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3266
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3282
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3282
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3282
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6080994",
            "variable": {
              "name": "MBEE_AO01_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_d8b6eb85-738b-4d4c-ad9e-497a6df07cee"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_01",
              "variableType": {
                "name": "REG_01",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_70513c2d-712c-4e7d-9f3a-d431f092d661",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3306
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3322
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3322
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3322
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5520443",
            "variable": {
              "name": "MBEE_AO02_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_70513c2d-712c-4e7d-9f3a-d431f092d661"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_02",
              "variableType": {
                "name": "REG_02",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_25e6b522-f2fb-4111-a76c-c1f350a48a7d",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3346
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3362
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3362
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3362
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5499773",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_03",
              "variableType": {
                "name": "REG_03",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d81b90f5-8528-4d91-bd28-c6191908ef4e",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3386
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3402
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3402
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3402
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5468197",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_04",
              "variableType": {
                "name": "REG_04",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d10abd7f-50af-4a74-be45-1b9e38783a95",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3426
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3442
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3442
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3442
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "535181",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_05",
              "variableType": {
                "name": "REG_05",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_9fcb27b0-5de8-48a1-855e-bedcb0cccdcd",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3466
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3482
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3482
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3482
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9594005",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_06",
              "variableType": {
                "name": "REG_06",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_eb082fdb-2888-41d3-a504-45c5e96b2922",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3506
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3522
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3522
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3522
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "2296973",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_07",
              "variableType": {
                "name": "REG_07",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_5b10ee81-57df-44ad-8c1b-e5a0232dafda",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 3546
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3562
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 573,
                  "y": 3562
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 573,
                "y": 3562
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3626441",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "REG_08",
              "variableType": {
                "name": "REG_08",
                "class": "input",
                "type": {
                  "value": "INT",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_29089a8b-ed31-4b8e-8cc7-b944253ce530",
          "type": "variable",
          "position": {
            "x": 769,
            "y": 2746
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2762
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 769,
                "y": 2762
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "2995715",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d36ae3d1-ff06-49fd-a930-e91da52709ec",
          "type": "variable",
          "position": {
            "x": 769,
            "y": 2786
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2802
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2802
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 769,
                "y": 2802
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "9177743",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_b48e0e61-8824-4dd0-942a-c0a13c7451a6",
          "type": "variable",
          "position": {
            "x": 769,
            "y": 2826
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2842
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 769,
                  "y": 2842
                },
                "relPosition": {
                  "x": 0,
                  "y": 16
                },
                "id": "input",
                "position": "left",
                "isConnectable": false,
                "type": "target"
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 769,
                "y": 2842
              },
              "relPosition": {
                "x": 0,
                "y": 16
              },
              "id": "input",
              "position": "left",
              "isConnectable": false,
              "type": "target"
            },
            "numericId": "1370614",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
              "handleId": "NODE_ONLINE",
              "variableType": {
                "name": "NODE_ONLINE",
                "class": "output",
                "type": {
                  "value": "BOOL",
                  "definition": "base-type"
                },
                "location": "",
                "initialValue": null,
                "documentation": "",
                "debug": false
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output-right_EN",
          "source": "PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100",
          "sourceHandle": "output-right",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea__ENO_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea_right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8__output-right_right-rail",
          "source": "PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea",
          "sourceHandle": "output-right",
          "target": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8_PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100__left-rail_input",
          "source": "left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output-right_REQ_04",
          "source": "PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84",
          "sourceHandle": "output-right",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb__DONE_04_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100_PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84__output-down_input-top",
          "source": "PARALLEL_OPEN_2846b322-39c1-428a-be60-46981c463100",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb_PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea__output-top_input-down",
          "source": "PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_18ca6825-cc7c-40e0-9e54-c925ffb9f7ea",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84_PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648__output-down_input-top",
          "source": "PARALLEL_OPEN_d27550ef-dfa2-4b2e-80db-e42906a23d84",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output-right_EN",
          "source": "PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648",
          "sourceHandle": "output-right",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a_PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55__ENO_input",
          "source": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55_PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb__output-top_input-down",
          "source": "PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_518c4b5c-922c-416c-bb0c-81ea365a9fdb",
          "targetHandle": "input-down"
        },
        {
          "id": "e_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce_PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55__DONE_05_input-down",
          "source": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_2b82314c-431a-48d6-b75a-fae33f627e55",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648_PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38__output-down_input-top",
          "source": "PARALLEL_OPEN_16670460-de92-4ee2-b24c-bc44405a8648",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38_BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06__output-right_EN",
          "source": "PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38",
          "sourceHandle": "output-right",
          "target": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06_PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14__ENO_input",
          "source": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output-right_EN",
          "source": "PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14",
          "sourceHandle": "output-right",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "EN"
        },
        {
          "id": "e_PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38_BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4__output-down_EN",
          "source": "PARALLEL_OPEN_5f53d764-3df3-4ec3-8e88-1567974b8b38",
          "sourceHandle": "output-down",
          "target": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4_PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14__ENO_input-down",
          "source": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_52904983-43fb-4b41-af24-ea7a50a7aa14",
          "targetHandle": "input-down"
        },
        {
          "id": "e_VARIABLE_5f19af42-5b57-4c1e-8385-72648bf1cac7_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output_REQ",
          "source": "VARIABLE_5f19af42-5b57-4c1e-8385-72648bf1cac7",
          "sourceHandle": "output",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_65b683a2-87a6-4c72-9df8-201009560de8_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output_NODE_ID",
          "source": "VARIABLE_65b683a2-87a6-4c72-9df8-201009560de8",
          "sourceHandle": "output",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "NODE_ID"
        },
        {
          "id": "e_VARIABLE_f73e4645-bf31-4b1b-bcf5-43fe264d27fa_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output_REG_TYPE",
          "source": "VARIABLE_f73e4645-bf31-4b1b-bcf5-43fe264d27fa",
          "sourceHandle": "output",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_93c7dff8-dc63-4c7c-9579-f03f0333ce17_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output_START_ADDR",
          "source": "VARIABLE_93c7dff8-dc63-4c7c-9579-f03f0333ce17",
          "sourceHandle": "output",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_7c4fb78e-b841-45c4-9750-81d7daf0c9c7_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb__output_LENGTH",
          "source": "VARIABLE_7c4fb78e-b841-45c4-9750-81d7daf0c9c7",
          "sourceHandle": "output",
          "target": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_76fffbd7-6d51-4c90-90d3-0ac42579bda3__DONE_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "DONE",
          "target": "VARIABLE_76fffbd7-6d51-4c90-90d3-0ac42579bda3",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_e788c391-5625-43f8-b4f4-0ce849b8d71d__ERROR_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_e788c391-5625-43f8-b4f4-0ce849b8d71d",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_381abee6-a64e-491d-a16c-3584b76b3590__NODE_ONLINE_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "NODE_ONLINE",
          "target": "VARIABLE_381abee6-a64e-491d-a16c-3584b76b3590",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_48b15b1f-3a59-42ec-9852-df488431f61b__COIL_01_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_01",
          "target": "VARIABLE_48b15b1f-3a59-42ec-9852-df488431f61b",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_36d737a8-fa70-44fc-8d4f-6da994f743ca__COIL_02_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_02",
          "target": "VARIABLE_36d737a8-fa70-44fc-8d4f-6da994f743ca",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_aff80b0c-900f-4867-ad92-372df2993781__COIL_03_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_03",
          "target": "VARIABLE_aff80b0c-900f-4867-ad92-372df2993781",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_e7b87598-58e2-4515-b4c9-2336baf7d62a__COIL_04_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_04",
          "target": "VARIABLE_e7b87598-58e2-4515-b4c9-2336baf7d62a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_e9846924-9b51-4257-bdfb-a6a91d406192__COIL_05_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_05",
          "target": "VARIABLE_e9846924-9b51-4257-bdfb-a6a91d406192",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_a10e28d5-f81f-429e-bbe8-8e938dfb8cfe__COIL_06_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_06",
          "target": "VARIABLE_a10e28d5-f81f-429e-bbe8-8e938dfb8cfe",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_f3a1bbc7-27d5-43e4-9e6c-131d707753f0__COIL_07_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_07",
          "target": "VARIABLE_f3a1bbc7-27d5-43e4-9e6c-131d707753f0",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_d87ffdc5-fa0e-4f52-9881-85232cb85d36__COIL_08_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "COIL_08",
          "target": "VARIABLE_d87ffdc5-fa0e-4f52-9881-85232cb85d36",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_1fc82d2e-a60c-4e8e-9adb-4780bbad28a0__REG_01_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_01",
          "target": "VARIABLE_1fc82d2e-a60c-4e8e-9adb-4780bbad28a0",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_5b3cd36b-746f-4974-872b-e63b1d453e08__REG_02_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_02",
          "target": "VARIABLE_5b3cd36b-746f-4974-872b-e63b1d453e08",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_a5f43ea3-bdb5-47fd-bd3e-4f4b100e888a__REG_03_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_03",
          "target": "VARIABLE_a5f43ea3-bdb5-47fd-bd3e-4f4b100e888a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_f952e228-d851-4277-bdd7-e515dbda43ad__REG_04_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_04",
          "target": "VARIABLE_f952e228-d851-4277-bdd7-e515dbda43ad",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_a6cddd9d-b9f4-408b-87b6-e902df93cdb5__REG_05_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_05",
          "target": "VARIABLE_a6cddd9d-b9f4-408b-87b6-e902df93cdb5",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_71e2903b-ef78-493e-943e-57e9103feafa__REG_06_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_06",
          "target": "VARIABLE_71e2903b-ef78-493e-943e-57e9103feafa",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_5edd299b-f478-48e0-b8e5-c88402df9c83__REG_07_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_07",
          "target": "VARIABLE_5edd299b-f478-48e0-b8e5-c88402df9c83",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb_VARIABLE_e08ff130-ab64-41f7-9ee4-1ddc15ac72d1__REG_08_input",
          "source": "BLOCK_4f527e71-d680-45a0-8776-c15273d3a4bb",
          "sourceHandle": "REG_08",
          "target": "VARIABLE_e08ff130-ab64-41f7-9ee4-1ddc15ac72d1",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_5023feb9-c0c6-46ea-bf7a-b4f3081676c5_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output_REQ",
          "source": "VARIABLE_5023feb9-c0c6-46ea-bf7a-b4f3081676c5",
          "sourceHandle": "output",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_73222ab1-5052-4730-b5c4-81117cd0593b_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output_NODE_ID",
          "source": "VARIABLE_73222ab1-5052-4730-b5c4-81117cd0593b",
          "sourceHandle": "output",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "NODE_ID"
        },
        {
          "id": "e_VARIABLE_aabac02f-4bab-466b-8ad9-4448af808bf1_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output_REG_TYPE",
          "source": "VARIABLE_aabac02f-4bab-466b-8ad9-4448af808bf1",
          "sourceHandle": "output",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_e21b86b7-e80c-4850-828d-254df181e6c1_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output_START_ADDR",
          "source": "VARIABLE_e21b86b7-e80c-4850-828d-254df181e6c1",
          "sourceHandle": "output",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_d6862223-24fe-414a-a6b9-c8410cfaa1d8_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7__output_LENGTH",
          "source": "VARIABLE_d6862223-24fe-414a-a6b9-c8410cfaa1d8",
          "sourceHandle": "output",
          "target": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_4ac07011-98f4-4ec8-b684-d9b495eab0d4__DONE_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "DONE",
          "target": "VARIABLE_4ac07011-98f4-4ec8-b684-d9b495eab0d4",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_89dda293-e07e-4cab-a252-82cd8975950c__ERROR_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_89dda293-e07e-4cab-a252-82cd8975950c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_5c80f31d-912d-4e29-b431-ccb62ba9fed5__NODE_ONLINE_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "NODE_ONLINE",
          "target": "VARIABLE_5c80f31d-912d-4e29-b431-ccb62ba9fed5",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_638c4a6b-bbc7-4572-bb83-2d3c97d735fe__COIL_01_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_01",
          "target": "VARIABLE_638c4a6b-bbc7-4572-bb83-2d3c97d735fe",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_77419f7f-85ec-435e-93e9-5065ffe5f35a__COIL_02_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_02",
          "target": "VARIABLE_77419f7f-85ec-435e-93e9-5065ffe5f35a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_6e4ca534-86ea-4aea-be18-07bba03f2947__COIL_03_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_03",
          "target": "VARIABLE_6e4ca534-86ea-4aea-be18-07bba03f2947",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_e58a590e-d987-4d6b-98bc-69ad7a612e40__COIL_04_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_04",
          "target": "VARIABLE_e58a590e-d987-4d6b-98bc-69ad7a612e40",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_b6a3dbaf-5d7e-4d2d-aca1-7c40700eb525__COIL_05_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_05",
          "target": "VARIABLE_b6a3dbaf-5d7e-4d2d-aca1-7c40700eb525",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_0fcfc01d-7852-4251-aff4-4d47797623f7__COIL_06_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_06",
          "target": "VARIABLE_0fcfc01d-7852-4251-aff4-4d47797623f7",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_438ca551-ae88-48a6-9e95-13ab93f40523__COIL_07_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_07",
          "target": "VARIABLE_438ca551-ae88-48a6-9e95-13ab93f40523",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_19ffdf8b-a610-4b61-b064-2c0353994b0b__COIL_08_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "COIL_08",
          "target": "VARIABLE_19ffdf8b-a610-4b61-b064-2c0353994b0b",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_81a80b25-54f8-4205-b902-cada2df733ae__REG_01_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_01",
          "target": "VARIABLE_81a80b25-54f8-4205-b902-cada2df733ae",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_f9e0fc23-84c3-44f8-98ce-6674ea778fe7__REG_02_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_02",
          "target": "VARIABLE_f9e0fc23-84c3-44f8-98ce-6674ea778fe7",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_beefdd12-2b66-46c8-bce9-ac7c19da69a6__REG_03_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_03",
          "target": "VARIABLE_beefdd12-2b66-46c8-bce9-ac7c19da69a6",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_547497b2-21a3-463a-b928-01b53e7e8418__REG_04_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_04",
          "target": "VARIABLE_547497b2-21a3-463a-b928-01b53e7e8418",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_2a1d9ad3-2e38-4bf1-a357-5ffad9290677__REG_05_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_05",
          "target": "VARIABLE_2a1d9ad3-2e38-4bf1-a357-5ffad9290677",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_013eaeb0-e9aa-4400-a141-cd5981e020d6__REG_06_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_06",
          "target": "VARIABLE_013eaeb0-e9aa-4400-a141-cd5981e020d6",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_6ec9d453-ed52-4edd-8054-abab2fb300fa__REG_07_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_07",
          "target": "VARIABLE_6ec9d453-ed52-4edd-8054-abab2fb300fa",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7_VARIABLE_c8038bf5-0576-404a-9e76-136d97c9aa5e__REG_08_input",
          "source": "BLOCK_b08c1733-6302-43a0-a96c-499d52bbecd7",
          "sourceHandle": "REG_08",
          "target": "VARIABLE_c8038bf5-0576-404a-9e76-136d97c9aa5e",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_585c6244-d0f1-44de-b1d3-2327a60745ff_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REQ",
          "source": "VARIABLE_585c6244-d0f1-44de-b1d3-2327a60745ff",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_204d2aac-5975-4ef3-bcc9-a5d6bec5f1b5_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_NODE_ID",
          "source": "VARIABLE_204d2aac-5975-4ef3-bcc9-a5d6bec5f1b5",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "NODE_ID"
        },
        {
          "id": "e_VARIABLE_bbdd2e32-f559-43eb-9dc9-9bcdd6af2f80_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_TYPE",
          "source": "VARIABLE_bbdd2e32-f559-43eb-9dc9-9bcdd6af2f80",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_bd6a7ee0-5ef1-4756-b553-c7018c6d55bf_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_START_ADDR",
          "source": "VARIABLE_bd6a7ee0-5ef1-4756-b553-c7018c6d55bf",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_39797d3a-83a7-483d-b032-3c8d42146076_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_LENGTH",
          "source": "VARIABLE_39797d3a-83a7-483d-b032-3c8d42146076",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_b3fe7a7e-95e8-49b1-aeed-74172335f7b0_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_01",
          "source": "VARIABLE_b3fe7a7e-95e8-49b1-aeed-74172335f7b0",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_01"
        },
        {
          "id": "e_VARIABLE_c6ca0230-d4e9-49ab-98d3-04f449b8f5b7_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_02",
          "source": "VARIABLE_c6ca0230-d4e9-49ab-98d3-04f449b8f5b7",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_02"
        },
        {
          "id": "e_VARIABLE_7b81e677-4fc9-49d0-9654-8f552150ddf7_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_03",
          "source": "VARIABLE_7b81e677-4fc9-49d0-9654-8f552150ddf7",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_03"
        },
        {
          "id": "e_VARIABLE_2f14d5a6-9141-4523-8af7-7b799a07e2ef_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_04",
          "source": "VARIABLE_2f14d5a6-9141-4523-8af7-7b799a07e2ef",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_04"
        },
        {
          "id": "e_VARIABLE_6ee39a90-8743-4dc9-a9cc-54cd59c5a9bf_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_05",
          "source": "VARIABLE_6ee39a90-8743-4dc9-a9cc-54cd59c5a9bf",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_05"
        },
        {
          "id": "e_VARIABLE_f0aafa32-4880-4747-b47d-7bcbaf69aba6_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_06",
          "source": "VARIABLE_f0aafa32-4880-4747-b47d-7bcbaf69aba6",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_06"
        },
        {
          "id": "e_VARIABLE_40285e74-eed4-4a93-911f-ac7a1e7d3189_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_07",
          "source": "VARIABLE_40285e74-eed4-4a93-911f-ac7a1e7d3189",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_07"
        },
        {
          "id": "e_VARIABLE_0ee22e06-61f6-43c4-8861-dd25106c4f2c_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_COIL_08",
          "source": "VARIABLE_0ee22e06-61f6-43c4-8861-dd25106c4f2c",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "COIL_08"
        },
        {
          "id": "e_VARIABLE_05aadfd8-ac8d-44e7-9566-c58058cee644_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_01",
          "source": "VARIABLE_05aadfd8-ac8d-44e7-9566-c58058cee644",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_01"
        },
        {
          "id": "e_VARIABLE_b8ea767f-0930-4735-99ab-96979ab75a86_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_02",
          "source": "VARIABLE_b8ea767f-0930-4735-99ab-96979ab75a86",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_02"
        },
        {
          "id": "e_VARIABLE_fdbc3983-648f-4f1b-8859-2943ec37e2bf_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_03",
          "source": "VARIABLE_fdbc3983-648f-4f1b-8859-2943ec37e2bf",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_03"
        },
        {
          "id": "e_VARIABLE_49fad52c-9994-40e5-accd-7c7990742634_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_04",
          "source": "VARIABLE_49fad52c-9994-40e5-accd-7c7990742634",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_04"
        },
        {
          "id": "e_VARIABLE_0fda701f-2b4c-4eaf-b93a-64e8e98501ab_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_05",
          "source": "VARIABLE_0fda701f-2b4c-4eaf-b93a-64e8e98501ab",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_05"
        },
        {
          "id": "e_VARIABLE_5885eceb-a913-460e-85e7-42697f4e19cf_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_06",
          "source": "VARIABLE_5885eceb-a913-460e-85e7-42697f4e19cf",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_06"
        },
        {
          "id": "e_VARIABLE_df58ccd7-f247-4b48-83c1-0397aed286eb_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_07",
          "source": "VARIABLE_df58ccd7-f247-4b48-83c1-0397aed286eb",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_07"
        },
        {
          "id": "e_VARIABLE_fc87cadc-ba52-49f2-bf34-0206cc1d897b_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a__output_REG_08",
          "source": "VARIABLE_fc87cadc-ba52-49f2-bf34-0206cc1d897b",
          "sourceHandle": "output",
          "target": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "targetHandle": "REG_08"
        },
        {
          "id": "e_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a_VARIABLE_30eb3f20-9a24-4dff-ac1b-2a695ac5e750__DONE_input",
          "source": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "sourceHandle": "DONE",
          "target": "VARIABLE_30eb3f20-9a24-4dff-ac1b-2a695ac5e750",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a_VARIABLE_e6ed7df1-da55-4cf0-8910-b936aa0daf31__ERROR_input",
          "source": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_e6ed7df1-da55-4cf0-8910-b936aa0daf31",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a_VARIABLE_d63c9cdb-a26c-48fc-97a2-357ab15a085d__NODE_ONLINE_input",
          "source": "BLOCK_70037b26-adcc-449d-8930-3bd4ebe8547a",
          "sourceHandle": "NODE_ONLINE",
          "target": "VARIABLE_d63c9cdb-a26c-48fc-97a2-357ab15a085d",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_10418199-32be-447c-a446-3e40d6431498_BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06__output_IN",
          "source": "VARIABLE_10418199-32be-447c-a446-3e40d6431498",
          "sourceHandle": "output",
          "target": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06_VARIABLE_78ddc646-0108-470d-a4b9-48f4e32928fe__OUT_input",
          "source": "BLOCK_d7cc35f8-0180-4202-8749-2118a4cd6b06",
          "sourceHandle": "OUT",
          "target": "VARIABLE_78ddc646-0108-470d-a4b9-48f4e32928fe",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_4f902aea-a13e-40df-9cec-3e02fd21c5db_BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4__output_IN",
          "source": "VARIABLE_4f902aea-a13e-40df-9cec-3e02fd21c5db",
          "sourceHandle": "output",
          "target": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4_VARIABLE_47c7d5c4-1a44-42e0-9a75-310d191569f3__OUT_input",
          "source": "BLOCK_986a61a8-424f-41c8-9e43-2c6f7051c1e4",
          "sourceHandle": "OUT",
          "target": "VARIABLE_47c7d5c4-1a44-42e0-9a75-310d191569f3",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_5892399b-5d2f-48c0-b700-b9cfeda0f6bf_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REQ",
          "source": "VARIABLE_5892399b-5d2f-48c0-b700-b9cfeda0f6bf",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_484af5eb-6452-49d0-9bce-fe318e771a69_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_NODE_ID",
          "source": "VARIABLE_484af5eb-6452-49d0-9bce-fe318e771a69",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "NODE_ID"
        },
        {
          "id": "e_VARIABLE_38a2e9e8-5913-453c-a209-14063bf44b0c_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_TYPE",
          "source": "VARIABLE_38a2e9e8-5913-453c-a209-14063bf44b0c",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_f36cb153-ff86-45f6-b7df-c660f2f3acf3_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_START_ADDR",
          "source": "VARIABLE_f36cb153-ff86-45f6-b7df-c660f2f3acf3",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_7e8065ab-66e6-4ba6-aaca-8607ea73fb87_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_LENGTH",
          "source": "VARIABLE_7e8065ab-66e6-4ba6-aaca-8607ea73fb87",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_97835b72-06d5-447c-884c-3f6c02f23fb4_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_01",
          "source": "VARIABLE_97835b72-06d5-447c-884c-3f6c02f23fb4",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_01"
        },
        {
          "id": "e_VARIABLE_c3e85222-ecbf-4e0e-950f-8df584131316_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_02",
          "source": "VARIABLE_c3e85222-ecbf-4e0e-950f-8df584131316",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_02"
        },
        {
          "id": "e_VARIABLE_1b146336-1e52-4650-9531-e0bc365a2934_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_03",
          "source": "VARIABLE_1b146336-1e52-4650-9531-e0bc365a2934",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_03"
        },
        {
          "id": "e_VARIABLE_5c827d04-f14a-4fea-8705-b898768939fb_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_04",
          "source": "VARIABLE_5c827d04-f14a-4fea-8705-b898768939fb",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_04"
        },
        {
          "id": "e_VARIABLE_2525e584-e82d-4344-88e2-b0d2f9fa2033_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_05",
          "source": "VARIABLE_2525e584-e82d-4344-88e2-b0d2f9fa2033",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_05"
        },
        {
          "id": "e_VARIABLE_c999aa26-06cc-43e0-8b4c-9a80af232709_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_06",
          "source": "VARIABLE_c999aa26-06cc-43e0-8b4c-9a80af232709",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_06"
        },
        {
          "id": "e_VARIABLE_58d68f28-14d0-4a5d-bc85-ee5ee88ee15a_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_07",
          "source": "VARIABLE_58d68f28-14d0-4a5d-bc85-ee5ee88ee15a",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_07"
        },
        {
          "id": "e_VARIABLE_f67ff0cf-a01d-404a-a400-30ffe5c96b66_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_COIL_08",
          "source": "VARIABLE_f67ff0cf-a01d-404a-a400-30ffe5c96b66",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "COIL_08"
        },
        {
          "id": "e_VARIABLE_d8b6eb85-738b-4d4c-ad9e-497a6df07cee_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_01",
          "source": "VARIABLE_d8b6eb85-738b-4d4c-ad9e-497a6df07cee",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_01"
        },
        {
          "id": "e_VARIABLE_70513c2d-712c-4e7d-9f3a-d431f092d661_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_02",
          "source": "VARIABLE_70513c2d-712c-4e7d-9f3a-d431f092d661",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_02"
        },
        {
          "id": "e_VARIABLE_25e6b522-f2fb-4111-a76c-c1f350a48a7d_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_03",
          "source": "VARIABLE_25e6b522-f2fb-4111-a76c-c1f350a48a7d",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_03"
        },
        {
          "id": "e_VARIABLE_d81b90f5-8528-4d91-bd28-c6191908ef4e_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_04",
          "source": "VARIABLE_d81b90f5-8528-4d91-bd28-c6191908ef4e",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_04"
        },
        {
          "id": "e_VARIABLE_d10abd7f-50af-4a74-be45-1b9e38783a95_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_05",
          "source": "VARIABLE_d10abd7f-50af-4a74-be45-1b9e38783a95",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_05"
        },
        {
          "id": "e_VARIABLE_9fcb27b0-5de8-48a1-855e-bedcb0cccdcd_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_06",
          "source": "VARIABLE_9fcb27b0-5de8-48a1-855e-bedcb0cccdcd",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_06"
        },
        {
          "id": "e_VARIABLE_eb082fdb-2888-41d3-a504-45c5e96b2922_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_07",
          "source": "VARIABLE_eb082fdb-2888-41d3-a504-45c5e96b2922",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_07"
        },
        {
          "id": "e_VARIABLE_5b10ee81-57df-44ad-8c1b-e5a0232dafda_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce__output_REG_08",
          "source": "VARIABLE_5b10ee81-57df-44ad-8c1b-e5a0232dafda",
          "sourceHandle": "output",
          "target": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "targetHandle": "REG_08"
        },
        {
          "id": "e_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce_VARIABLE_29089a8b-ed31-4b8e-8cc7-b944253ce530__DONE_input",
          "source": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "sourceHandle": "DONE",
          "target": "VARIABLE_29089a8b-ed31-4b8e-8cc7-b944253ce530",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce_VARIABLE_d36ae3d1-ff06-49fd-a930-e91da52709ec__ERROR_input",
          "source": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_d36ae3d1-ff06-49fd-a930-e91da52709ec",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce_VARIABLE_b48e0e61-8824-4dd0-942a-c0a13c7451a6__NODE_ONLINE_input",
          "source": "BLOCK_7dad92a5-e719-480a-9dcf-844b3a92edce",
          "sourceHandle": "NODE_ONLINE",
          "target": "VARIABLE_b48e0e61-8824-4dd0-942a-c0a13c7451a6",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
      "comment": "Set Outputs",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        610,
        494
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "type": "powerRail",
          "position": {
            "x": 0,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 3,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "left-rail",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "right": -3
                }
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 3,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "left-rail",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 20,
                "right": -3
              }
            },
            "numericId": "10083399",
            "variant": "left",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "height": 460,
          "width": 204,
          "measured": {
            "width": 204,
            "height": 460
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "DY01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "DY02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "DY03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "DY04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "DY05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "DY06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "DY07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "DY08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "AY01_Scaled",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "AY02_Scaled",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 347,
                  "y": 50
                },
                "relPosition": {
                  "x": 204,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 143,
                  "y": 50
                },
                "relPosition": {
                  "x": 0,
                  "y": 36
                },
                "id": "EN",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 90
                },
                "relPosition": {
                  "x": 0,
                  "y": 76
                },
                "id": "DY01",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 76,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 130
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "DY02",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 116,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 170
                },
                "relPosition": {
                  "x": 0,
                  "y": 156
                },
                "id": "DY03",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 156,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 210
                },
                "relPosition": {
                  "x": 0,
                  "y": 196
                },
                "id": "DY04",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 250
                },
                "relPosition": {
                  "x": 0,
                  "y": 236
                },
                "id": "DY05",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 236,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 290
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "DY06",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 276,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 330
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "DY07",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 370
                },
                "relPosition": {
                  "x": 0,
                  "y": 356
                },
                "id": "DY08",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 356,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 410
                },
                "relPosition": {
                  "x": 0,
                  "y": 396
                },
                "id": "AY01_Scaled",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 396,
                  "left": 0
                }
              },
              {
                "glbPosition": {
                  "x": 143,
                  "y": 450
                },
                "relPosition": {
                  "x": 0,
                  "y": 436
                },
                "id": "AY02_Scaled",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 436,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 347,
                  "y": 50
                },
                "relPosition": {
                  "x": 204,
                  "y": 36
                },
                "id": "ENO",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 36,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 143,
                "y": 50
              },
              "relPosition": {
                "x": 0,
                "y": 36
              },
              "id": "EN",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 36,
                "left": 0
              }
            },
            "outputConnector": {
              "glbPosition": {
                "x": 347,
                "y": 50
              },
              "relPosition": {
                "x": 204,
                "y": 36
              },
              "id": "ENO",
              "position": "right",
              "type": "source",
              "isConnectable": false,
              "style": {
                "top": 36,
                "right": 0
              }
            },
            "numericId": "8072786",
            "variant": {
              "name": "MODBEE_HW_OUTPUTS",
              "type": "function-block",
              "variables": [
                {
                  "name": "EN",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ENO",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY01",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY02",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY03",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY04",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY05",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY06",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY07",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "DY08",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "AY01_Scaled",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                },
                {
                  "name": "AY02_Scaled",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "REAL"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "MODBEE_HW_OUTPUTS0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBEE_OUTPUTS"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "type": "powerRail",
          "position": {
            "x": 607,
            "y": 30
          },
          "height": 40,
          "width": 3,
          "measured": {
            "width": 3,
            "height": 40
          },
          "draggable": false,
          "selectable": false,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                },
                "x": 607
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 297,
                  "y": 50
                },
                "relPosition": {
                  "x": 3,
                  "y": 20
                },
                "id": "right-rail",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 20,
                  "left": -3
                }
              }
            ],
            "outputHandles": [],
            "inputConnector": {
              "glbPosition": {
                "x": 297,
                "y": 50
              },
              "relPosition": {
                "x": 3,
                "y": 20
              },
              "id": "right-rail",
              "position": "left",
              "type": "target",
              "isConnectable": false,
              "style": {
                "top": 20,
                "left": -3
              }
            },
            "numericId": "1171885",
            "variant": "right",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "draggable": false,
            "selectable": false,
            "deletable": false,
            "hasDivergence": false
          }
        },
        {
          "id": "VARIABLE_4e401947-0524-40ab-ba81-4e639d238898",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 74
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 90
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 90
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3982026",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY01",
              "variableType": {
                "name": "DY01",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_3534b195-e19c-4da7-9f14-e60cd7c47092",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 114
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 130
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 130
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6742326",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY02",
              "variableType": {
                "name": "DY02",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4a80ab19-f47f-48f6-a5d4-55ae60d54a01",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 154
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 170
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 170
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "1534318",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY03",
              "variableType": {
                "name": "DY03",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_45fd8614-2338-457a-bbdf-43a274a25e01",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 194
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 210
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 210
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "3302993",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY04",
              "variableType": {
                "name": "DY04",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4552d7fe-df1a-44df-9bc7-9ee2289e0518",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 234
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 250
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 250
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 250
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6752665",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY05",
              "variableType": {
                "name": "DY05",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e18befe5-115a-4287-bf1b-c0019ca8201f",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 274
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 290
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 290
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 290
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "6167019",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY06",
              "variableType": {
                "name": "DY06",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f00d1762-778f-414f-a0c9-3962b3f4364f",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 314
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 330
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 330
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 330
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5287579",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY07",
              "variableType": {
                "name": "DY07",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_82c27969-475a-41ca-86bf-065c5d433d1f",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 354
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 370
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 370
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 370
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "5599443",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "DY08",
              "variableType": {
                "name": "DY08",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_daeb40a1-609a-4f58-8c1f-f4afe91def2e",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 394
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 410
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 410
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 410
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "9332997",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "AY01_Scaled",
              "variableType": {
                "name": "AY01_Scaled",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4b0681bb-a8f1-4e28-a8da-0ea8e35b377e",
          "type": "variable",
          "position": {
            "x": 33,
            "y": 434
          },
          "height": 32,
          "width": 80,
          "measured": {
            "width": 80,
            "height": 32
          },
          "draggable": false,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 450
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "inputHandles": [],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 193,
                  "y": 450
                },
                "relPosition": {
                  "x": 80,
                  "y": 16
                },
                "id": "output",
                "position": "right",
                "isConnectable": false,
                "type": "source"
              }
            ],
            "outputConnector": {
              "glbPosition": {
                "x": 193,
                "y": 450
              },
              "relPosition": {
                "x": 80,
                "y": 16
              },
              "id": "output",
              "position": "right",
              "isConnectable": false,
              "type": "source"
            },
            "numericId": "7732803",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
              "handleId": "AY02_Scaled",
              "variableType": {
                "name": "AY02_Scaled",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "REAL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__left-rail_EN",
          "source": "left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "sourceHandle": "left-rail",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c_right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54__ENO_right-rail",
          "source": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_4e401947-0524-40ab-ba81-4e639d238898_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY01",
          "source": "VARIABLE_4e401947-0524-40ab-ba81-4e639d238898",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY01"
        },
        {
          "id": "e_VARIABLE_3534b195-e19c-4da7-9f14-e60cd7c47092_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY02",
          "source": "VARIABLE_3534b195-e19c-4da7-9f14-e60cd7c47092",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY02"
        },
        {
          "id": "e_VARIABLE_4a80ab19-f47f-48f6-a5d4-55ae60d54a01_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY03",
          "source": "VARIABLE_4a80ab19-f47f-48f6-a5d4-55ae60d54a01",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY03"
        },
        {
          "id": "e_VARIABLE_45fd8614-2338-457a-bbdf-43a274a25e01_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY04",
          "source": "VARIABLE_45fd8614-2338-457a-bbdf-43a274a25e01",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY04"
        },
        {
          "id": "e_VARIABLE_4552d7fe-df1a-44df-9bc7-9ee2289e0518_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY05",
          "source": "VARIABLE_4552d7fe-df1a-44df-9bc7-9ee2289e0518",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY05"
        },
        {
          "id": "e_VARIABLE_e18befe5-115a-4287-bf1b-c0019ca8201f_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY06",
          "source": "VARIABLE_e18befe5-115a-4287-bf1b-c0019ca8201f",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY06"
        },
        {
          "id": "e_VARIABLE_f00d1762-778f-414f-a0c9-3962b3f4364f_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY07",
          "source": "VARIABLE_f00d1762-778f-414f-a0c9-3962b3f4364f",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY07"
        },
        {
          "id": "e_VARIABLE_82c27969-475a-41ca-86bf-065c5d433d1f_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_DY08",
          "source": "VARIABLE_82c27969-475a-41ca-86bf-065c5d433d1f",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "DY08"
        },
        {
          "id": "e_VARIABLE_daeb40a1-609a-4f58-8c1f-f4afe91def2e_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_AY01_Scaled",
          "source": "VARIABLE_daeb40a1-609a-4f58-8c1f-f4afe91def2e",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "AY01_Scaled"
        },
        {
          "id": "e_VARIABLE_4b0681bb-a8f1-4e28-a8da-0ea8e35b377e_BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c__output_AY02_Scaled",
          "source": "VARIABLE_4b0681bb-a8f1-4e28-a8da-0ea8e35b377e",
          "sourceHandle": "output",
          "target": "BLOCK_d0f2a63f-4bd8-4289-973d-f0e902ef471c",
          "targetHandle": "AY02_Scaled"
        }
      ]
    }
  ]
}
END_PROGRAM