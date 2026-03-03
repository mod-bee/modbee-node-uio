PROGRAM main
VAR
	MODBEE_HW_INPUTS0 : MODBEE_HW_INPUTS;
	MODBEE_HW_OUTPUTS0 : MODBEE_HW_OUTPUTS;
	start : bool;
	stop : bool;
	run : bool;
	MB_SLAVE_DO : ARRAY [0..31] OF BOOL;
	MB_SLAVE_DI : ARRAY [0..31] OF BOOL;
	MB_WRITE_COILS_DONE : bool;
	MB_READ_COILS_DONE : bool;
	TON0 : TON;
	TON1 : TON;
	TON1_DONE : bool;
	TON0_DONE : bool;
	MB_READ_REGS_DONE : bool;
	MB_SLAVE_AI : ARRAY [0..31] OF INT;
	MB_WRITE_REGS_DONE : bool;
	MB_SLAVE_AO : ARRAY [0..31] OF REAL;
	MB_SLAVE_AO_TEMP : ARRAY [0..31] OF INT;
	MB_WRITE_REGS_DONE0 : bool;
	MODBUS_READ_ARRAY0 : MODBUS_READ_ARRAY;
	MODBUS_READ_ARRAY1 : MODBUS_READ_ARRAY;
	MODBUS_WRITE_ARRAY0 : MODBUS_WRITE_ARRAY;
	MODBUS_WRITE_ARRAY1 : MODBUS_WRITE_ARRAY;
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
        598,
        574
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
          "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "type": "block",
          "position": {
            "x": 143,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                  "x": 335,
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
                "x": 335,
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
            "numericId": "9305850",
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
                "definition": "user-data-type",
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
                "handleId": "DX02",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_DO[1]",
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
                "handleId": "DX01",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_DO[0]",
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
                  "name": "MB_SLAVE_DO[2]",
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
                  "name": "MB_SLAVE_DO[3]",
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
                  "name": "MB_SLAVE_DO[4]",
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
                  "name": "MB_SLAVE_DO[5]",
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
                  "name": "MB_SLAVE_DO[6]",
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
                  "name": "MB_SLAVE_DO[7]",
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
                  "name": "MB_SLAVE_AO[0]",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "AX02_Scaled",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AO[1]",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "AX03_Scaled",
                "type": "output",
                "variable": {
                  "name": ""
                }
              },
              {
                "handleId": "AX04_Scaled",
                "type": "output",
                "variable": {
                  "name": ""
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "type": "powerRail",
          "position": {
            "x": 595,
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
                "x": 595
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
          "id": "VARIABLE_d56b03bf-96ee-4eee-a405-560ac4f93f90",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "4917290",
            "variable": {
              "name": "MB_SLAVE_DO[0]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_7ad61319-b8ee-4683-a71c-eba88b7f8fd2",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "5078656",
            "variable": {
              "name": "MB_SLAVE_DO[1]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_9fb523b5-57f1-4ee8-9fd9-4d8a45dda64c",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "2056448",
            "variable": {
              "name": "MB_SLAVE_DO[2]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_ebf0ebc4-b4f2-4e3e-b305-d45e4b8d020c",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "949890",
            "variable": {
              "name": "MB_SLAVE_DO[3]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_ccbb16c2-4b0c-40a0-b20b-098d3db9666f",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "1041583",
            "variable": {
              "name": "MB_SLAVE_DO[4]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_d62dade3-6e28-474d-8ea7-781a71390bd1",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "6140128",
            "variable": {
              "name": "MB_SLAVE_DO[5]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_00b7955b-eb73-4e61-afed-fc0abdf55c4d",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "5335307",
            "variable": {
              "name": "MB_SLAVE_DO[6]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_19574d15-565f-4d8b-a639-b7ee034e14da",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "1813403",
            "variable": {
              "name": "MB_SLAVE_DO[7]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_b4856512-3be9-472a-a87e-a5f08a6d4a71",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "7416050",
            "variable": {
              "name": "MB_SLAVE_AO[0]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
          "id": "VARIABLE_63aa132a-23f0-4ef7-ade1-06f758cd3ae6",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "2298696",
            "variable": {
              "name": "MB_SLAVE_AO[1]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_7c2e4d61-a316-4f2d-ab52-237347436108",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "10033034",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_355c2812-aeeb-49db-83f7-b070448160ae",
          "type": "variable",
          "position": {
            "x": 365,
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
                  "x": 365,
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
                  "x": 365,
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
                "x": 365,
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
            "numericId": "861761",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
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
            "deletable": false,
            "wrongVariable": true
          }
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110_BLOCK_853349ab-2010-45bf-ba29-305408c552be__left-rail_EN",
          "source": "left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "sourceHandle": "left-rail",
          "target": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110__ENO_right-rail",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_d56b03bf-96ee-4eee-a405-560ac4f93f90__DX01_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX01",
          "target": "VARIABLE_d56b03bf-96ee-4eee-a405-560ac4f93f90",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_7ad61319-b8ee-4683-a71c-eba88b7f8fd2__DX02_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX02",
          "target": "VARIABLE_7ad61319-b8ee-4683-a71c-eba88b7f8fd2",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_9fb523b5-57f1-4ee8-9fd9-4d8a45dda64c__DX03_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX03",
          "target": "VARIABLE_9fb523b5-57f1-4ee8-9fd9-4d8a45dda64c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_ebf0ebc4-b4f2-4e3e-b305-d45e4b8d020c__DX04_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX04",
          "target": "VARIABLE_ebf0ebc4-b4f2-4e3e-b305-d45e4b8d020c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_ccbb16c2-4b0c-40a0-b20b-098d3db9666f__DX05_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX05",
          "target": "VARIABLE_ccbb16c2-4b0c-40a0-b20b-098d3db9666f",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_d62dade3-6e28-474d-8ea7-781a71390bd1__DX06_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX06",
          "target": "VARIABLE_d62dade3-6e28-474d-8ea7-781a71390bd1",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_00b7955b-eb73-4e61-afed-fc0abdf55c4d__DX07_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX07",
          "target": "VARIABLE_00b7955b-eb73-4e61-afed-fc0abdf55c4d",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_19574d15-565f-4d8b-a639-b7ee034e14da__DX08_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "DX08",
          "target": "VARIABLE_19574d15-565f-4d8b-a639-b7ee034e14da",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_b4856512-3be9-472a-a87e-a5f08a6d4a71__AX01_Scaled_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "AX01_Scaled",
          "target": "VARIABLE_b4856512-3be9-472a-a87e-a5f08a6d4a71",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_63aa132a-23f0-4ef7-ade1-06f758cd3ae6__AX02_Scaled_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "AX02_Scaled",
          "target": "VARIABLE_63aa132a-23f0-4ef7-ade1-06f758cd3ae6",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_7c2e4d61-a316-4f2d-ab52-237347436108__AX03_Scaled_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "AX03_Scaled",
          "target": "VARIABLE_7c2e4d61-a316-4f2d-ab52-237347436108",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_853349ab-2010-45bf-ba29-305408c552be_VARIABLE_355c2812-aeeb-49db-83f7-b070448160ae__AX04_Scaled_input",
          "source": "BLOCK_853349ab-2010-45bf-ba29-305408c552be",
          "sourceHandle": "AX04_Scaled",
          "target": "VARIABLE_355c2812-aeeb-49db-83f7-b070448160ae",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
      "comment": "Polling Timer for Modbus Master",
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
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
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
        1366
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
          "id": "PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9",
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
            "numericId": "9122102",
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
            "parallelCloseReference": "PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55",
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
          "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "type": "block",
          "position": {
            "x": 147,
            "y": 14
          },
          "height": 260,
          "width": 204,
          "measured": {
            "width": 204,
            "height": 260
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
                "id": "SLAVE_ID",
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
                  "x": 351,
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
              {
                "glbPosition": {
                  "x": 351,
                  "y": 90
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 130
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 170
                },
                "relPosition": {
                  "x": 204,
                  "y": 156
                },
                "id": "COILS",
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
                  "x": 351,
                  "y": 210
                },
                "relPosition": {
                  "x": 204,
                  "y": 196
                },
                "id": "REGS",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
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
                "id": "SLAVE_ID",
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
                  "x": 351,
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
              {
                "glbPosition": {
                  "x": 351,
                  "y": 90
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 130
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 170
                },
                "relPosition": {
                  "x": 204,
                  "y": 156
                },
                "id": "COILS",
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
                  "x": 351,
                  "y": 210
                },
                "relPosition": {
                  "x": 204,
                  "y": 196
                },
                "id": "REGS",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
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
                "x": 351,
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
            "numericId": "3123635",
            "variant": {
              "name": "MODBUS_READ_ARRAY",
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
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "SLAVE_ID",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "COILS",
                  "class": "output",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF BOOL"
                  }
                },
                {
                  "name": "REGS",
                  "class": "output",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "MODBUS_READ_ARRAY0",
              "type": {
                "definition": "derived",
                "value": "MODBUS_READ_ARRAY"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "COILS",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_DI",
                  "class": "local",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..7] OF BOOL",
                    "data": {
                      "baseType": {
                        "definition": "base-type",
                        "value": "bool"
                      },
                      "dimensions": [
                        {
                          "dimension": "0..7"
                        }
                      ]
                    }
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
                "handleId": "DONE",
                "type": "output",
                "variable": {
                  "name": "MB_READ_COILS_DONE",
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
                "handleId": "SLAVE_ID",
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
                "handleId": "REG_TYPE",
                "type": "input",
                "variable": {
                  "name": "1"
                }
              },
              {
                "handleId": "REGS",
                "type": "output",
                "variable": {
                  "name": ""
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
          "id": "PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 353
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                "y": 354
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
                "y": 354
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
            "numericId": "5622806",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 354
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
                "y": 354
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
            "parallelCloseReference": "PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675",
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
          "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "type": "block",
          "position": {
            "x": 147,
            "y": 318
          },
          "height": 260,
          "width": 204,
          "measured": {
            "width": 204,
            "height": 260
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 354
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
                  "y": 394
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
                  "y": 434
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 474
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
                  "y": 514
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
                  "y": 554
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
                  "x": 351,
                  "y": 354
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
              {
                "glbPosition": {
                  "x": 351,
                  "y": 394
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 434
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 474
                },
                "relPosition": {
                  "x": 204,
                  "y": 156
                },
                "id": "COILS",
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
                  "x": 351,
                  "y": 514
                },
                "relPosition": {
                  "x": 204,
                  "y": 196
                },
                "id": "REGS",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 354
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
                  "y": 394
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
                  "y": 434
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 474
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
                  "y": 514
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
                  "y": 554
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
                  "x": 351,
                  "y": 354
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
              {
                "glbPosition": {
                  "x": 351,
                  "y": 394
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 434
                },
                "relPosition": {
                  "x": 204,
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
                  "x": 351,
                  "y": 474
                },
                "relPosition": {
                  "x": 204,
                  "y": 156
                },
                "id": "COILS",
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
                  "x": 351,
                  "y": 514
                },
                "relPosition": {
                  "x": 204,
                  "y": 196
                },
                "id": "REGS",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 196,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 354
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
                "x": 351,
                "y": 354
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
            "numericId": "270264",
            "variant": {
              "name": "MODBUS_READ_ARRAY",
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
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "SLAVE_ID",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ERROR",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "COILS",
                  "class": "output",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF BOOL"
                  }
                },
                {
                  "name": "REGS",
                  "class": "output",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT"
                  }
                }
              ],
              "documentation": "",
              "extensible": false
            },
            "variable": {
              "name": "MODBUS_READ_ARRAY1",
              "type": {
                "definition": "derived",
                "value": "MODBUS_READ_ARRAY"
              },
              "class": "local",
              "location": "",
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "executionControl": true,
            "lockExecutionControl": false,
            "connectedVariables": [
              {
                "handleId": "REGS",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AI",
                  "class": "local",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT",
                    "data": {
                      "baseType": {
                        "definition": "base-type",
                        "value": "int"
                      },
                      "dimensions": [
                        {
                          "dimension": "0..31"
                        }
                      ]
                    }
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
                  "name": "MB_READ_COILS_DONE",
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
                "handleId": "DONE",
                "type": "output",
                "variable": {
                  "name": "MB_READ_REGS_DONE",
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
                "handleId": "SLAVE_ID",
                "type": "input",
                "variable": {
                  "name": "1"
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
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true,
            "hasDivergence": false
          }
        },
        {
          "id": "PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 657
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                "y": 658
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
                "y": 658
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
            "numericId": "1925303",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 658
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
                "y": 658
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
            "parallelCloseReference": "PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972",
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
          "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "type": "block",
          "position": {
            "x": 147,
            "y": 622
          },
          "height": 340,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 340
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 658
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
                  "y": 698
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
                  "y": 738
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 778
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
                  "y": 818
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
                  "y": 858
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
                  "y": 898
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COILS",
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
                  "y": 938
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "REGS",
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
                  "x": 363,
                  "y": 658
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
                  "y": 698
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
                  "y": 738
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
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 658
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
                  "y": 698
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
                  "y": 738
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 778
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
                  "y": 818
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
                  "y": 858
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
                  "y": 898
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COILS",
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
                  "y": 938
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "REGS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 363,
                  "y": 658
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
                  "y": 698
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
                  "y": 738
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
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 658
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
                "y": 658
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
            "numericId": "4033391",
            "variant": {
              "name": "MODBUS_WRITE_ARRAY",
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
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "SLAVE_ID",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "COILS",
                  "class": "input",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF BOOL"
                  }
                },
                {
                  "name": "REGS",
                  "class": "input",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT"
                  }
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ERROR",
                  "class": "output",
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
              "name": "MODBUS_WRITE_ARRAY0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_WRITE_ARRAY"
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
                  "name": "MB_READ_REGS_DONE",
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
                "handleId": "SLAVE_ID",
                "type": "input",
                "variable": {
                  "name": "1"
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
                "handleId": "COILS",
                "type": "input",
                "variable": {
                  "name": "MB_SLAVE_DO",
                  "class": "local",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF BOOL",
                    "data": {
                      "baseType": {
                        "definition": "base-type",
                        "value": "bool"
                      },
                      "dimensions": [
                        {
                          "dimension": "0..31"
                        }
                      ]
                    }
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "DONE",
                "type": "output",
                "variable": {
                  "name": "MB_WRITE_COILS_DONE",
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
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 1041
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                "y": 1042
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
                "y": 1042
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
            "numericId": "3895863",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 1042
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
                "y": 1042
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
            "parallelCloseReference": "PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588",
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
          "id": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
          "type": "block",
          "position": {
            "x": 147,
            "y": 1006
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
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1042
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
                  "y": 1082
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
                "y": 1042
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
                "y": 1042
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
            "numericId": "5408527",
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
                  "name": "MB_SLAVE_AO[0]",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "OUT",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AO_TEMP[0]",
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
          "id": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "type": "block",
          "position": {
            "x": 147,
            "y": 1150
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
                  "y": 1186
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
                  "y": 1226
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
                  "y": 1186
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
                  "y": 1226
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
                  "y": 1186
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
                  "y": 1226
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
                  "y": 1186
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
                  "y": 1226
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
                "y": 1186
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
                "y": 1186
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
            "numericId": "3098114",
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
                  "name": "MB_SLAVE_AO[1]",
                  "class": "local",
                  "type": {
                    "definition": "base-type",
                    "value": "real"
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "OUT",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AO_TEMP[1]",
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
          "id": "PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588",
          "type": "parallel",
          "position": {
            "x": 399,
            "y": 1041
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                  "y": 1042
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
                "y": 1042
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
                "y": 1042
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
            "numericId": "4444823",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 403,
                "y": 1042
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
                "y": 1042
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
            "parallelOpenReference": "PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1",
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
          "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "type": "block",
          "position": {
            "x": 523,
            "y": 1006
          },
          "height": 340,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 340
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 523,
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1122
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 1162
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
                  "y": 1202
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
                  "y": 1242
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
                  "y": 1282
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COILS",
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
                  "y": 1322
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "REGS",
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
                  "x": 739,
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1122
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
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 523,
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1122
                },
                "relPosition": {
                  "x": 0,
                  "y": 116
                },
                "id": "SLAVE_ID",
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
                  "y": 1162
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
                  "y": 1202
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
                  "y": 1242
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
                  "y": 1282
                },
                "relPosition": {
                  "x": 0,
                  "y": 276
                },
                "id": "COILS",
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
                  "y": 1322
                },
                "relPosition": {
                  "x": 0,
                  "y": 316
                },
                "id": "REGS",
                "position": "left",
                "type": "target",
                "isConnectable": false,
                "style": {
                  "top": 316,
                  "left": 0
                }
              }
            ],
            "outputHandles": [
              {
                "glbPosition": {
                  "x": 739,
                  "y": 1042
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
                  "y": 1082
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
                  "y": 1122
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
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 523,
                "y": 1042
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
                "y": 1042
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
            "numericId": "9994628",
            "variant": {
              "name": "MODBUS_WRITE_ARRAY",
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
                  "name": "REQ",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "SLAVE_ID",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "REG_TYPE",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "START_ADDR",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "WORD"
                  }
                },
                {
                  "name": "LENGTH",
                  "class": "input",
                  "type": {
                    "definition": "base-type",
                    "value": "BYTE"
                  }
                },
                {
                  "name": "COILS",
                  "class": "input",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF BOOL"
                  }
                },
                {
                  "name": "REGS",
                  "class": "input",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT"
                  }
                },
                {
                  "name": "DONE",
                  "class": "output",
                  "type": {
                    "definition": "base-type",
                    "value": "BOOL"
                  }
                },
                {
                  "name": "ERROR",
                  "class": "output",
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
              "name": "MODBUS_WRITE_ARRAY1",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_WRITE_ARRAY"
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
                  "name": "MB_WRITE_COILS_DONE",
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
                "handleId": "REGS",
                "type": "input",
                "variable": {
                  "name": "MB_SLAVE_AO_TEMP",
                  "class": "local",
                  "type": {
                    "definition": "array",
                    "value": "ARRAY [0..31] OF INT",
                    "data": {
                      "baseType": {
                        "definition": "base-type",
                        "value": "int"
                      },
                      "dimensions": [
                        {
                          "dimension": "0..31"
                        }
                      ]
                    }
                  },
                  "location": "",
                  "initialValue": null,
                  "documentation": "",
                  "debug": false
                }
              },
              {
                "handleId": "SLAVE_ID",
                "type": "input",
                "variable": {
                  "name": "1"
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
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972",
          "type": "parallel",
          "position": {
            "x": 859,
            "y": 657
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                  "y": 658
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
                "y": 658
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
                "y": 658
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
            "numericId": "8292437",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 658
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
                "y": 658
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
            "parallelOpenReference": "PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31",
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
          "id": "PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675",
          "type": "parallel",
          "position": {
            "x": 859,
            "y": 353
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                  "y": 354
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
                "y": 354
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
                "y": 354
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
            "numericId": "5464707",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 863,
                "y": 354
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
                "y": 354
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
            "parallelOpenReference": "PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae",
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
          "id": "PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55",
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
            "numericId": "680687",
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
            "parallelOpenReference": "PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9",
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
          "id": "VARIABLE_b9b6b900-b263-4ead-9af9-15821d4fa0c6",
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
            "numericId": "2937862",
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
              "id": "broken-VARIABLE_b9b6b900-b263-4ead-9af9-15821d4fa0c6"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
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
          "id": "VARIABLE_884afd02-a446-43f0-a42e-4c014f818512",
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
            "numericId": "6786414",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_6fc8d3c8-3a8d-4d93-9203-8a78e07a9195",
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
            "numericId": "4678978",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_905de651-9142-401a-a45e-4726e06103e4",
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
            "numericId": "8009340",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_31d17587-e780-4586-a1be-c4011d7a2f67",
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
            "numericId": "4597849",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_1db4eff8-3ddf-4a9e-bb61-2fc63f0726e0",
          "type": "variable",
          "position": {
            "x": 381,
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
                  "x": 381,
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
                  "x": 381,
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
                "x": 381,
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
            "numericId": "5604055",
            "variable": {
              "name": "MB_READ_COILS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_1db4eff8-3ddf-4a9e-bb61-2fc63f0726e0"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
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
          "id": "VARIABLE_94472ab5-96dd-43d0-bec3-35032a5dfd8c",
          "type": "variable",
          "position": {
            "x": 381,
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
                  "x": 381,
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
                  "x": 381,
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
                "x": 381,
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
            "numericId": "8941266",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
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
          "id": "VARIABLE_23d10e83-f2e3-4416-bf6e-5320f8147b30",
          "type": "variable",
          "position": {
            "x": 381,
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
                  "x": 381,
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
                  "x": 381,
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
                "x": 381,
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
            "numericId": "3391490",
            "variable": {
              "name": "MB_SLAVE_DI",
              "class": "local",
              "type": {
                "definition": "array",
                "value": "ARRAY [0..31] OF BOOL",
                "data": {
                  "baseType": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "dimensions": [
                    {
                      "dimension": "0..31"
                    }
                  ]
                }
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_23d10e83-f2e3-4416-bf6e-5320f8147b30"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "COILS",
              "variableType": {
                "name": "COILS",
                "class": "output",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF BOOL"
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
          "id": "VARIABLE_029be376-3138-486c-b535-d47f61da63e0",
          "type": "variable",
          "position": {
            "x": 381,
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
                  "x": 381,
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
                  "x": 381,
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
                "x": 381,
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
            "numericId": "4516135",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
              "handleId": "REGS",
              "variableType": {
                "name": "REGS",
                "class": "output",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_75af6f0b-d961-4c6b-9060-6ba379fd8c84",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 378
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
                  "y": 394
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
                  "y": 394
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
                "y": 394
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
            "numericId": "7179041",
            "variable": {
              "name": "MB_READ_COILS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_75af6f0b-d961-4c6b-9060-6ba379fd8c84"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
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
          "id": "VARIABLE_b44c03a5-94fb-49aa-a344-4084eda1afed",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 418
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
                  "y": 434
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
                  "y": 434
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
                "y": 434
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
            "numericId": "4914936",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_bfdb1db2-4e24-4162-866f-73c47b04dca6",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 458
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
                  "y": 474
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
                  "y": 474
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
                "y": 474
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
            "numericId": "5709210",
            "variable": {
              "name": "3"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_17211e43-3be3-4ff6-b58d-335c1c7e3989",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 498
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
                  "y": 514
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
                  "y": 514
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
                "y": 514
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
            "numericId": "8736912",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_1e5f22b0-34c5-4105-85c4-221f57aa9e64",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 538
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
                  "y": 554
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
                  "y": 554
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
                "y": 554
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
            "numericId": "7932966",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_bd135a39-c85b-46b5-a931-18554278097d",
          "type": "variable",
          "position": {
            "x": 381,
            "y": 378
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
                  "x": 381,
                  "y": 394
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
                  "x": 381,
                  "y": 394
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
                "x": 381,
                "y": 394
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
            "numericId": "4325696",
            "variable": {
              "name": "MB_READ_REGS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_bd135a39-c85b-46b5-a931-18554278097d"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
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
          "id": "VARIABLE_bcd948ba-7ce8-4c47-939e-a5b138b369ab",
          "type": "variable",
          "position": {
            "x": 381,
            "y": 418
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
                  "x": 381,
                  "y": 434
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
                  "x": 381,
                  "y": 434
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
                "x": 381,
                "y": 434
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
            "numericId": "9125982",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
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
          "id": "VARIABLE_bf85e1c9-0aef-40b7-b624-4d995711f631",
          "type": "variable",
          "position": {
            "x": 381,
            "y": 458
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
                  "x": 381,
                  "y": 474
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
                  "x": 381,
                  "y": 474
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
                "x": 381,
                "y": 474
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
            "numericId": "7384940",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "COILS",
              "variableType": {
                "name": "COILS",
                "class": "output",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_f93dde8a-13a1-484f-883b-6c575d827f05",
          "type": "variable",
          "position": {
            "x": 381,
            "y": 498
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
                  "x": 381,
                  "y": 514
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
                  "x": 381,
                  "y": 514
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
                "x": 381,
                "y": 514
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
            "numericId": "6451407",
            "variable": {
              "name": "MB_SLAVE_AI",
              "class": "local",
              "type": {
                "definition": "array",
                "value": "ARRAY [0..31] OF INT",
                "data": {
                  "baseType": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "dimensions": [
                    {
                      "dimension": "0..31"
                    }
                  ]
                }
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_f93dde8a-13a1-484f-883b-6c575d827f05"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
              "handleId": "REGS",
              "variableType": {
                "name": "REGS",
                "class": "output",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF INT"
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
          "id": "VARIABLE_1cda2008-c426-40fc-9b06-88dae32e3868",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 682
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
                  "y": 698
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
                  "y": 698
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
                "y": 698
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
            "numericId": "10206814",
            "variable": {
              "name": "MB_READ_REGS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_1cda2008-c426-40fc-9b06-88dae32e3868"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
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
          "id": "VARIABLE_1cf2a225-bd5d-425c-a494-41026ac071ae",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 722
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
                  "y": 738
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
                  "y": 738
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
                "y": 738
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
            "numericId": "1200426",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_109fe00e-8caa-41b7-930f-b6344b5e1494",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 762
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
                  "y": 778
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
                  "y": 778
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
                "y": 778
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
            "numericId": "1673851",
            "variable": {
              "name": "0"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_9b734f0c-6fed-4dfa-b1d9-a7c13626afc0",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 802
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
                  "y": 818
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
                  "y": 818
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
                "y": 818
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
            "numericId": "7704413",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_301ae5f9-3b8e-4168-ba2b-953049b7d2d0",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 842
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
                  "y": 858
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
                  "y": 858
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
                "y": 858
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
            "numericId": "8965154",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_23f2adc0-7cc0-4cf4-8479-bc2eaf1a2681",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 882
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
                  "y": 898
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
                  "y": 898
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
                "y": 898
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
            "numericId": "3905352",
            "variable": {
              "name": "MB_SLAVE_DO",
              "class": "local",
              "type": {
                "definition": "array",
                "value": "ARRAY [0..31] OF BOOL",
                "data": {
                  "baseType": {
                    "definition": "base-type",
                    "value": "bool"
                  },
                  "dimensions": [
                    {
                      "dimension": "0..31"
                    }
                  ]
                }
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_23f2adc0-7cc0-4cf4-8479-bc2eaf1a2681"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "COILS",
              "variableType": {
                "name": "COILS",
                "class": "input",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF BOOL"
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
          "id": "VARIABLE_d7978873-8e3c-4807-8478-e8c9ddada89a",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 922
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
                  "y": 938
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
                  "y": 938
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
                "y": 938
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
            "numericId": "4985659",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "REGS",
              "variableType": {
                "name": "REGS",
                "class": "input",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF INT"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_03f180ae-4ae0-4d8b-9951-211beaeaf7c5",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 682
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
                  "y": 698
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
                  "y": 698
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
                "y": 698
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
            "numericId": "9057353",
            "variable": {
              "name": "MB_WRITE_COILS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_03f180ae-4ae0-4d8b-9951-211beaeaf7c5"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
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
          "id": "VARIABLE_8bfafa09-b72c-49b2-a770-e60d64b12be9",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 722
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
                  "y": 738
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
                  "y": 738
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
                "y": 738
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
            "numericId": "3446893",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
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
          "id": "VARIABLE_f3fe70a1-50d0-411f-bf23-65e1c22fe6c8",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1066
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
                  "y": 1082
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
                  "y": 1082
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
                "y": 1082
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
            "numericId": "4215277",
            "variable": {
              "name": "MB_SLAVE_AO[0]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_651c73c9-1df8-4036-b857-630fb58fe324",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 1066
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
                  "y": 1082
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
                  "y": 1082
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
                "y": 1082
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
            "numericId": "5007420",
            "variable": {
              "name": "MB_SLAVE_AO_TEMP[0]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_917983e5-f451-4b37-afa8-88fd60048ad0",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1210
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
                  "y": 1226
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
                  "y": 1226
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
                "y": 1226
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
            "numericId": "10561982",
            "variable": {
              "name": "MB_SLAVE_AO[1]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_c4725e57-6ecf-48d5-aad5-32e7f2727759",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 1210
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
                  "y": 1226
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
                  "y": 1226
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
                "y": 1226
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
            "numericId": "6675771",
            "variable": {
              "name": "MB_SLAVE_AO_TEMP[1]",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_1cfd0720-42f8-47b6-b955-77ada10e214c",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1066
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
                  "y": 1082
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
                  "y": 1082
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
                "y": 1082
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
            "numericId": "4920837",
            "variable": {
              "name": "MB_WRITE_COILS_DONE",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_1cfd0720-42f8-47b6-b955-77ada10e214c"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "REQ",
              "variableType": {
                "name": "REQ",
                "class": "input",
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
          "id": "VARIABLE_1566d602-7131-4017-903c-9e923e41192c",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1106
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
                  "y": 1122
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
                  "y": 1122
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
                "y": 1122
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
            "numericId": "8457363",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_144cbadf-ff74-466d-a1df-55a43f9c19be",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1146
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
                  "y": 1162
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
                  "y": 1162
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
                "y": 1162
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
            "numericId": "4135409",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "REG_TYPE",
              "variableType": {
                "name": "REG_TYPE",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_355e4c49-a0ec-40f5-8ef8-015de2ae4d10",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1186
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
                  "y": 1202
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
                  "y": 1202
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
                "y": 1202
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
            "numericId": "8548196",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "START_ADDR",
              "variableType": {
                "name": "START_ADDR",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "WORD"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_4e03fd2b-201b-4797-a572-cb34c77fb074",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1226
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
                  "y": 1242
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
                  "y": 1242
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
                "y": 1242
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
            "numericId": "2877314",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "LENGTH",
              "variableType": {
                "name": "LENGTH",
                "class": "input",
                "type": {
                  "definition": "base-type",
                  "value": "BYTE"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_825895fa-3ec9-4c68-9ad1-232e2ddc4829",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1266
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
                  "y": 1282
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
                  "y": 1282
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
                "y": 1282
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
            "numericId": "9618190",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "COILS",
              "variableType": {
                "name": "COILS",
                "class": "input",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF BOOL"
                }
              }
            },
            "draggable": false,
            "selectable": true,
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_28622f25-f00b-4e0d-8d5e-3666aed30ad0",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 1306
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
                  "y": 1322
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
                  "y": 1322
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
                "y": 1322
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
            "numericId": "10732213",
            "variable": {
              "name": "MB_SLAVE_AO_TEMP",
              "class": "local",
              "type": {
                "definition": "array",
                "value": "ARRAY [0..31] OF INT",
                "data": {
                  "baseType": {
                    "definition": "base-type",
                    "value": "int"
                  },
                  "dimensions": [
                    {
                      "dimension": "0..31"
                    }
                  ]
                }
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_28622f25-f00b-4e0d-8d5e-3666aed30ad0"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "REGS",
              "variableType": {
                "name": "REGS",
                "class": "input",
                "type": {
                  "definition": "array",
                  "value": "ARRAY [0..31] OF INT"
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
          "id": "VARIABLE_275ff22c-b937-4961-99e7-ec3cca3c261a",
          "type": "variable",
          "position": {
            "x": 769,
            "y": 1066
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
                  "y": 1082
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
                  "y": 1082
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
                "y": 1082
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
            "numericId": "2928091",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "DONE",
              "variableType": {
                "name": "DONE",
                "class": "output",
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
          "id": "VARIABLE_2748c951-5f3d-4723-b6e0-f4aa3cebf966",
          "type": "variable",
          "position": {
            "x": 769,
            "y": 1106
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
                  "y": 1122
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
                  "y": 1122
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
                "y": 1122
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
            "numericId": "10641542",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
              "handleId": "ERROR",
              "variableType": {
                "name": "ERROR",
                "class": "output",
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
          "id": "e_PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output-right_REQ",
          "source": "PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9",
          "sourceHandle": "output-right",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24_PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55__DONE_input",
          "source": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55_right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8__output-right_right-rail",
          "source": "PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55",
          "sourceHandle": "output-right",
          "target": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9_PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae__output-down_input-top",
          "source": "PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output-right_EN",
          "source": "PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae",
          "sourceHandle": "output-right",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583_PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675__ENO_input",
          "source": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675_PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55__output-top_input-down",
          "source": "PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_f0bbd5dc-4338-4ab4-8d3b-4e3abdae2e55",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae_PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31__output-down_input-top",
          "source": "PARALLEL_OPEN_571039ab-f242-4395-95db-205ee44532ae",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output-right_REQ",
          "source": "PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31",
          "sourceHandle": "output-right",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb_PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972__DONE_input",
          "source": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972_PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675__output-top_input-down",
          "source": "PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_6d571698-53ba-47b1-9b87-f863c78c4675",
          "targetHandle": "input-down"
        },
        {
          "id": "e_BLOCK_a231a868-a591-4999-ba81-b577b38585e6_PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972__DONE_input-down",
          "source": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_d376c80c-d0d4-49cd-9183-ebff4cd2b972",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31_PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1__output-down_input-top",
          "source": "PARALLEL_OPEN_d4b8785a-82a6-4d08-99ab-99b5438f2b31",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1_BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4__output-right_EN",
          "source": "PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1",
          "sourceHandle": "output-right",
          "target": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4_PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588__ENO_input",
          "source": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output-right_REQ",
          "source": "PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588",
          "sourceHandle": "output-right",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "EN"
        },
        {
          "id": "e_PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4__output-down_EN",
          "source": "PARALLEL_OPEN_eda79b2f-549c-490f-958f-c5a32da629c1",
          "sourceHandle": "output-down",
          "target": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4_PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588__ENO_input-down",
          "source": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_765513c3-7a6a-4078-ae33-d7a4b22f8588",
          "targetHandle": "input-down"
        },
        {
          "id": "e_left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8_PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9__left-rail_input",
          "source": "left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_cd55fb4f-77a0-41d7-837a-e2b69f5741d9",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_b9b6b900-b263-4ead-9af9-15821d4fa0c6_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output_REQ",
          "source": "VARIABLE_b9b6b900-b263-4ead-9af9-15821d4fa0c6",
          "sourceHandle": "output",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_884afd02-a446-43f0-a42e-4c014f818512_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output_SLAVE_ID",
          "source": "VARIABLE_884afd02-a446-43f0-a42e-4c014f818512",
          "sourceHandle": "output",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_6fc8d3c8-3a8d-4d93-9203-8a78e07a9195_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output_REG_TYPE",
          "source": "VARIABLE_6fc8d3c8-3a8d-4d93-9203-8a78e07a9195",
          "sourceHandle": "output",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_905de651-9142-401a-a45e-4726e06103e4_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output_START_ADDR",
          "source": "VARIABLE_905de651-9142-401a-a45e-4726e06103e4",
          "sourceHandle": "output",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_31d17587-e780-4586-a1be-c4011d7a2f67_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24__output_LENGTH",
          "source": "VARIABLE_31d17587-e780-4586-a1be-c4011d7a2f67",
          "sourceHandle": "output",
          "target": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24_VARIABLE_1db4eff8-3ddf-4a9e-bb61-2fc63f0726e0__DONE_input",
          "source": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "sourceHandle": "DONE",
          "target": "VARIABLE_1db4eff8-3ddf-4a9e-bb61-2fc63f0726e0",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24_VARIABLE_94472ab5-96dd-43d0-bec3-35032a5dfd8c__ERROR_input",
          "source": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_94472ab5-96dd-43d0-bec3-35032a5dfd8c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24_VARIABLE_23d10e83-f2e3-4416-bf6e-5320f8147b30__COILS_input",
          "source": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "sourceHandle": "COILS",
          "target": "VARIABLE_23d10e83-f2e3-4416-bf6e-5320f8147b30",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24_VARIABLE_029be376-3138-486c-b535-d47f61da63e0__REGS_input",
          "source": "BLOCK_efe30c20-1ead-4477-b9c3-3a90eb834f24",
          "sourceHandle": "REGS",
          "target": "VARIABLE_029be376-3138-486c-b535-d47f61da63e0",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_75af6f0b-d961-4c6b-9060-6ba379fd8c84_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output_REQ",
          "source": "VARIABLE_75af6f0b-d961-4c6b-9060-6ba379fd8c84",
          "sourceHandle": "output",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_b44c03a5-94fb-49aa-a344-4084eda1afed_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output_SLAVE_ID",
          "source": "VARIABLE_b44c03a5-94fb-49aa-a344-4084eda1afed",
          "sourceHandle": "output",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_bfdb1db2-4e24-4162-866f-73c47b04dca6_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output_REG_TYPE",
          "source": "VARIABLE_bfdb1db2-4e24-4162-866f-73c47b04dca6",
          "sourceHandle": "output",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_17211e43-3be3-4ff6-b58d-335c1c7e3989_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output_START_ADDR",
          "source": "VARIABLE_17211e43-3be3-4ff6-b58d-335c1c7e3989",
          "sourceHandle": "output",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_1e5f22b0-34c5-4105-85c4-221f57aa9e64_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583__output_LENGTH",
          "source": "VARIABLE_1e5f22b0-34c5-4105-85c4-221f57aa9e64",
          "sourceHandle": "output",
          "target": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583_VARIABLE_bd135a39-c85b-46b5-a931-18554278097d__DONE_input",
          "source": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "sourceHandle": "DONE",
          "target": "VARIABLE_bd135a39-c85b-46b5-a931-18554278097d",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583_VARIABLE_bcd948ba-7ce8-4c47-939e-a5b138b369ab__ERROR_input",
          "source": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_bcd948ba-7ce8-4c47-939e-a5b138b369ab",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583_VARIABLE_bf85e1c9-0aef-40b7-b624-4d995711f631__COILS_input",
          "source": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "sourceHandle": "COILS",
          "target": "VARIABLE_bf85e1c9-0aef-40b7-b624-4d995711f631",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583_VARIABLE_f93dde8a-13a1-484f-883b-6c575d827f05__REGS_input",
          "source": "BLOCK_764fd233-45c0-474a-bc61-cc12ccf28583",
          "sourceHandle": "REGS",
          "target": "VARIABLE_f93dde8a-13a1-484f-883b-6c575d827f05",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_1cda2008-c426-40fc-9b06-88dae32e3868_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_REQ",
          "source": "VARIABLE_1cda2008-c426-40fc-9b06-88dae32e3868",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_1cf2a225-bd5d-425c-a494-41026ac071ae_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_SLAVE_ID",
          "source": "VARIABLE_1cf2a225-bd5d-425c-a494-41026ac071ae",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_109fe00e-8caa-41b7-930f-b6344b5e1494_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_REG_TYPE",
          "source": "VARIABLE_109fe00e-8caa-41b7-930f-b6344b5e1494",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_9b734f0c-6fed-4dfa-b1d9-a7c13626afc0_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_START_ADDR",
          "source": "VARIABLE_9b734f0c-6fed-4dfa-b1d9-a7c13626afc0",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_301ae5f9-3b8e-4168-ba2b-953049b7d2d0_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_LENGTH",
          "source": "VARIABLE_301ae5f9-3b8e-4168-ba2b-953049b7d2d0",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_23f2adc0-7cc0-4cf4-8479-bc2eaf1a2681_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_COILS",
          "source": "VARIABLE_23f2adc0-7cc0-4cf4-8479-bc2eaf1a2681",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "COILS"
        },
        {
          "id": "e_VARIABLE_d7978873-8e3c-4807-8478-e8c9ddada89a_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb__output_REGS",
          "source": "VARIABLE_d7978873-8e3c-4807-8478-e8c9ddada89a",
          "sourceHandle": "output",
          "target": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "targetHandle": "REGS"
        },
        {
          "id": "e_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb_VARIABLE_03f180ae-4ae0-4d8b-9951-211beaeaf7c5__DONE_input",
          "source": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "sourceHandle": "DONE",
          "target": "VARIABLE_03f180ae-4ae0-4d8b-9951-211beaeaf7c5",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb_VARIABLE_8bfafa09-b72c-49b2-a770-e60d64b12be9__ERROR_input",
          "source": "BLOCK_4cd4b3ff-00f6-472a-a9ea-de00aac1d0fb",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_8bfafa09-b72c-49b2-a770-e60d64b12be9",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_f3fe70a1-50d0-411f-bf23-65e1c22fe6c8_BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4__output_IN",
          "source": "VARIABLE_f3fe70a1-50d0-411f-bf23-65e1c22fe6c8",
          "sourceHandle": "output",
          "target": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4_VARIABLE_651c73c9-1df8-4036-b857-630fb58fe324__OUT_input",
          "source": "BLOCK_61eaad4e-56c7-4e93-a680-742ee6e945f4",
          "sourceHandle": "OUT",
          "target": "VARIABLE_651c73c9-1df8-4036-b857-630fb58fe324",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_917983e5-f451-4b37-afa8-88fd60048ad0_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4__output_IN",
          "source": "VARIABLE_917983e5-f451-4b37-afa8-88fd60048ad0",
          "sourceHandle": "output",
          "target": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4_VARIABLE_c4725e57-6ecf-48d5-aad5-32e7f2727759__OUT_input",
          "source": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "sourceHandle": "OUT",
          "target": "VARIABLE_c4725e57-6ecf-48d5-aad5-32e7f2727759",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_1cfd0720-42f8-47b6-b955-77ada10e214c_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_REQ",
          "source": "VARIABLE_1cfd0720-42f8-47b6-b955-77ada10e214c",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_1566d602-7131-4017-903c-9e923e41192c_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_SLAVE_ID",
          "source": "VARIABLE_1566d602-7131-4017-903c-9e923e41192c",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_144cbadf-ff74-466d-a1df-55a43f9c19be_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_REG_TYPE",
          "source": "VARIABLE_144cbadf-ff74-466d-a1df-55a43f9c19be",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_355e4c49-a0ec-40f5-8ef8-015de2ae4d10_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_START_ADDR",
          "source": "VARIABLE_355e4c49-a0ec-40f5-8ef8-015de2ae4d10",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_4e03fd2b-201b-4797-a572-cb34c77fb074_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_LENGTH",
          "source": "VARIABLE_4e03fd2b-201b-4797-a572-cb34c77fb074",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_825895fa-3ec9-4c68-9ad1-232e2ddc4829_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_COILS",
          "source": "VARIABLE_825895fa-3ec9-4c68-9ad1-232e2ddc4829",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "COILS"
        },
        {
          "id": "e_VARIABLE_28622f25-f00b-4e0d-8d5e-3666aed30ad0_BLOCK_a231a868-a591-4999-ba81-b577b38585e6__output_REGS",
          "source": "VARIABLE_28622f25-f00b-4e0d-8d5e-3666aed30ad0",
          "sourceHandle": "output",
          "target": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "targetHandle": "REGS"
        },
        {
          "id": "e_BLOCK_a231a868-a591-4999-ba81-b577b38585e6_VARIABLE_275ff22c-b937-4961-99e7-ec3cca3c261a__DONE_input",
          "source": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "sourceHandle": "DONE",
          "target": "VARIABLE_275ff22c-b937-4961-99e7-ec3cca3c261a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_a231a868-a591-4999-ba81-b577b38585e6_VARIABLE_2748c951-5f3d-4723-b6e0-f4aa3cebf966__ERROR_input",
          "source": "BLOCK_a231a868-a591-4999-ba81-b577b38585e6",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_2748c951-5f3d-4723-b6e0-f4aa3cebf966",
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
          "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
            "numericId": "3387077",
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
                "definition": "user-data-type",
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
          "id": "VARIABLE_a87067d2-a556-4c87-827f-3f0bf14171f4",
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
            "numericId": "6105155",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_9a302edd-f729-48ab-a0c6-10e0828b5aad",
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
            "numericId": "5966596",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_f8bef802-d787-4381-9733-2edba41a0fbc",
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
            "numericId": "6708121",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_204dd464-5a80-48a3-90a0-5b25350e9921",
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
            "numericId": "5501999",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_2b45995c-6781-448e-a48a-43ba30fc7258",
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
            "numericId": "5797400",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_3cfc6254-4d94-4842-b5a4-251f02d8b596",
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
            "numericId": "1275525",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_0d3cc5f2-c3b3-4460-a379-e588fe023b8b",
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
            "numericId": "1573462",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_2af46e73-316c-493d-82e1-89594041fd6a",
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
            "numericId": "10333171",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_2a3f35d8-f8be-4ee9-a434-21d56a497c90",
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
            "numericId": "3240815",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "VARIABLE_dff111d3-b35f-4477-862b-80edf01c2503",
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
            "numericId": "6955578",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
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
          "id": "e_left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__left-rail_EN",
          "source": "left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "sourceHandle": "left-rail",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da_right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54__ENO_right-rail",
          "source": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_a87067d2-a556-4c87-827f-3f0bf14171f4_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY01",
          "source": "VARIABLE_a87067d2-a556-4c87-827f-3f0bf14171f4",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY01"
        },
        {
          "id": "e_VARIABLE_9a302edd-f729-48ab-a0c6-10e0828b5aad_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY02",
          "source": "VARIABLE_9a302edd-f729-48ab-a0c6-10e0828b5aad",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY02"
        },
        {
          "id": "e_VARIABLE_f8bef802-d787-4381-9733-2edba41a0fbc_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY03",
          "source": "VARIABLE_f8bef802-d787-4381-9733-2edba41a0fbc",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY03"
        },
        {
          "id": "e_VARIABLE_204dd464-5a80-48a3-90a0-5b25350e9921_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY04",
          "source": "VARIABLE_204dd464-5a80-48a3-90a0-5b25350e9921",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY04"
        },
        {
          "id": "e_VARIABLE_2b45995c-6781-448e-a48a-43ba30fc7258_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY05",
          "source": "VARIABLE_2b45995c-6781-448e-a48a-43ba30fc7258",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY05"
        },
        {
          "id": "e_VARIABLE_3cfc6254-4d94-4842-b5a4-251f02d8b596_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY06",
          "source": "VARIABLE_3cfc6254-4d94-4842-b5a4-251f02d8b596",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY06"
        },
        {
          "id": "e_VARIABLE_0d3cc5f2-c3b3-4460-a379-e588fe023b8b_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY07",
          "source": "VARIABLE_0d3cc5f2-c3b3-4460-a379-e588fe023b8b",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY07"
        },
        {
          "id": "e_VARIABLE_2af46e73-316c-493d-82e1-89594041fd6a_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_DY08",
          "source": "VARIABLE_2af46e73-316c-493d-82e1-89594041fd6a",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "DY08"
        },
        {
          "id": "e_VARIABLE_2a3f35d8-f8be-4ee9-a434-21d56a497c90_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_AY01_Scaled",
          "source": "VARIABLE_2a3f35d8-f8be-4ee9-a434-21d56a497c90",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "AY01_Scaled"
        },
        {
          "id": "e_VARIABLE_dff111d3-b35f-4477-862b-80edf01c2503_BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da__output_AY02_Scaled",
          "source": "VARIABLE_dff111d3-b35f-4477-862b-80edf01c2503",
          "sourceHandle": "output",
          "target": "BLOCK_d3b39a95-3798-4505-bfe1-c77f7aaf10da",
          "targetHandle": "AY02_Scaled"
        }
      ]
    }
  ]
}
END_PROGRAM