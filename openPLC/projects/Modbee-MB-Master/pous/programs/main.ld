PROGRAM main
VAR
	MODBEE_HW_INPUTS0 : MODBEE_HW_INPUTS;
	MODBEE_HW_OUTPUTS0 : MODBEE_HW_OUTPUTS;
	start : bool;
	stop : bool;
	run : bool;
	MODBUS_WRITE0 : MODBUS_WRITE;
	MB_SLAVE_DO01 : bool;
	MB_SLAVE_DO02 : bool;
	MB_SLAVE_DO03 : bool;
	MB_SLAVE_DO04 : bool;
	MB_SLAVE_DO05 : bool;
	MB_SLAVE_DO06 : bool;
	MB_SLAVE_DO07 : bool;
	MB_SLAVE_DO08 : bool;
	MODBUS_READ0 : MODBUS_READ;
	MB_SLAVE_DI01 : bool;
	MB_SLAVE_DI02 : bool;
	MB_SLAVE_DI03 : bool;
	MB_SLAVE_DI05 : bool;
	MB_SLAVE_DI04 : bool;
	MB_SLAVE_DI06 : bool;
	MB_SLAVE_DI07 : bool;
	MB_SLAVE_DI08 : bool;
	MB_WRITE_COILS_DONE : bool;
	MB_READ_COILS_DONE : bool;
	TON0 : TON;
	TON1 : TON;
	TON1_DONE : bool;
	TON0_DONE : bool;
	MODBUS_READ1 : MODBUS_READ;
	MB_READ_REGS_DONE : bool;
	MB_SLAVE_AI01 : int;
	MB_SLAVE_AI02 : int;
	MB_SLAVE_AI03 : int;
	MB_SLAVE_AI04 : int;
	MODBUS_WRITE1 : MODBUS_WRITE;
	MB_WRITE_REGS_DONE : bool;
	MB_SLAVE_AO01 : real;
	MB_SLAVE_AO02 : real;
	MB_SLAVE_AO03 : real;
	MB_SLAVE_AO04 : real;
	MB_SLAVE_AO5 : int;
	MB_SLAVE_AO01_TEMP : int;
	MB_SLAVE_AO02_TEMP : int;
	MB_WRITE_REGS_DONE0 : bool;
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
                "handleId": "DX01",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_DO01",
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
                  "name": "MB_SLAVE_DO02",
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
                  "name": "MB_SLAVE_DO03",
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
                  "name": "MB_SLAVE_DO04",
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
                  "name": "MB_SLAVE_DO05",
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
                  "name": "MB_SLAVE_DO06",
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
                  "name": "MB_SLAVE_DO07",
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
                  "name": "MB_SLAVE_DO08",
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
                  "name": "MB_SLAVE_AO01",
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
              "name": "MB_SLAVE_DO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_d56b03bf-96ee-4eee-a405-560ac4f93f90"
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
              "name": "MB_SLAVE_DO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_7ad61319-b8ee-4683-a71c-eba88b7f8fd2"
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
              "name": "MB_SLAVE_DO03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_9fb523b5-57f1-4ee8-9fd9-4d8a45dda64c"
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
              "name": "MB_SLAVE_DO04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_ebf0ebc4-b4f2-4e3e-b305-d45e4b8d020c"
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
              "name": "MB_SLAVE_DO05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_ccbb16c2-4b0c-40a0-b20b-098d3db9666f"
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
              "name": "MB_SLAVE_DO06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_d62dade3-6e28-474d-8ea7-781a71390bd1"
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
              "name": "MB_SLAVE_DO07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_00b7955b-eb73-4e61-afed-fc0abdf55c4d"
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
              "name": "MB_SLAVE_DO08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_19574d15-565f-4d8b-a639-b7ee034e14da"
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
              "name": "MB_SLAVE_AO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_b4856512-3be9-472a-a87e-a5f08a6d4a71"
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
              "name": "MB_SLAVE_AO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_63aa132a-23f0-4ef7-ade1-06f758cd3ae6"
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
              "name": "MB_SLAVE_AO03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_7c2e4d61-a316-4f2d-ab52-237347436108"
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
              "name": "MB_SLAVE_AO04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_355c2812-aeeb-49db-83f7-b070448160ae"
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
        984,
        3526
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
          "id": "PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee",
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
            "numericId": "4195250",
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
            "parallelCloseReference": "PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7",
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
          "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "type": "block",
          "position": {
            "x": 147,
            "y": 14
          },
          "height": 780,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 780
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
                "id": "COIL_01",
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
                "id": "COIL_02",
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
                "id": "COIL_03",
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
                "id": "COIL_04",
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
                "id": "COIL_05",
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
                "id": "COIL_06",
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
                "id": "COIL_07",
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
                "id": "COIL_08",
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
                "id": "REG_01",
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
                "id": "REG_02",
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
                "id": "REG_03",
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
                "id": "REG_04",
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
                "id": "REG_05",
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
                "id": "REG_06",
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
                "id": "REG_07",
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
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
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
                "id": "COIL_01",
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
                "id": "COIL_02",
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
                "id": "COIL_03",
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
                "id": "COIL_04",
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
                "id": "COIL_05",
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
                "id": "COIL_06",
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
                "id": "COIL_07",
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
                "id": "COIL_08",
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
                "id": "REG_01",
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
                "id": "REG_02",
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
                "id": "REG_03",
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
                "id": "REG_04",
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
                "id": "REG_05",
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
                "id": "REG_06",
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
                "id": "REG_07",
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
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
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
            "numericId": "6212786",
            "variant": {
              "language": "cpp",
              "name": "MODBUS_READ",
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
                  "name": "SLAVE_ID",
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
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK - MODBUS_READ (Multi-element, up to 8)\n *\n *  Reads multiple values from Modbus slave with scalar outputs\n *  LENGTH specifies element count (1-8)\n *  \n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async read with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Copy results when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\n// -----------------------------------------------------------------------------\n// Shared \"one transaction at a time\" manager\n// NOTE: The underlying ModbusRTU stack cannot safely run multiple in-flight\n// requests when different FB instances are issuing async transactions.\n// -----------------------------------------------------------------------------\n#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR\n#define MODBEE_OPENPLC_MODBUS_TX_MGR\nstatic volatile void *modbee_mb_owner = nullptr;\nstatic inline bool modbee_mb_claim(void *owner)\n{\n  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))\n    return false;\n  modbee_mb_owner = owner;\n  return true;\n}\nstatic inline void modbee_mb_release(void *owner)\n{\n  if (modbee_mb_owner == owner)\n    modbee_mb_owner = nullptr;\n}\n#endif\n\ntypedef struct\n{\n  void *key; // stable per-instance key (e.g. pointer to REQ storage)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n  volatile bool success;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t slave_id;\n  uint16_t start_addr;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  bool ists_buffer[MAX_ELEMENTS];\n  uint16_t hreg_buffer[MAX_ELEMENTS];\n  uint16_t ireg_buffer[MAX_ELEMENTS];\n} ModbusReadCtx;\n\nstatic ModbusReadCtx s_modbus_read_ctx[MAX_INSTANCES];\nstatic volatile ModbusReadCtx *s_modbus_read_active = nullptr;\n\nstatic ModbusReadCtx *get_modbus_read_ctx(MODBUS_READ_VARS *vars)\n{\n  // IMPORTANT: `vars` itself is a stack-local struct in OpenPLC's generated code,\n  // so `vars` (and its address) is NOT stable across scan cycles.\n  // The pointers inside `vars` *are* stable (they point into the FB instance).\n  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.\n  // So `vars->REQ` will get macro-expanded and break compilation.\n  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbus_read_ctx[i].in_use && s_modbus_read_ctx[i].key == key)\n      return &s_modbus_read_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbus_read_ctx[i].in_use)\n    {\n      s_modbus_read_ctx[i].in_use = true;\n      s_modbus_read_ctx[i].key = key;\n      s_modbus_read_ctx[i].last_req = false;\n      s_modbus_read_ctx[i].started = false;\n      s_modbus_read_ctx[i].queued = false;\n      s_modbus_read_ctx[i].completed = false;\n      s_modbus_read_ctx[i].success = false;\n      s_modbus_read_ctx[i].reg_type = 0xFF;\n      s_modbus_read_ctx[i].len = 0;\n      s_modbus_read_ctx[i].slave_id = 0;\n      s_modbus_read_ctx[i].start_addr = 0;\n      return &s_modbus_read_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic void reset_modbus_read_ctx(ModbusReadCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->success = false;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\nbool modbusReadCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)\n{\n  (void)transactionId;\n  (void)data;\n\n  ModbusReadCtx *ctx = (ModbusReadCtx *)s_modbus_read_active;\n  if (ctx)\n  {\n    ctx->completed = true;\n    ctx->success = (event == Modbus::EX_SUCCESS);\n    s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n  }\n  return true;\n}\n\nstatic inline void copy_read_results(MODBUS_READ_VARS *vars, const ModbusReadCtx *ctx)\n{\n  // OpenPLC generates access macros like `#define COIL_01 (*(vars->COIL_01))`.\n  // Those macros require a local variable named `vars` in scope.\n  if (!vars || !ctx)\n    return;\n\n  const uint8_t len = ctx->len;\n  switch (ctx->reg_type)\n  {\n  case 0: // COILS\n    COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;\n    COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;\n    COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;\n    COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;\n    COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;\n    COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;\n    COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;\n    COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;\n    break;\n  case 1: // INPUT STATUS\n    COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;\n    COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;\n    COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;\n    COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;\n    COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;\n    COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;\n    COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;\n    COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;\n    break;\n  case 2: // HOLDING REGISTERS\n    REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;\n    REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;\n    REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;\n    REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;\n    REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;\n    REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;\n    REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;\n    REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;\n    break;\n  case 3: // INPUT REGISTERS\n    REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;\n    REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;\n    REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;\n    REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;\n    REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;\n    REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;\n    REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;\n    REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;\n    break;\n  default:\n    break;\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n}\n\nvoid loop()\n{\n  ModbusReadCtx *ctx = get_modbus_read_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = true;\n    return;\n  }\n\n  // REQ falling edge: reset instance state\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    reset_modbus_read_ctx(ctx);\n    DONE = false;\n    ERROR = false;\n    if (s_modbus_read_active == ctx)\n      s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  // REQ rising edge: latch parameters, begin operation\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_read_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->success = false;\n    ctx->len = len;\n    ctx->reg_type = (uint8_t)REG_TYPE;\n    ctx->slave_id = (uint8_t)SLAVE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n  }\n\n  // Nothing to do unless we're in an active request cycle\n  if (!REQ || DONE)\n    return;\n\n  // If queued, wait for callback to mark completion\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = !ctx->success;\n      ctx->queued = false;\n      ctx->started = false;\n      if (!ERROR)\n        copy_read_results(vars, ctx);\n    }\n    return;\n  }\n\n  // Not queued yet: try to claim the Modbus stack and queue the transaction.\n  // If the stack is busy, we just retry on the next scan (no error).\n  if (!ctx->started)\n    return;\n\n  if (!modbee_mb_claim(ctx))\n    return;\n\n  s_modbus_read_active = ctx;\n  bool queued = false;\n  switch (ctx->reg_type)\n  {\n  case 0: // COILS\n    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 1: // INPUT STATUS\n    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 2: // HOLDING REGISTERS\n    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 3: // INPUT REGISTERS\n    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  default:\n    break;\n  }\n\n  if (!queued)\n  {\n    s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  ctx->queued = true;\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBUS_READ0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_READ"
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
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_DI01",
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
                  "name": "MB_SLAVE_DI02",
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
                  "name": "MB_SLAVE_DI03",
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
                  "name": "MB_SLAVE_DI04",
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
                  "name": "MB_SLAVE_DI05",
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
                  "name": "MB_SLAVE_DI06",
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
                  "name": "MB_SLAVE_DI07",
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
                  "name": "MB_SLAVE_DI08",
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
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 873
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                  "y": 874
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
                "y": 874
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
                "y": 874
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
            "numericId": "7439608",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 874
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
                "y": 874
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
            "parallelCloseReference": "PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec",
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
          "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "type": "block",
          "position": {
            "x": 147,
            "y": 838
          },
          "height": 780,
          "width": 216,
          "measured": {
            "width": 216,
            "height": 780
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 874
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
                  "y": 914
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
                  "y": 954
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
                  "y": 994
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
                  "y": 1034
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
                  "y": 1074
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
                  "y": 874
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
                  "y": 914
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
                  "y": 954
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
                  "y": 994
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "COIL_01",
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
                  "y": 1034
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_02",
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
                  "y": 1074
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_03",
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
                  "y": 1114
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_04",
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
                  "y": 1154
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_05",
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
                  "y": 1194
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_06",
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
                  "y": 1234
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_07",
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
                  "y": 1274
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_08",
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
                  "y": 1314
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "REG_01",
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
                  "y": 1354
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_02",
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
                  "y": 1394
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_03",
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
                  "y": 1434
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_04",
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
                  "y": 1474
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_05",
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
                  "y": 1514
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_06",
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
                  "y": 1554
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_07",
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
                  "y": 1594
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              }
            ],
            "inputHandles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 874
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
                  "y": 914
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
                  "y": 954
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
                  "y": 994
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
                  "y": 1034
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
                  "y": 1074
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
                  "y": 874
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
                  "y": 914
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
                  "y": 954
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
                  "y": 994
                },
                "relPosition": {
                  "x": 216,
                  "y": 156
                },
                "id": "COIL_01",
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
                  "y": 1034
                },
                "relPosition": {
                  "x": 216,
                  "y": 196
                },
                "id": "COIL_02",
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
                  "y": 1074
                },
                "relPosition": {
                  "x": 216,
                  "y": 236
                },
                "id": "COIL_03",
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
                  "y": 1114
                },
                "relPosition": {
                  "x": 216,
                  "y": 276
                },
                "id": "COIL_04",
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
                  "y": 1154
                },
                "relPosition": {
                  "x": 216,
                  "y": 316
                },
                "id": "COIL_05",
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
                  "y": 1194
                },
                "relPosition": {
                  "x": 216,
                  "y": 356
                },
                "id": "COIL_06",
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
                  "y": 1234
                },
                "relPosition": {
                  "x": 216,
                  "y": 396
                },
                "id": "COIL_07",
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
                  "y": 1274
                },
                "relPosition": {
                  "x": 216,
                  "y": 436
                },
                "id": "COIL_08",
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
                  "y": 1314
                },
                "relPosition": {
                  "x": 216,
                  "y": 476
                },
                "id": "REG_01",
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
                  "y": 1354
                },
                "relPosition": {
                  "x": 216,
                  "y": 516
                },
                "id": "REG_02",
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
                  "y": 1394
                },
                "relPosition": {
                  "x": 216,
                  "y": 556
                },
                "id": "REG_03",
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
                  "y": 1434
                },
                "relPosition": {
                  "x": 216,
                  "y": 596
                },
                "id": "REG_04",
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
                  "y": 1474
                },
                "relPosition": {
                  "x": 216,
                  "y": 636
                },
                "id": "REG_05",
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
                  "y": 1514
                },
                "relPosition": {
                  "x": 216,
                  "y": 676
                },
                "id": "REG_06",
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
                  "y": 1554
                },
                "relPosition": {
                  "x": 216,
                  "y": 716
                },
                "id": "REG_07",
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
                  "y": 1594
                },
                "relPosition": {
                  "x": 216,
                  "y": 756
                },
                "id": "REG_08",
                "position": "right",
                "type": "source",
                "isConnectable": false,
                "style": {
                  "top": 756,
                  "right": 0
                }
              }
            ],
            "inputConnector": {
              "glbPosition": {
                "x": 147,
                "y": 874
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
                "y": 874
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
            "numericId": "1230303",
            "variant": {
              "language": "cpp",
              "name": "MODBUS_READ",
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
                  "name": "SLAVE_ID",
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
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK - MODBUS_READ (Multi-element, up to 8)\n *\n *  Reads multiple values from Modbus slave with scalar outputs\n *  LENGTH specifies element count (1-8)\n *  \n *  PROPER ASYNC STATE MACHINE WITH CALLBACKS:\n *  1. REQ rise: Start async read with callback\n *  2. Wait: Callback sets completion flag when response received\n *  3. Complete: Copy results when callback indicates success\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished successfully\n * ================================================================ */\n\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\n// -----------------------------------------------------------------------------\n// Shared \"one transaction at a time\" manager\n// NOTE: The underlying ModbusRTU stack cannot safely run multiple in-flight\n// requests when different FB instances are issuing async transactions.\n// -----------------------------------------------------------------------------\n#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR\n#define MODBEE_OPENPLC_MODBUS_TX_MGR\nstatic volatile void *modbee_mb_owner = nullptr;\nstatic inline bool modbee_mb_claim(void *owner)\n{\n  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))\n    return false;\n  modbee_mb_owner = owner;\n  return true;\n}\nstatic inline void modbee_mb_release(void *owner)\n{\n  if (modbee_mb_owner == owner)\n    modbee_mb_owner = nullptr;\n}\n#endif\n\ntypedef struct\n{\n  void *key; // stable per-instance key (e.g. pointer to REQ storage)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n  volatile bool success;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t slave_id;\n  uint16_t start_addr;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  bool ists_buffer[MAX_ELEMENTS];\n  uint16_t hreg_buffer[MAX_ELEMENTS];\n  uint16_t ireg_buffer[MAX_ELEMENTS];\n} ModbusReadCtx;\n\nstatic ModbusReadCtx s_modbus_read_ctx[MAX_INSTANCES];\nstatic volatile ModbusReadCtx *s_modbus_read_active = nullptr;\n\nstatic ModbusReadCtx *get_modbus_read_ctx(MODBUS_READ_VARS *vars)\n{\n  // IMPORTANT: `vars` itself is a stack-local struct in OpenPLC's generated code,\n  // so `vars` (and its address) is NOT stable across scan cycles.\n  // The pointers inside `vars` *are* stable (they point into the FB instance).\n  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.\n  // So `vars->REQ` will get macro-expanded and break compilation.\n  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbus_read_ctx[i].in_use && s_modbus_read_ctx[i].key == key)\n      return &s_modbus_read_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbus_read_ctx[i].in_use)\n    {\n      s_modbus_read_ctx[i].in_use = true;\n      s_modbus_read_ctx[i].key = key;\n      s_modbus_read_ctx[i].last_req = false;\n      s_modbus_read_ctx[i].started = false;\n      s_modbus_read_ctx[i].queued = false;\n      s_modbus_read_ctx[i].completed = false;\n      s_modbus_read_ctx[i].success = false;\n      s_modbus_read_ctx[i].reg_type = 0xFF;\n      s_modbus_read_ctx[i].len = 0;\n      s_modbus_read_ctx[i].slave_id = 0;\n      s_modbus_read_ctx[i].start_addr = 0;\n      return &s_modbus_read_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic void reset_modbus_read_ctx(ModbusReadCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->success = false;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\nbool modbusReadCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)\n{\n  (void)transactionId;\n  (void)data;\n\n  ModbusReadCtx *ctx = (ModbusReadCtx *)s_modbus_read_active;\n  if (ctx)\n  {\n    ctx->completed = true;\n    ctx->success = (event == Modbus::EX_SUCCESS);\n    s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n  }\n  return true;\n}\n\nstatic inline void copy_read_results(MODBUS_READ_VARS *vars, const ModbusReadCtx *ctx)\n{\n  // OpenPLC generates access macros like `#define COIL_01 (*(vars->COIL_01))`.\n  // Those macros require a local variable named `vars` in scope.\n  if (!vars || !ctx)\n    return;\n\n  const uint8_t len = ctx->len;\n  switch (ctx->reg_type)\n  {\n  case 0: // COILS\n    COIL_01 = (len > 0) ? ctx->coil_buffer[0] : false;\n    COIL_02 = (len > 1) ? ctx->coil_buffer[1] : false;\n    COIL_03 = (len > 2) ? ctx->coil_buffer[2] : false;\n    COIL_04 = (len > 3) ? ctx->coil_buffer[3] : false;\n    COIL_05 = (len > 4) ? ctx->coil_buffer[4] : false;\n    COIL_06 = (len > 5) ? ctx->coil_buffer[5] : false;\n    COIL_07 = (len > 6) ? ctx->coil_buffer[6] : false;\n    COIL_08 = (len > 7) ? ctx->coil_buffer[7] : false;\n    break;\n  case 1: // INPUT STATUS\n    COIL_01 = (len > 0) ? ctx->ists_buffer[0] : false;\n    COIL_02 = (len > 1) ? ctx->ists_buffer[1] : false;\n    COIL_03 = (len > 2) ? ctx->ists_buffer[2] : false;\n    COIL_04 = (len > 3) ? ctx->ists_buffer[3] : false;\n    COIL_05 = (len > 4) ? ctx->ists_buffer[4] : false;\n    COIL_06 = (len > 5) ? ctx->ists_buffer[5] : false;\n    COIL_07 = (len > 6) ? ctx->ists_buffer[6] : false;\n    COIL_08 = (len > 7) ? ctx->ists_buffer[7] : false;\n    break;\n  case 2: // HOLDING REGISTERS\n    REG_01 = (len > 0) ? (int)ctx->hreg_buffer[0] : 0;\n    REG_02 = (len > 1) ? (int)ctx->hreg_buffer[1] : 0;\n    REG_03 = (len > 2) ? (int)ctx->hreg_buffer[2] : 0;\n    REG_04 = (len > 3) ? (int)ctx->hreg_buffer[3] : 0;\n    REG_05 = (len > 4) ? (int)ctx->hreg_buffer[4] : 0;\n    REG_06 = (len > 5) ? (int)ctx->hreg_buffer[5] : 0;\n    REG_07 = (len > 6) ? (int)ctx->hreg_buffer[6] : 0;\n    REG_08 = (len > 7) ? (int)ctx->hreg_buffer[7] : 0;\n    break;\n  case 3: // INPUT REGISTERS\n    REG_01 = (len > 0) ? (int)ctx->ireg_buffer[0] : 0;\n    REG_02 = (len > 1) ? (int)ctx->ireg_buffer[1] : 0;\n    REG_03 = (len > 2) ? (int)ctx->ireg_buffer[2] : 0;\n    REG_04 = (len > 3) ? (int)ctx->ireg_buffer[3] : 0;\n    REG_05 = (len > 4) ? (int)ctx->ireg_buffer[4] : 0;\n    REG_06 = (len > 5) ? (int)ctx->ireg_buffer[5] : 0;\n    REG_07 = (len > 6) ? (int)ctx->ireg_buffer[6] : 0;\n    REG_08 = (len > 7) ? (int)ctx->ireg_buffer[7] : 0;\n    break;\n  default:\n    break;\n  }\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n}\n\nvoid loop()\n{\n  ModbusReadCtx *ctx = get_modbus_read_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = true;\n    return;\n  }\n\n  // REQ falling edge: reset instance state\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    reset_modbus_read_ctx(ctx);\n    DONE = false;\n    ERROR = false;\n    if (s_modbus_read_active == ctx)\n      s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  // REQ rising edge: latch parameters, begin operation\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_read_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->success = false;\n    ctx->len = len;\n    ctx->reg_type = (uint8_t)REG_TYPE;\n    ctx->slave_id = (uint8_t)SLAVE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n  }\n\n  // Nothing to do unless we're in an active request cycle\n  if (!REQ || DONE)\n    return;\n\n  // If queued, wait for callback to mark completion\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = !ctx->success;\n      ctx->queued = false;\n      ctx->started = false;\n      if (!ERROR)\n        copy_read_results(vars, ctx);\n    }\n    return;\n  }\n\n  // Not queued yet: try to claim the Modbus stack and queue the transaction.\n  // If the stack is busy, we just retry on the next scan (no error).\n  if (!ctx->started)\n    return;\n\n  if (!modbee_mb_claim(ctx))\n    return;\n\n  s_modbus_read_active = ctx;\n  bool queued = false;\n  switch (ctx->reg_type)\n  {\n  case 0: // COILS\n    queued = (io.mb.readCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 1: // INPUT STATUS\n    queued = (io.mb.readIsts(ctx->slave_id, ctx->start_addr, ctx->ists_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 2: // HOLDING REGISTERS\n    queued = (io.mb.readHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  case 3: // INPUT REGISTERS\n    queued = (io.mb.readIreg(ctx->slave_id, ctx->start_addr, ctx->ireg_buffer, ctx->len, modbusReadCallback) != 0);\n    break;\n  default:\n    break;\n  }\n\n  if (!queued)\n  {\n    s_modbus_read_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  ctx->queued = true;\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBUS_READ1",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_READ"
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
              },
              {
                "handleId": "REG_01",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AI01",
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
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AI02",
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
                "handleId": "REG_03",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AI03",
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
                "handleId": "REG_04",
                "type": "output",
                "variable": {
                  "name": "MB_SLAVE_AI04",
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
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 1697
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                  "y": 1698
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
                "y": 1698
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
                "y": 1698
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
            "numericId": "1123186",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 1698
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
                "y": 1698
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
            "parallelCloseReference": "PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2",
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
          "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "type": "block",
          "position": {
            "x": 147,
            "y": 1662
          },
          "height": 900,
          "width": 198,
          "measured": {
            "width": 198,
            "height": 900
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 147,
                  "y": 1698
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
                  "y": 1738
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
                  "y": 1778
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
                  "y": 1818
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
                  "y": 1858
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
                  "y": 1898
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
                  "y": 1938
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
                  "y": 1978
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
                  "y": 2018
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
                  "y": 2058
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
                  "y": 2098
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
                  "y": 2138
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
                  "y": 2178
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
                  "y": 2218
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
                  "y": 2258
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
                  "y": 2298
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
                  "y": 2338
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
                  "y": 2378
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
                  "y": 2418
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
                  "y": 2458
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
                  "y": 2498
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
                  "y": 2538
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
                  "x": 345,
                  "y": 1698
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
              {
                "glbPosition": {
                  "x": 345,
                  "y": 1738
                },
                "relPosition": {
                  "x": 198,
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
                  "x": 345,
                  "y": 1778
                },
                "relPosition": {
                  "x": 198,
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
                  "y": 1698
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
                  "y": 1738
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
                  "y": 1778
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
                  "y": 1818
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
                  "y": 1858
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
                  "y": 1898
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
                  "y": 1938
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
                  "y": 1978
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
                  "y": 2018
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
                  "y": 2058
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
                  "y": 2098
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
                  "y": 2138
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
                  "y": 2178
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
                  "y": 2218
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
                  "y": 2258
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
                  "y": 2298
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
                  "y": 2338
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
                  "y": 2378
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
                  "y": 2418
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
                  "y": 2458
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
                  "y": 2498
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
                  "y": 2538
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
                  "x": 345,
                  "y": 1698
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
              {
                "glbPosition": {
                  "x": 345,
                  "y": 1738
                },
                "relPosition": {
                  "x": 198,
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
                  "x": 345,
                  "y": 1778
                },
                "relPosition": {
                  "x": 198,
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
                "y": 1698
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
                "y": 1698
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
            "numericId": "8545841",
            "variant": {
              "language": "cpp",
              "name": "MODBUS_WRITE",
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
                  "name": "SLAVE_ID",
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
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK - MODBUS_WRITE (Multi-element, up to 8)\n *\n *  Writes multiple values to Modbus slave from scalar inputs\n *  LENGTH specifies element count (1-8)\n *  \n *  PROPER STATE MACHINE:\n *  1. REQ rise: Queue write operation\n *  2. Wait: Monitor with 1000ms timeout\n *  3. Complete: Mark done (success/timeout)\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished (success or timeout)\n * ================================================================ */\n\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\n// Shared Modbus transaction manager (see MODBUS_READ.cpp)\n#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR\n#define MODBEE_OPENPLC_MODBUS_TX_MGR\nstatic volatile void *modbee_mb_owner = nullptr;\nstatic inline bool modbee_mb_claim(void *owner)\n{\n  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))\n    return false;\n  modbee_mb_owner = owner;\n  return true;\n}\nstatic inline void modbee_mb_release(void *owner)\n{\n  if (modbee_mb_owner == owner)\n    modbee_mb_owner = nullptr;\n}\n#endif\n\ntypedef struct\n{\n  void *key; // stable per-instance key (e.g. pointer to REQ storage)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n  volatile bool success;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t slave_id;\n  uint16_t start_addr;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  uint16_t hreg_buffer[MAX_ELEMENTS];\n} ModbusWriteCtx;\n\nstatic ModbusWriteCtx s_modbus_write_ctx[MAX_INSTANCES];\nstatic volatile ModbusWriteCtx *s_modbus_write_active = nullptr;\n\nstatic ModbusWriteCtx *get_modbus_write_ctx(MODBUS_WRITE_VARS *vars)\n{\n  // IMPORTANT: `vars` is a stack-local struct in OpenPLC's generated code, so\n  // `vars` (and its address) is NOT stable across scan cycles.\n  // The pointers inside `vars` *are* stable (they point into the FB instance).\n  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.\n  // So `vars->REQ` will get macro-expanded and break compilation.\n  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbus_write_ctx[i].in_use && s_modbus_write_ctx[i].key == key)\n      return &s_modbus_write_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbus_write_ctx[i].in_use)\n    {\n      s_modbus_write_ctx[i].in_use = true;\n      s_modbus_write_ctx[i].key = key;\n      s_modbus_write_ctx[i].last_req = false;\n      s_modbus_write_ctx[i].started = false;\n      s_modbus_write_ctx[i].queued = false;\n      s_modbus_write_ctx[i].completed = false;\n      s_modbus_write_ctx[i].success = false;\n      s_modbus_write_ctx[i].reg_type = 0xFF;\n      s_modbus_write_ctx[i].len = 0;\n      s_modbus_write_ctx[i].slave_id = 0;\n      s_modbus_write_ctx[i].start_addr = 0;\n      return &s_modbus_write_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic void reset_modbus_write_ctx(ModbusWriteCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->success = false;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\nbool modbusWriteCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)\n{\n  (void)transactionId;\n  (void)data;\n\n  ModbusWriteCtx *ctx = (ModbusWriteCtx *)s_modbus_write_active;\n  if (ctx)\n  {\n    ctx->completed = true;\n    ctx->success = (event == Modbus::EX_SUCCESS);\n    s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n  }\n  return true;\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n}\n\nvoid loop()\n{\n  ModbusWriteCtx *ctx = get_modbus_write_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = true;\n    return;\n  }\n\n  // REQ falling edge: reset instance state\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    reset_modbus_write_ctx(ctx);\n    DONE = false;\n    ERROR = false;\n    if (s_modbus_write_active == ctx)\n      s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  // REQ rising edge: latch parameters and build write buffers\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_write_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->success = false;\n    ctx->len = len;\n    ctx->reg_type = (uint8_t)REG_TYPE;\n    ctx->slave_id = (uint8_t)SLAVE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    // Build persistent buffers for the async write\n    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)\n    {\n      ctx->coil_buffer[i] = false;\n      ctx->hreg_buffer[i] = 0;\n    }\n\n    if (ctx->reg_type == 0)\n    {\n      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;\n      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;\n      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;\n      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;\n      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;\n      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;\n      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;\n      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;\n    }\n    else if (ctx->reg_type == 2)\n    {\n      ctx->hreg_buffer[0] = (len > 0) ? (uint16_t)REG_01 : 0;\n      ctx->hreg_buffer[1] = (len > 1) ? (uint16_t)REG_02 : 0;\n      ctx->hreg_buffer[2] = (len > 2) ? (uint16_t)REG_03 : 0;\n      ctx->hreg_buffer[3] = (len > 3) ? (uint16_t)REG_04 : 0;\n      ctx->hreg_buffer[4] = (len > 4) ? (uint16_t)REG_05 : 0;\n      ctx->hreg_buffer[5] = (len > 5) ? (uint16_t)REG_06 : 0;\n      ctx->hreg_buffer[6] = (len > 6) ? (uint16_t)REG_07 : 0;\n      ctx->hreg_buffer[7] = (len > 7) ? (uint16_t)REG_08 : 0;\n    }\n    else\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_write_ctx(ctx);\n      return;\n    }\n  }\n\n  if (!REQ || DONE)\n    return;\n\n  // If queued, wait for callback to mark completion\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = !ctx->success;\n      ctx->queued = false;\n      ctx->started = false;\n    }\n    return;\n  }\n\n  // Not queued yet: try to claim and queue. Busy means retry next scan.\n  if (!ctx->started)\n    return;\n\n  if (!modbee_mb_claim(ctx))\n    return;\n\n  s_modbus_write_active = ctx;\n  bool queued = false;\n  if (ctx->reg_type == 0)\n  {\n    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteCallback) != 0);\n  }\n  else if (ctx->reg_type == 2)\n  {\n    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteCallback) != 0);\n  }\n\n  if (!queued)\n  {\n    s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  ctx->queued = true;\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBUS_WRITE0",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_WRITE"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": true
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
                "handleId": "COIL_01",
                "type": "input",
                "variable": {
                  "name": "MB_SLAVE_DO01",
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
                  "name": "MB_SLAVE_DO02",
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
                  "name": "MB_SLAVE_DO03",
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
                  "name": "MB_SLAVE_DO04",
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
                  "name": "MB_SLAVE_DO05",
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
                  "name": "MB_SLAVE_DO06",
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
                  "name": "MB_SLAVE_DO07",
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
                  "name": "MB_SLAVE_DO08",
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
          "id": "PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1",
          "type": "parallel",
          "position": {
            "x": 23,
            "y": 2641
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                "y": 2642
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
                "y": 2642
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
            "numericId": "6794677",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 27,
                "y": 2642
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
                "y": 2642
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
            "parallelCloseReference": "PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112",
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
          "id": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
          "type": "block",
          "position": {
            "x": 147,
            "y": 2606
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
                  "y": 2642
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
                  "y": 2682
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
                  "y": 2642
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
                  "y": 2682
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
                  "y": 2642
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
                  "y": 2682
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
                  "y": 2642
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
                  "y": 2682
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
                "y": 2642
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
                "y": 2642
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
                  "name": "MB_SLAVE_AO01",
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
                  "name": "MB_SLAVE_AO01_TEMP",
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
            "y": 2750
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
                  "y": 2786
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
                  "y": 2826
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
                  "y": 2786
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
                  "y": 2826
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
                  "y": 2786
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
                  "y": 2826
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
                  "y": 2786
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
                  "y": 2826
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
                "y": 2786
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
                "y": 2786
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
                  "name": "MB_SLAVE_AO02",
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
                  "name": "MB_SLAVE_AO02_TEMP",
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
          "id": "PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112",
          "type": "parallel",
          "position": {
            "x": 399,
            "y": 2641
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                  "y": 2642
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
                "y": 2642
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
                "y": 2642
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
            "numericId": "5410408",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 403,
                "y": 2642
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
                "y": 2642
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
            "parallelOpenReference": "PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1",
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
          "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "type": "block",
          "position": {
            "x": 523,
            "y": 2606
          },
          "height": 900,
          "width": 198,
          "measured": {
            "width": 198,
            "height": 900
          },
          "draggable": true,
          "selectable": true,
          "data": {
            "handles": [
              {
                "glbPosition": {
                  "x": 523,
                  "y": 2642
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
                  "y": 2682
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
                  "y": 2722
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
                  "y": 2762
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
                  "y": 2802
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
                  "y": 2842
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
                  "y": 2882
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
                  "y": 2922
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
                  "y": 2962
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
                  "y": 3002
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
                  "y": 3042
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
                  "y": 3082
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
                  "y": 3122
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
                  "y": 3162
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
                  "y": 3202
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
                  "y": 3242
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
                  "y": 3282
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
                  "y": 3322
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
                  "y": 3362
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
                  "y": 3402
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
                  "y": 3442
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
                  "y": 3482
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
                  "x": 721,
                  "y": 2642
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
              {
                "glbPosition": {
                  "x": 721,
                  "y": 2682
                },
                "relPosition": {
                  "x": 198,
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
                  "x": 721,
                  "y": 2722
                },
                "relPosition": {
                  "x": 198,
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
                  "y": 2642
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
                  "y": 2682
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
                  "y": 2722
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
                  "y": 2762
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
                  "y": 2802
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
                  "y": 2842
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
                  "y": 2882
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
                  "y": 2922
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
                  "y": 2962
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
                  "y": 3002
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
                  "y": 3042
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
                  "y": 3082
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
                  "y": 3122
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
                  "y": 3162
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
                  "y": 3202
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
                  "y": 3242
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
                  "y": 3282
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
                  "y": 3322
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
                  "y": 3362
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
                  "y": 3402
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
                  "y": 3442
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
                  "y": 3482
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
                  "x": 721,
                  "y": 2642
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
              {
                "glbPosition": {
                  "x": 721,
                  "y": 2682
                },
                "relPosition": {
                  "x": 198,
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
                  "x": 721,
                  "y": 2722
                },
                "relPosition": {
                  "x": 198,
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
                "y": 2642
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
                "x": 721,
                "y": 2642
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
            "numericId": "3153951",
            "variant": {
              "language": "cpp",
              "name": "MODBUS_WRITE",
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
                  "name": "SLAVE_ID",
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
                }
              ],
              "body": {
                "language": "cpp",
                "value": "/* ================================================================\n *  C/C++ FUNCTION BLOCK - MODBUS_WRITE (Multi-element, up to 8)\n *\n *  Writes multiple values to Modbus slave from scalar inputs\n *  LENGTH specifies element count (1-8)\n *  \n *  PROPER STATE MACHINE:\n *  1. REQ rise: Queue write operation\n *  2. Wait: Monitor with 1000ms timeout\n *  3. Complete: Mark done (success/timeout)\n *  4. REQ fall: Reset all flags\n *  \n *  INVARIANT: DONE=true ONLY means operation finished (success or timeout)\n * ================================================================ */\n\n#include <stdint.h>\n#include <stdbool.h>\n\n#include <ESP32Modbee.h>\nextern ESP32Modbee io;\n\n#define MAX_ELEMENTS 8\n#define MAX_INSTANCES 16\n\n// Shared Modbus transaction manager (see MODBUS_READ.cpp)\n#ifndef MODBEE_OPENPLC_MODBUS_TX_MGR\n#define MODBEE_OPENPLC_MODBUS_TX_MGR\nstatic volatile void *modbee_mb_owner = nullptr;\nstatic inline bool modbee_mb_claim(void *owner)\n{\n  if ((modbee_mb_owner != nullptr) && (modbee_mb_owner != owner))\n    return false;\n  modbee_mb_owner = owner;\n  return true;\n}\nstatic inline void modbee_mb_release(void *owner)\n{\n  if (modbee_mb_owner == owner)\n    modbee_mb_owner = nullptr;\n}\n#endif\n\ntypedef struct\n{\n  void *key; // stable per-instance key (e.g. pointer to REQ storage)\n  bool in_use;\n\n  bool last_req;\n  bool started;\n  bool queued;\n  volatile bool completed;\n  volatile bool success;\n\n  uint8_t reg_type;\n  uint8_t len;\n  uint8_t slave_id;\n  uint16_t start_addr;\n\n  bool coil_buffer[MAX_ELEMENTS];\n  uint16_t hreg_buffer[MAX_ELEMENTS];\n} ModbusWriteCtx;\n\nstatic ModbusWriteCtx s_modbus_write_ctx[MAX_INSTANCES];\nstatic volatile ModbusWriteCtx *s_modbus_write_active = nullptr;\n\nstatic ModbusWriteCtx *get_modbus_write_ctx(MODBUS_WRITE_VARS *vars)\n{\n  // IMPORTANT: `vars` is a stack-local struct in OpenPLC's generated code, so\n  // `vars` (and its address) is NOT stable across scan cycles.\n  // The pointers inside `vars` *are* stable (they point into the FB instance).\n  // NOTE: In generated code, REQ is a macro like `#define REQ (*(vars->REQ))`.\n  // So `vars->REQ` will get macro-expanded and break compilation.\n  // `&REQ` expands to `&(*(vars->REQ))` which equals `vars->REQ` (stable per instance).\n  void *key = (void *)&REQ;\n\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (s_modbus_write_ctx[i].in_use && s_modbus_write_ctx[i].key == key)\n      return &s_modbus_write_ctx[i];\n  }\n  for (int i = 0; i < MAX_INSTANCES; i++)\n  {\n    if (!s_modbus_write_ctx[i].in_use)\n    {\n      s_modbus_write_ctx[i].in_use = true;\n      s_modbus_write_ctx[i].key = key;\n      s_modbus_write_ctx[i].last_req = false;\n      s_modbus_write_ctx[i].started = false;\n      s_modbus_write_ctx[i].queued = false;\n      s_modbus_write_ctx[i].completed = false;\n      s_modbus_write_ctx[i].success = false;\n      s_modbus_write_ctx[i].reg_type = 0xFF;\n      s_modbus_write_ctx[i].len = 0;\n      s_modbus_write_ctx[i].slave_id = 0;\n      s_modbus_write_ctx[i].start_addr = 0;\n      return &s_modbus_write_ctx[i];\n    }\n  }\n  return nullptr;\n}\n\nstatic void reset_modbus_write_ctx(ModbusWriteCtx *ctx)\n{\n  ctx->started = false;\n  ctx->queued = false;\n  ctx->completed = false;\n  ctx->success = false;\n  ctx->reg_type = 0xFF;\n  ctx->len = 0;\n}\n\nbool modbusWriteCallback(Modbus::ResultCode event, uint16_t transactionId, void *data)\n{\n  (void)transactionId;\n  (void)data;\n\n  ModbusWriteCtx *ctx = (ModbusWriteCtx *)s_modbus_write_active;\n  if (ctx)\n  {\n    ctx->completed = true;\n    ctx->success = (event == Modbus::EX_SUCCESS);\n    s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n  }\n  return true;\n}\n\nvoid setup()\n{\n  DONE = false;\n  ERROR = false;\n}\n\nvoid loop()\n{\n  ModbusWriteCtx *ctx = get_modbus_write_ctx(vars);\n  if (!ctx)\n  {\n    ERROR = true;\n    DONE = true;\n    return;\n  }\n\n  // REQ falling edge: reset instance state\n  if (!REQ && ctx->last_req)\n  {\n    ctx->last_req = false;\n    reset_modbus_write_ctx(ctx);\n    DONE = false;\n    ERROR = false;\n    if (s_modbus_write_active == ctx)\n      s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  // REQ rising edge: latch parameters and build write buffers\n  if (REQ && !ctx->last_req)\n  {\n    ctx->last_req = true;\n    DONE = false;\n    ERROR = false;\n\n    const uint8_t len = (uint8_t)LENGTH;\n    if (len == 0 || len > MAX_ELEMENTS)\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_write_ctx(ctx);\n      return;\n    }\n\n    ctx->started = true;\n    ctx->queued = false;\n    ctx->completed = false;\n    ctx->success = false;\n    ctx->len = len;\n    ctx->reg_type = (uint8_t)REG_TYPE;\n    ctx->slave_id = (uint8_t)SLAVE_ID;\n    ctx->start_addr = (uint16_t)START_ADDR;\n\n    // Build persistent buffers for the async write\n    for (uint8_t i = 0; i < MAX_ELEMENTS; i++)\n    {\n      ctx->coil_buffer[i] = false;\n      ctx->hreg_buffer[i] = 0;\n    }\n\n    if (ctx->reg_type == 0)\n    {\n      ctx->coil_buffer[0] = (len > 0) ? COIL_01 : false;\n      ctx->coil_buffer[1] = (len > 1) ? COIL_02 : false;\n      ctx->coil_buffer[2] = (len > 2) ? COIL_03 : false;\n      ctx->coil_buffer[3] = (len > 3) ? COIL_04 : false;\n      ctx->coil_buffer[4] = (len > 4) ? COIL_05 : false;\n      ctx->coil_buffer[5] = (len > 5) ? COIL_06 : false;\n      ctx->coil_buffer[6] = (len > 6) ? COIL_07 : false;\n      ctx->coil_buffer[7] = (len > 7) ? COIL_08 : false;\n    }\n    else if (ctx->reg_type == 2)\n    {\n      ctx->hreg_buffer[0] = (len > 0) ? (uint16_t)REG_01 : 0;\n      ctx->hreg_buffer[1] = (len > 1) ? (uint16_t)REG_02 : 0;\n      ctx->hreg_buffer[2] = (len > 2) ? (uint16_t)REG_03 : 0;\n      ctx->hreg_buffer[3] = (len > 3) ? (uint16_t)REG_04 : 0;\n      ctx->hreg_buffer[4] = (len > 4) ? (uint16_t)REG_05 : 0;\n      ctx->hreg_buffer[5] = (len > 5) ? (uint16_t)REG_06 : 0;\n      ctx->hreg_buffer[6] = (len > 6) ? (uint16_t)REG_07 : 0;\n      ctx->hreg_buffer[7] = (len > 7) ? (uint16_t)REG_08 : 0;\n    }\n    else\n    {\n      ERROR = true;\n      DONE = true;\n      reset_modbus_write_ctx(ctx);\n      return;\n    }\n  }\n\n  if (!REQ || DONE)\n    return;\n\n  // If queued, wait for callback to mark completion\n  if (ctx->queued)\n  {\n    if (ctx->completed)\n    {\n      DONE = true;\n      ERROR = !ctx->success;\n      ctx->queued = false;\n      ctx->started = false;\n    }\n    return;\n  }\n\n  // Not queued yet: try to claim and queue. Busy means retry next scan.\n  if (!ctx->started)\n    return;\n\n  if (!modbee_mb_claim(ctx))\n    return;\n\n  s_modbus_write_active = ctx;\n  bool queued = false;\n  if (ctx->reg_type == 0)\n  {\n    queued = (io.mb.writeCoil(ctx->slave_id, ctx->start_addr, ctx->coil_buffer, ctx->len, modbusWriteCallback) != 0);\n  }\n  else if (ctx->reg_type == 2)\n  {\n    queued = (io.mb.writeHreg(ctx->slave_id, ctx->start_addr, ctx->hreg_buffer, ctx->len, modbusWriteCallback) != 0);\n  }\n\n  if (!queued)\n  {\n    s_modbus_write_active = nullptr;\n    modbee_mb_release(ctx);\n    return;\n  }\n\n  ctx->queued = true;\n}"
              },
              "documentation": "",
              "type": "function-block"
            },
            "variable": {
              "name": "MODBUS_WRITE1",
              "class": "local",
              "type": {
                "definition": "derived",
                "value": "MODBUS_WRITE"
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
                "handleId": "REG_01",
                "type": "input",
                "variable": {
                  "name": "MB_SLAVE_AO01_TEMP",
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
                  "name": "MB_SLAVE_AO02_TEMP",
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
          "id": "PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2",
          "type": "parallel",
          "position": {
            "x": 841,
            "y": 1697
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
                  "x": 841,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                  "x": 841,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                  "x": 845,
                  "y": 1698
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
                "x": 841,
                "y": 1698
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
                "x": 845,
                "y": 1698
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
            "numericId": "9866695",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 845,
                "y": 1698
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
                "x": 845,
                "y": 1698
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
            "parallelOpenReference": "PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2",
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
          "id": "PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec",
          "type": "parallel",
          "position": {
            "x": 841,
            "y": 873
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
                  "x": 841,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                  "x": 841,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                  "x": 845,
                  "y": 874
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
                "x": 841,
                "y": 874
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
                "x": 845,
                "y": 874
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
            "numericId": "847204",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 845,
                "y": 874
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
                "x": 845,
                "y": 874
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
            "parallelOpenReference": "PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95",
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
          "id": "PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7",
          "type": "parallel",
          "position": {
            "x": 841,
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
                  "x": 841,
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
                  "x": 845,
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
                  "x": 845,
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
                  "x": 845,
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
                  "x": 841,
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
                  "x": 845,
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
                  "x": 845,
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
                  "x": 845,
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
                "x": 841,
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
                "x": 845,
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
            "numericId": "8850783",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 845,
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
                "x": 845,
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
            "parallelOpenReference": "PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee",
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
            "x": 981,
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
                "x": 981
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
          "id": "VARIABLE_905ca664-ca09-45ac-913c-985d78e7f084",
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
            "numericId": "10348382",
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
              "id": "broken-VARIABLE_905ca664-ca09-45ac-913c-985d78e7f084"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_dfe446d5-acd2-4d2b-a5ef-32c86ed6fae4",
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
            "numericId": "10676426",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
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
          "id": "VARIABLE_dc247c74-0cdd-4df7-8c4d-12c9aa0856db",
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
            "numericId": "1252226",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_3d737f5b-8c02-40be-9293-0375415389d6",
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
            "numericId": "8106004",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_86902ad8-e709-4401-afa1-c5b76f7811cd",
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
            "numericId": "4885871",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_baeef43d-b124-459f-b09f-9e1bd2837b20",
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
            "numericId": "10583461",
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
              "id": "broken-VARIABLE_baeef43d-b124-459f-b09f-9e1bd2837b20"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_844632e2-8b2e-4945-b4da-e3081b473715",
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
            "numericId": "3419822",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_387451c1-ca23-4cd1-a0a8-c9cbd55a54b8",
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
            "numericId": "4347160",
            "variable": {
              "name": "MB_SLAVE_DI01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_387451c1-ca23-4cd1-a0a8-c9cbd55a54b8"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_d0a6b81d-8b56-4d77-9ab1-8d027c743044",
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
            "numericId": "1963816",
            "variable": {
              "name": "MB_SLAVE_DI02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_d0a6b81d-8b56-4d77-9ab1-8d027c743044"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_e7dd40fb-f1d8-4a34-84db-05c19cf67588",
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
            "numericId": "5457534",
            "variable": {
              "name": "MB_SLAVE_DI03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_e7dd40fb-f1d8-4a34-84db-05c19cf67588"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_cdd7d8af-ad5f-4fed-961e-f6d6bf298104",
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
            "numericId": "2841414",
            "variable": {
              "name": "MB_SLAVE_DI04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_cdd7d8af-ad5f-4fed-961e-f6d6bf298104"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_41d828bb-a176-4798-962b-b60a67edb0ab",
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
            "numericId": "7746733",
            "variable": {
              "name": "MB_SLAVE_DI05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_41d828bb-a176-4798-962b-b60a67edb0ab"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_95eac4c5-d1f4-462f-af7a-ea334e4ef2b0",
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
            "numericId": "2982915",
            "variable": {
              "name": "MB_SLAVE_DI06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_95eac4c5-d1f4-462f-af7a-ea334e4ef2b0"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_403b2da7-ac1a-43ff-85fb-c210c6efb586",
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
            "numericId": "6399839",
            "variable": {
              "name": "MB_SLAVE_DI07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_403b2da7-ac1a-43ff-85fb-c210c6efb586"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_05932b66-38b4-408e-923a-4de414a9964e",
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
            "numericId": "2873304",
            "variable": {
              "name": "MB_SLAVE_DI08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_05932b66-38b4-408e-923a-4de414a9964e"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_9dea5c04-1001-4106-a357-c5f4e4d8223c",
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
            "numericId": "3190082",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_cff8d9fa-059c-412e-a09c-9747da2e2a5d",
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
            "numericId": "9610567",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_16d12341-f70d-4898-9369-218703c119ec",
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
            "numericId": "8562820",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_39cc0829-8639-46d7-ae70-d40744ecb9ef",
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
            "numericId": "2052171",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_9549817e-d279-489a-a5aa-37a7692a2b9e",
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
            "numericId": "9227287",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_7313d1d9-4b40-472f-a4b3-69870c807b1d",
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
            "numericId": "8761335",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_2eab7c8b-3d89-4c91-9f5f-bb1fb8775cd3",
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
            "numericId": "10489635",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_e1045178-fa43-40eb-b255-0d3ec71131f5",
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
            "numericId": "3960836",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
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
          "id": "VARIABLE_1231c646-2673-4e87-9500-59bc2054b38a",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 898
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
                  "y": 914
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
                  "y": 914
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
                "y": 914
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
            "numericId": "10783681",
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
              "id": "broken-VARIABLE_1231c646-2673-4e87-9500-59bc2054b38a"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_6f18e6d1-6e0f-4b1e-96fb-ffa6f188c50b",
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
            "numericId": "8726306",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
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
          "id": "VARIABLE_beb20498-7afb-4b82-b789-ac8d963e14d9",
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
            "numericId": "10499268",
            "variable": {
              "name": "3"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_aede04a6-afa4-474a-a646-f0c1b7511b15",
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
            "numericId": "1222127",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_af548b2c-6400-4896-8895-ee357720b864",
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
            "numericId": "6443439",
            "variable": {
              "name": "4"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_ad4641fc-ce4e-43ea-a10b-53f61938a69b",
          "type": "variable",
          "position": {
            "x": 393,
            "y": 898
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
                  "y": 914
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
                  "y": 914
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
                "y": 914
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
            "numericId": "2999826",
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
              "id": "broken-VARIABLE_ad4641fc-ce4e-43ea-a10b-53f61938a69b"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_d24fcb42-af25-4125-b0a7-119ac99152ee",
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
            "numericId": "9354134",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_96d3a14d-f1a6-47da-b447-f445e6707c34",
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
            "numericId": "8995316",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_a2ae6494-14ad-4d69-b4f5-9d5b50d63a9f",
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
            "numericId": "3604905",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_c879c87d-7b25-4b5f-82ac-115490839190",
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
            "numericId": "5990259",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_185f9a83-f02f-4a62-9b26-075effc773b4",
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
            "numericId": "9157563",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_6a75a4e9-e710-4dc0-94fe-0d2827bb085e",
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
            "numericId": "10271879",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_852cd2b7-ba5f-44c2-a68a-9277d3aa2277",
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
            "numericId": "4038594",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_a762508b-9022-432d-8b63-59e788f8b4d1",
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
            "numericId": "6536690",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_496ed6d0-0f3c-4d1e-8718-781422aca2c3",
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
            "numericId": "10211939",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_94219e56-4c30-415c-87d2-4167f69bf655",
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
            "numericId": "10656866",
            "variable": {
              "name": "MB_SLAVE_AI01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_94219e56-4c30-415c-87d2-4167f69bf655"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_1a415ff9-d900-493c-b21c-7f4ecb1b0c94",
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
            "numericId": "3694553",
            "variable": {
              "name": "MB_SLAVE_AI02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_1a415ff9-d900-493c-b21c-7f4ecb1b0c94"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_7153629c-89fa-486b-a38e-182683fc25ff",
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
            "numericId": "10171265",
            "variable": {
              "name": "MB_SLAVE_AI03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_7153629c-89fa-486b-a38e-182683fc25ff"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_aba9ecd2-6c67-4ec9-9ebb-7cb17d377c37",
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
            "numericId": "3125392",
            "variable": {
              "name": "MB_SLAVE_AI04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_aba9ecd2-6c67-4ec9-9ebb-7cb17d377c37"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_1e56f358-18c4-45af-92a0-25dca164350a",
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
            "numericId": "2518457",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_a9a964ac-ba33-4e61-b5bd-a4aaed374dfc",
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
            "numericId": "2182789",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_7faf0676-2ed6-4703-8b63-45ccdaa38177",
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
            "numericId": "6225234",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_784837c9-dddc-4ad7-bdbb-eda1f9d7d5eb",
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
            "numericId": "7195525",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
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
          "id": "VARIABLE_f31705fc-d96b-4d31-805e-3b7f6758afff",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1722
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
                  "y": 1738
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
                  "y": 1738
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
                "y": 1738
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
            "numericId": "8907281",
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
              "id": "broken-VARIABLE_f31705fc-d96b-4d31-805e-3b7f6758afff"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_d37284af-bb54-4b13-897c-71c7f033972d",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 1762
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
                  "y": 1778
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
                  "y": 1778
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
                "y": 1778
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
            "numericId": "5802363",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
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
          "id": "VARIABLE_ab5393bc-dc41-445b-8501-4f2308710d6a",
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
            "numericId": "4408478",
            "variable": {
              "name": "0"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_1994f669-e327-4a9e-9f27-2421379458d7",
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
            "numericId": "5854111",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_507b7f9b-6086-42e7-8752-727184680493",
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
            "numericId": "2595525",
            "variable": {
              "name": "8"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_0fb987c8-d0b5-47f3-9f16-876b674f3735",
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
            "numericId": "6330349",
            "variable": {
              "name": "MB_SLAVE_DO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_0fb987c8-d0b5-47f3-9f16-876b674f3735"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_b1f78a6f-fa97-4fab-b110-44016e93e0cc",
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
            "numericId": "3465645",
            "variable": {
              "name": "MB_SLAVE_DO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_b1f78a6f-fa97-4fab-b110-44016e93e0cc"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_875ccc70-0fc3-4b0d-94a8-c94b7de25137",
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
            "numericId": "4456877",
            "variable": {
              "name": "MB_SLAVE_DO03",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_875ccc70-0fc3-4b0d-94a8-c94b7de25137"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_c64f98cf-824b-4bd1-afe1-c5abf2f796a2",
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
            "numericId": "2781655",
            "variable": {
              "name": "MB_SLAVE_DO04",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_c64f98cf-824b-4bd1-afe1-c5abf2f796a2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_a044662c-6f7a-4492-8373-54827d155613",
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
            "numericId": "6556200",
            "variable": {
              "name": "MB_SLAVE_DO05",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_a044662c-6f7a-4492-8373-54827d155613"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_72526789-741d-4f17-ae82-757e95dc3a32",
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
            "numericId": "2785839",
            "variable": {
              "name": "MB_SLAVE_DO06",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_72526789-741d-4f17-ae82-757e95dc3a32"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_14b0775c-e4b2-4af8-bc2f-7f4e3f2e0bf7",
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
            "numericId": "1101563",
            "variable": {
              "name": "MB_SLAVE_DO07",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_14b0775c-e4b2-4af8-bc2f-7f4e3f2e0bf7"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_54f0dde9-86ca-486e-b2ba-fb036fc55a32",
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
            "numericId": "9813965",
            "variable": {
              "name": "MB_SLAVE_DO08",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_54f0dde9-86ca-486e-b2ba-fb036fc55a32"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_7f005ad3-de18-41fb-9f3f-f4182fd539a1",
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
            "numericId": "1629346",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_c2e6d3ff-824e-4137-ba7e-b49a88a808e6",
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
            "numericId": "9554799",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_9bd76304-fe9f-46c4-bc9f-4aee58e8d11a",
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
            "numericId": "5447258",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_e2d2f4c8-3ebb-44ae-aeb9-43dc81b1a712",
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
            "numericId": "3687016",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_1881f65c-ad36-402e-85a2-f17eb80095e9",
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
            "numericId": "1124741",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_2b19f07b-ba91-43f2-9031-099372dcb2e6",
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
            "numericId": "4968675",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_a9ab00fa-4334-4d9a-8987-c38ee912a4ec",
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
            "numericId": "8735676",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_43ebfd8c-39a7-4957-9320-bf7a0445178f",
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
            "numericId": "4586459",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_59da4b4e-056e-4434-819b-13472730329e",
          "type": "variable",
          "position": {
            "x": 375,
            "y": 1722
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
                  "x": 375,
                  "y": 1738
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
                  "x": 375,
                  "y": 1738
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
                "x": 375,
                "y": 1738
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
            "numericId": "3348146",
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
              "id": "broken-VARIABLE_59da4b4e-056e-4434-819b-13472730329e"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_1ffc256f-4d2a-4a3d-b30d-8ec6d39aa8c2",
          "type": "variable",
          "position": {
            "x": 375,
            "y": 1762
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
                  "x": 375,
                  "y": 1778
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
                  "x": 375,
                  "y": 1778
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
                "x": 375,
                "y": 1778
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
            "numericId": "7753238",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
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
          "id": "VARIABLE_70197fee-89a2-418c-98a4-364b284b6143",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2666
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
                  "y": 2682
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
                  "y": 2682
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
                "y": 2682
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
            "numericId": "4268256",
            "variable": {
              "name": "MB_SLAVE_AO01",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_70197fee-89a2-418c-98a4-364b284b6143"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
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
          "id": "VARIABLE_81b31596-2fa7-455d-b47d-7ac5d27f5516",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 2666
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
                  "y": 2682
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
                  "y": 2682
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
                "y": 2682
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
            "numericId": "1466151",
            "variable": {
              "name": "MB_SLAVE_AO01_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_81b31596-2fa7-455d-b47d-7ac5d27f5516"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
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
          "id": "VARIABLE_8a74568b-e595-4c3e-be06-27f63666ec0a",
          "type": "variable",
          "position": {
            "x": 37,
            "y": 2810
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
                  "y": 2826
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
                  "y": 2826
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
                "y": 2826
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
            "numericId": "9789354",
            "variable": {
              "name": "MB_SLAVE_AO02",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "real"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_8a74568b-e595-4c3e-be06-27f63666ec0a"
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_1a02dd71-b61f-4a19-9b0a-25ab89bb7126",
          "type": "variable",
          "position": {
            "x": 309,
            "y": 2810
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
                  "y": 2826
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
                  "y": 2826
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
                "y": 2826
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
            "numericId": "2122298",
            "variable": {
              "name": "MB_SLAVE_AO02_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_1a02dd71-b61f-4a19-9b0a-25ab89bb7126"
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_3dac2d7e-b7dd-4041-9cb9-035f7ce730ea",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2666
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
                  "y": 2682
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
                  "y": 2682
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
                "y": 2682
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
            "numericId": "8032235",
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
              "id": "broken-VARIABLE_3dac2d7e-b7dd-4041-9cb9-035f7ce730ea"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_2703d0d3-346d-41f6-8005-f8b3fb423ec6",
          "type": "variable",
          "position": {
            "x": 413,
            "y": 2706
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
                  "y": 2722
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
                  "y": 2722
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
                "y": 2722
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
            "numericId": "7501365",
            "variable": {
              "name": "1"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
              "handleId": "SLAVE_ID",
              "variableType": {
                "name": "SLAVE_ID",
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
          "id": "VARIABLE_f20e335f-8051-42bf-897c-35aecc2353ab",
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
            "numericId": "6748247",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_a5c0b3cd-9936-49d4-937a-cea4a963f6f6",
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
            "numericId": "7695515",
            "variable": {
              "name": "100"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_4710142c-f4e1-4011-a5fa-91e25cde6974",
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
            "numericId": "10102417",
            "variable": {
              "name": "2"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_c25b61f3-815e-4c74-adc1-06b94ac5a5eb",
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
            "numericId": "7502307",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_eb8d9761-39bd-4f5f-943b-195c8855f839",
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
            "numericId": "8296210",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_d939625f-84f9-4ef7-b746-833eae6b392b",
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
            "numericId": "4218150",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_8933463b-0269-43dc-95c6-05e5cba2a954",
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
            "numericId": "10022389",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_d7e18bb7-49c7-48a3-b8c9-b6c27200cda7",
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
            "numericId": "3873789",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_7de619cc-5ea3-4ac5-9e18-3301f57da59b",
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
            "numericId": "5450944",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_45f205d5-b713-4e8c-a352-93059800f4dd",
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
            "numericId": "3875802",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_8c3d4882-86e5-4d63-b3ec-b23e6992b9e5",
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
            "numericId": "1854336",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_44936208-5ce8-47df-b471-e1e8796d9521",
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
            "numericId": "6561386",
            "variable": {
              "name": "MB_SLAVE_AO01_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_44936208-5ce8-47df-b471-e1e8796d9521"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_cd7411f6-3c54-44b0-aa53-ed5874f4476a",
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
            "numericId": "8042053",
            "variable": {
              "name": "MB_SLAVE_AO02_TEMP",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "int"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_cd7411f6-3c54-44b0-aa53-ed5874f4476a"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_af02941e-fbb0-4133-8c2b-61bf0e17c70a",
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
            "numericId": "2819535",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_eb6af5bf-15a6-4587-9acb-88d485cbbed8",
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
            "numericId": "7440073",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_b0bbb90e-c1ff-4d67-a9e5-714633c3a886",
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
            "numericId": "7155456",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_08bfaadf-a1ba-4744-a8f9-66f225c076b6",
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
            "numericId": "4366735",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_045e9ab9-b27d-47d8-9c7c-af7fc9fcd6df",
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
            "numericId": "9707906",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_4cee0fa5-cb32-4727-9db7-706b25548c1a",
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
            "numericId": "6189471",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_993070d8-cea4-4392-be79-668c293262fb",
          "type": "variable",
          "position": {
            "x": 751,
            "y": 2666
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
                  "x": 751,
                  "y": 2682
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
                  "x": 751,
                  "y": 2682
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
                "x": 751,
                "y": 2682
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
            "numericId": "1578864",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
          "id": "VARIABLE_acc89de6-9584-4cca-a66f-97e33026881b",
          "type": "variable",
          "position": {
            "x": 751,
            "y": 2706
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
                  "x": 751,
                  "y": 2722
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
                  "x": 751,
                  "y": 2722
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
                "x": 751,
                "y": 2722
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
            "numericId": "7769052",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
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
        }
      ],
      "edges": [
        {
          "id": "e_PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output-right_EN",
          "source": "PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee",
          "sourceHandle": "output-right",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7__ENO_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7_right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8__output-right_right-rail",
          "source": "PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7",
          "sourceHandle": "output-right",
          "target": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8_PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee__left-rail_input",
          "source": "left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output-right_REQ_01",
          "source": "PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95",
          "sourceHandle": "output-right",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec__DONE_01_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee_PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95__output-down_input-top",
          "source": "PARALLEL_OPEN_b58e139b-0403-4867-a7ea-64fbe0a902ee",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec_PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7__output-top_input-down",
          "source": "PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_bbfb1055-6ed1-4c4c-86d1-3d6feac965c7",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95_PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2__output-down_input-top",
          "source": "PARALLEL_OPEN_ee01103c-b9ab-4e95-9319-6dd0a325dd95",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output-right_EN",
          "source": "PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2",
          "sourceHandle": "output-right",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc_PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2__ENO_input",
          "source": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2_PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec__output-top_input-down",
          "source": "PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2",
          "sourceHandle": "output-top",
          "target": "PARALLEL_CLOSE_43a6e99b-654a-4fdb-a0f4-69ff240ccdec",
          "targetHandle": "input-down"
        },
        {
          "id": "e_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7_PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2__DONE_02_input-down",
          "source": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_5f3ac349-0052-498f-9356-0e5d20c90ff2",
          "targetHandle": "input-down"
        },
        {
          "id": "e_PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2_PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1__output-down_input-top",
          "source": "PARALLEL_OPEN_87a95b17-6f91-4462-a8c6-ec28752fb6b2",
          "sourceHandle": "output-down",
          "target": "PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1",
          "targetHandle": "input-top"
        },
        {
          "id": "e_PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1_BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8__output-right_EN",
          "source": "PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1",
          "sourceHandle": "output-right",
          "target": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8_PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112__ENO_input",
          "source": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output-right_EN",
          "source": "PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112",
          "sourceHandle": "output-right",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "EN"
        },
        {
          "id": "e_PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4__output-down_EN",
          "source": "PARALLEL_OPEN_b9fe2261-8d91-4ab3-a099-2797315ebeb1",
          "sourceHandle": "output-down",
          "target": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4_PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112__ENO_input-down",
          "source": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "sourceHandle": "ENO",
          "target": "PARALLEL_CLOSE_a7b7e579-39cf-4185-8597-9785a1334112",
          "targetHandle": "input-down"
        },
        {
          "id": "e_VARIABLE_905ca664-ca09-45ac-913c-985d78e7f084_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output_REQ",
          "source": "VARIABLE_905ca664-ca09-45ac-913c-985d78e7f084",
          "sourceHandle": "output",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_dfe446d5-acd2-4d2b-a5ef-32c86ed6fae4_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output_SLAVE_ID",
          "source": "VARIABLE_dfe446d5-acd2-4d2b-a5ef-32c86ed6fae4",
          "sourceHandle": "output",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_dc247c74-0cdd-4df7-8c4d-12c9aa0856db_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output_REG_TYPE",
          "source": "VARIABLE_dc247c74-0cdd-4df7-8c4d-12c9aa0856db",
          "sourceHandle": "output",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_3d737f5b-8c02-40be-9293-0375415389d6_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output_START_ADDR",
          "source": "VARIABLE_3d737f5b-8c02-40be-9293-0375415389d6",
          "sourceHandle": "output",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_86902ad8-e709-4401-afa1-c5b76f7811cd_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086__output_LENGTH",
          "source": "VARIABLE_86902ad8-e709-4401-afa1-c5b76f7811cd",
          "sourceHandle": "output",
          "target": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_baeef43d-b124-459f-b09f-9e1bd2837b20__DONE_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "DONE",
          "target": "VARIABLE_baeef43d-b124-459f-b09f-9e1bd2837b20",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_844632e2-8b2e-4945-b4da-e3081b473715__ERROR_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_844632e2-8b2e-4945-b4da-e3081b473715",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_387451c1-ca23-4cd1-a0a8-c9cbd55a54b8__COIL_01_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_01",
          "target": "VARIABLE_387451c1-ca23-4cd1-a0a8-c9cbd55a54b8",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_d0a6b81d-8b56-4d77-9ab1-8d027c743044__COIL_02_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_02",
          "target": "VARIABLE_d0a6b81d-8b56-4d77-9ab1-8d027c743044",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_e7dd40fb-f1d8-4a34-84db-05c19cf67588__COIL_03_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_03",
          "target": "VARIABLE_e7dd40fb-f1d8-4a34-84db-05c19cf67588",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_cdd7d8af-ad5f-4fed-961e-f6d6bf298104__COIL_04_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_04",
          "target": "VARIABLE_cdd7d8af-ad5f-4fed-961e-f6d6bf298104",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_41d828bb-a176-4798-962b-b60a67edb0ab__COIL_05_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_05",
          "target": "VARIABLE_41d828bb-a176-4798-962b-b60a67edb0ab",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_95eac4c5-d1f4-462f-af7a-ea334e4ef2b0__COIL_06_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_06",
          "target": "VARIABLE_95eac4c5-d1f4-462f-af7a-ea334e4ef2b0",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_403b2da7-ac1a-43ff-85fb-c210c6efb586__COIL_07_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_07",
          "target": "VARIABLE_403b2da7-ac1a-43ff-85fb-c210c6efb586",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_05932b66-38b4-408e-923a-4de414a9964e__COIL_08_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "COIL_08",
          "target": "VARIABLE_05932b66-38b4-408e-923a-4de414a9964e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_9dea5c04-1001-4106-a357-c5f4e4d8223c__REG_01_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_01",
          "target": "VARIABLE_9dea5c04-1001-4106-a357-c5f4e4d8223c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_cff8d9fa-059c-412e-a09c-9747da2e2a5d__REG_02_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_02",
          "target": "VARIABLE_cff8d9fa-059c-412e-a09c-9747da2e2a5d",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_16d12341-f70d-4898-9369-218703c119ec__REG_03_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_03",
          "target": "VARIABLE_16d12341-f70d-4898-9369-218703c119ec",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_39cc0829-8639-46d7-ae70-d40744ecb9ef__REG_04_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_04",
          "target": "VARIABLE_39cc0829-8639-46d7-ae70-d40744ecb9ef",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_9549817e-d279-489a-a5aa-37a7692a2b9e__REG_05_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_05",
          "target": "VARIABLE_9549817e-d279-489a-a5aa-37a7692a2b9e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_7313d1d9-4b40-472f-a4b3-69870c807b1d__REG_06_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_06",
          "target": "VARIABLE_7313d1d9-4b40-472f-a4b3-69870c807b1d",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_2eab7c8b-3d89-4c91-9f5f-bb1fb8775cd3__REG_07_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_07",
          "target": "VARIABLE_2eab7c8b-3d89-4c91-9f5f-bb1fb8775cd3",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086_VARIABLE_e1045178-fa43-40eb-b255-0d3ec71131f5__REG_08_input",
          "source": "BLOCK_916aa416-1c86-49f9-8d5d-a4fb87ea0086",
          "sourceHandle": "REG_08",
          "target": "VARIABLE_e1045178-fa43-40eb-b255-0d3ec71131f5",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_1231c646-2673-4e87-9500-59bc2054b38a_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output_REQ",
          "source": "VARIABLE_1231c646-2673-4e87-9500-59bc2054b38a",
          "sourceHandle": "output",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_6f18e6d1-6e0f-4b1e-96fb-ffa6f188c50b_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output_SLAVE_ID",
          "source": "VARIABLE_6f18e6d1-6e0f-4b1e-96fb-ffa6f188c50b",
          "sourceHandle": "output",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_beb20498-7afb-4b82-b789-ac8d963e14d9_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output_REG_TYPE",
          "source": "VARIABLE_beb20498-7afb-4b82-b789-ac8d963e14d9",
          "sourceHandle": "output",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_aede04a6-afa4-474a-a646-f0c1b7511b15_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output_START_ADDR",
          "source": "VARIABLE_aede04a6-afa4-474a-a646-f0c1b7511b15",
          "sourceHandle": "output",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_af548b2c-6400-4896-8895-ee357720b864_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a__output_LENGTH",
          "source": "VARIABLE_af548b2c-6400-4896-8895-ee357720b864",
          "sourceHandle": "output",
          "target": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_ad4641fc-ce4e-43ea-a10b-53f61938a69b__DONE_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "DONE",
          "target": "VARIABLE_ad4641fc-ce4e-43ea-a10b-53f61938a69b",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_d24fcb42-af25-4125-b0a7-119ac99152ee__ERROR_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_d24fcb42-af25-4125-b0a7-119ac99152ee",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_96d3a14d-f1a6-47da-b447-f445e6707c34__COIL_01_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_01",
          "target": "VARIABLE_96d3a14d-f1a6-47da-b447-f445e6707c34",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_a2ae6494-14ad-4d69-b4f5-9d5b50d63a9f__COIL_02_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_02",
          "target": "VARIABLE_a2ae6494-14ad-4d69-b4f5-9d5b50d63a9f",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_c879c87d-7b25-4b5f-82ac-115490839190__COIL_03_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_03",
          "target": "VARIABLE_c879c87d-7b25-4b5f-82ac-115490839190",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_185f9a83-f02f-4a62-9b26-075effc773b4__COIL_04_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_04",
          "target": "VARIABLE_185f9a83-f02f-4a62-9b26-075effc773b4",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_6a75a4e9-e710-4dc0-94fe-0d2827bb085e__COIL_05_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_05",
          "target": "VARIABLE_6a75a4e9-e710-4dc0-94fe-0d2827bb085e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_852cd2b7-ba5f-44c2-a68a-9277d3aa2277__COIL_06_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_06",
          "target": "VARIABLE_852cd2b7-ba5f-44c2-a68a-9277d3aa2277",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_a762508b-9022-432d-8b63-59e788f8b4d1__COIL_07_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_07",
          "target": "VARIABLE_a762508b-9022-432d-8b63-59e788f8b4d1",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_496ed6d0-0f3c-4d1e-8718-781422aca2c3__COIL_08_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "COIL_08",
          "target": "VARIABLE_496ed6d0-0f3c-4d1e-8718-781422aca2c3",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_94219e56-4c30-415c-87d2-4167f69bf655__REG_01_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_01",
          "target": "VARIABLE_94219e56-4c30-415c-87d2-4167f69bf655",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_1a415ff9-d900-493c-b21c-7f4ecb1b0c94__REG_02_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_02",
          "target": "VARIABLE_1a415ff9-d900-493c-b21c-7f4ecb1b0c94",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_7153629c-89fa-486b-a38e-182683fc25ff__REG_03_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_03",
          "target": "VARIABLE_7153629c-89fa-486b-a38e-182683fc25ff",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_aba9ecd2-6c67-4ec9-9ebb-7cb17d377c37__REG_04_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_04",
          "target": "VARIABLE_aba9ecd2-6c67-4ec9-9ebb-7cb17d377c37",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_1e56f358-18c4-45af-92a0-25dca164350a__REG_05_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_05",
          "target": "VARIABLE_1e56f358-18c4-45af-92a0-25dca164350a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_a9a964ac-ba33-4e61-b5bd-a4aaed374dfc__REG_06_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_06",
          "target": "VARIABLE_a9a964ac-ba33-4e61-b5bd-a4aaed374dfc",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_7faf0676-2ed6-4703-8b63-45ccdaa38177__REG_07_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_07",
          "target": "VARIABLE_7faf0676-2ed6-4703-8b63-45ccdaa38177",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a_VARIABLE_784837c9-dddc-4ad7-bdbb-eda1f9d7d5eb__REG_08_input",
          "source": "BLOCK_5e651c69-fb57-469c-bc85-6b672f35810a",
          "sourceHandle": "REG_08",
          "target": "VARIABLE_784837c9-dddc-4ad7-bdbb-eda1f9d7d5eb",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_f31705fc-d96b-4d31-805e-3b7f6758afff_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REQ",
          "source": "VARIABLE_f31705fc-d96b-4d31-805e-3b7f6758afff",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_d37284af-bb54-4b13-897c-71c7f033972d_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_SLAVE_ID",
          "source": "VARIABLE_d37284af-bb54-4b13-897c-71c7f033972d",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_ab5393bc-dc41-445b-8501-4f2308710d6a_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_TYPE",
          "source": "VARIABLE_ab5393bc-dc41-445b-8501-4f2308710d6a",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_1994f669-e327-4a9e-9f27-2421379458d7_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_START_ADDR",
          "source": "VARIABLE_1994f669-e327-4a9e-9f27-2421379458d7",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_507b7f9b-6086-42e7-8752-727184680493_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_LENGTH",
          "source": "VARIABLE_507b7f9b-6086-42e7-8752-727184680493",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_0fb987c8-d0b5-47f3-9f16-876b674f3735_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_01",
          "source": "VARIABLE_0fb987c8-d0b5-47f3-9f16-876b674f3735",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_01"
        },
        {
          "id": "e_VARIABLE_b1f78a6f-fa97-4fab-b110-44016e93e0cc_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_02",
          "source": "VARIABLE_b1f78a6f-fa97-4fab-b110-44016e93e0cc",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_02"
        },
        {
          "id": "e_VARIABLE_875ccc70-0fc3-4b0d-94a8-c94b7de25137_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_03",
          "source": "VARIABLE_875ccc70-0fc3-4b0d-94a8-c94b7de25137",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_03"
        },
        {
          "id": "e_VARIABLE_c64f98cf-824b-4bd1-afe1-c5abf2f796a2_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_04",
          "source": "VARIABLE_c64f98cf-824b-4bd1-afe1-c5abf2f796a2",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_04"
        },
        {
          "id": "e_VARIABLE_a044662c-6f7a-4492-8373-54827d155613_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_05",
          "source": "VARIABLE_a044662c-6f7a-4492-8373-54827d155613",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_05"
        },
        {
          "id": "e_VARIABLE_72526789-741d-4f17-ae82-757e95dc3a32_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_06",
          "source": "VARIABLE_72526789-741d-4f17-ae82-757e95dc3a32",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_06"
        },
        {
          "id": "e_VARIABLE_14b0775c-e4b2-4af8-bc2f-7f4e3f2e0bf7_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_07",
          "source": "VARIABLE_14b0775c-e4b2-4af8-bc2f-7f4e3f2e0bf7",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_07"
        },
        {
          "id": "e_VARIABLE_54f0dde9-86ca-486e-b2ba-fb036fc55a32_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_COIL_08",
          "source": "VARIABLE_54f0dde9-86ca-486e-b2ba-fb036fc55a32",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "COIL_08"
        },
        {
          "id": "e_VARIABLE_7f005ad3-de18-41fb-9f3f-f4182fd539a1_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_01",
          "source": "VARIABLE_7f005ad3-de18-41fb-9f3f-f4182fd539a1",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_01"
        },
        {
          "id": "e_VARIABLE_c2e6d3ff-824e-4137-ba7e-b49a88a808e6_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_02",
          "source": "VARIABLE_c2e6d3ff-824e-4137-ba7e-b49a88a808e6",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_02"
        },
        {
          "id": "e_VARIABLE_9bd76304-fe9f-46c4-bc9f-4aee58e8d11a_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_03",
          "source": "VARIABLE_9bd76304-fe9f-46c4-bc9f-4aee58e8d11a",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_03"
        },
        {
          "id": "e_VARIABLE_e2d2f4c8-3ebb-44ae-aeb9-43dc81b1a712_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_04",
          "source": "VARIABLE_e2d2f4c8-3ebb-44ae-aeb9-43dc81b1a712",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_04"
        },
        {
          "id": "e_VARIABLE_1881f65c-ad36-402e-85a2-f17eb80095e9_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_05",
          "source": "VARIABLE_1881f65c-ad36-402e-85a2-f17eb80095e9",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_05"
        },
        {
          "id": "e_VARIABLE_2b19f07b-ba91-43f2-9031-099372dcb2e6_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_06",
          "source": "VARIABLE_2b19f07b-ba91-43f2-9031-099372dcb2e6",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_06"
        },
        {
          "id": "e_VARIABLE_a9ab00fa-4334-4d9a-8987-c38ee912a4ec_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_07",
          "source": "VARIABLE_a9ab00fa-4334-4d9a-8987-c38ee912a4ec",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_07"
        },
        {
          "id": "e_VARIABLE_43ebfd8c-39a7-4957-9320-bf7a0445178f_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc__output_REG_08",
          "source": "VARIABLE_43ebfd8c-39a7-4957-9320-bf7a0445178f",
          "sourceHandle": "output",
          "target": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "targetHandle": "REG_08"
        },
        {
          "id": "e_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc_VARIABLE_59da4b4e-056e-4434-819b-13472730329e__DONE_input",
          "source": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "sourceHandle": "DONE",
          "target": "VARIABLE_59da4b4e-056e-4434-819b-13472730329e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc_VARIABLE_1ffc256f-4d2a-4a3d-b30d-8ec6d39aa8c2__ERROR_input",
          "source": "BLOCK_dc0b352e-e9da-465e-99ae-5f0af4fb3dbc",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_1ffc256f-4d2a-4a3d-b30d-8ec6d39aa8c2",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_70197fee-89a2-418c-98a4-364b284b6143_BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8__output_IN",
          "source": "VARIABLE_70197fee-89a2-418c-98a4-364b284b6143",
          "sourceHandle": "output",
          "target": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8_VARIABLE_81b31596-2fa7-455d-b47d-7ac5d27f5516__OUT_input",
          "source": "BLOCK_6a637c16-3cd2-44a2-ad6f-4a903ea5e6c8",
          "sourceHandle": "OUT",
          "target": "VARIABLE_81b31596-2fa7-455d-b47d-7ac5d27f5516",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_8a74568b-e595-4c3e-be06-27f63666ec0a_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4__output_IN",
          "source": "VARIABLE_8a74568b-e595-4c3e-be06-27f63666ec0a",
          "sourceHandle": "output",
          "target": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "targetHandle": "IN"
        },
        {
          "id": "e_BLOCK_d3865605-713d-4914-bd8e-392b23382eb4_VARIABLE_1a02dd71-b61f-4a19-9b0a-25ab89bb7126__OUT_input",
          "source": "BLOCK_d3865605-713d-4914-bd8e-392b23382eb4",
          "sourceHandle": "OUT",
          "target": "VARIABLE_1a02dd71-b61f-4a19-9b0a-25ab89bb7126",
          "targetHandle": "input"
        },
        {
          "id": "e_VARIABLE_3dac2d7e-b7dd-4041-9cb9-035f7ce730ea_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REQ",
          "source": "VARIABLE_3dac2d7e-b7dd-4041-9cb9-035f7ce730ea",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REQ"
        },
        {
          "id": "e_VARIABLE_2703d0d3-346d-41f6-8005-f8b3fb423ec6_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_SLAVE_ID",
          "source": "VARIABLE_2703d0d3-346d-41f6-8005-f8b3fb423ec6",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "SLAVE_ID"
        },
        {
          "id": "e_VARIABLE_f20e335f-8051-42bf-897c-35aecc2353ab_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_TYPE",
          "source": "VARIABLE_f20e335f-8051-42bf-897c-35aecc2353ab",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_TYPE"
        },
        {
          "id": "e_VARIABLE_a5c0b3cd-9936-49d4-937a-cea4a963f6f6_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_START_ADDR",
          "source": "VARIABLE_a5c0b3cd-9936-49d4-937a-cea4a963f6f6",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "START_ADDR"
        },
        {
          "id": "e_VARIABLE_4710142c-f4e1-4011-a5fa-91e25cde6974_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_LENGTH",
          "source": "VARIABLE_4710142c-f4e1-4011-a5fa-91e25cde6974",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "LENGTH"
        },
        {
          "id": "e_VARIABLE_c25b61f3-815e-4c74-adc1-06b94ac5a5eb_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_01",
          "source": "VARIABLE_c25b61f3-815e-4c74-adc1-06b94ac5a5eb",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_01"
        },
        {
          "id": "e_VARIABLE_eb8d9761-39bd-4f5f-943b-195c8855f839_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_02",
          "source": "VARIABLE_eb8d9761-39bd-4f5f-943b-195c8855f839",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_02"
        },
        {
          "id": "e_VARIABLE_d939625f-84f9-4ef7-b746-833eae6b392b_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_03",
          "source": "VARIABLE_d939625f-84f9-4ef7-b746-833eae6b392b",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_03"
        },
        {
          "id": "e_VARIABLE_8933463b-0269-43dc-95c6-05e5cba2a954_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_04",
          "source": "VARIABLE_8933463b-0269-43dc-95c6-05e5cba2a954",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_04"
        },
        {
          "id": "e_VARIABLE_d7e18bb7-49c7-48a3-b8c9-b6c27200cda7_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_05",
          "source": "VARIABLE_d7e18bb7-49c7-48a3-b8c9-b6c27200cda7",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_05"
        },
        {
          "id": "e_VARIABLE_7de619cc-5ea3-4ac5-9e18-3301f57da59b_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_06",
          "source": "VARIABLE_7de619cc-5ea3-4ac5-9e18-3301f57da59b",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_06"
        },
        {
          "id": "e_VARIABLE_45f205d5-b713-4e8c-a352-93059800f4dd_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_07",
          "source": "VARIABLE_45f205d5-b713-4e8c-a352-93059800f4dd",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_07"
        },
        {
          "id": "e_VARIABLE_8c3d4882-86e5-4d63-b3ec-b23e6992b9e5_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_COIL_08",
          "source": "VARIABLE_8c3d4882-86e5-4d63-b3ec-b23e6992b9e5",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "COIL_08"
        },
        {
          "id": "e_VARIABLE_44936208-5ce8-47df-b471-e1e8796d9521_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_01",
          "source": "VARIABLE_44936208-5ce8-47df-b471-e1e8796d9521",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_01"
        },
        {
          "id": "e_VARIABLE_cd7411f6-3c54-44b0-aa53-ed5874f4476a_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_02",
          "source": "VARIABLE_cd7411f6-3c54-44b0-aa53-ed5874f4476a",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_02"
        },
        {
          "id": "e_VARIABLE_af02941e-fbb0-4133-8c2b-61bf0e17c70a_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_03",
          "source": "VARIABLE_af02941e-fbb0-4133-8c2b-61bf0e17c70a",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_03"
        },
        {
          "id": "e_VARIABLE_eb6af5bf-15a6-4587-9acb-88d485cbbed8_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_04",
          "source": "VARIABLE_eb6af5bf-15a6-4587-9acb-88d485cbbed8",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_04"
        },
        {
          "id": "e_VARIABLE_b0bbb90e-c1ff-4d67-a9e5-714633c3a886_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_05",
          "source": "VARIABLE_b0bbb90e-c1ff-4d67-a9e5-714633c3a886",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_05"
        },
        {
          "id": "e_VARIABLE_08bfaadf-a1ba-4744-a8f9-66f225c076b6_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_06",
          "source": "VARIABLE_08bfaadf-a1ba-4744-a8f9-66f225c076b6",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_06"
        },
        {
          "id": "e_VARIABLE_045e9ab9-b27d-47d8-9c7c-af7fc9fcd6df_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_07",
          "source": "VARIABLE_045e9ab9-b27d-47d8-9c7c-af7fc9fcd6df",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_07"
        },
        {
          "id": "e_VARIABLE_4cee0fa5-cb32-4727-9db7-706b25548c1a_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7__output_REG_08",
          "source": "VARIABLE_4cee0fa5-cb32-4727-9db7-706b25548c1a",
          "sourceHandle": "output",
          "target": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "targetHandle": "REG_08"
        },
        {
          "id": "e_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7_VARIABLE_993070d8-cea4-4392-be79-668c293262fb__DONE_input",
          "source": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "sourceHandle": "DONE",
          "target": "VARIABLE_993070d8-cea4-4392-be79-668c293262fb",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7_VARIABLE_acc89de6-9584-4cca-a66f-97e33026881b__ERROR_input",
          "source": "BLOCK_40c81ce1-041e-4830-baf4-5d18a1851be7",
          "sourceHandle": "ERROR",
          "target": "VARIABLE_acc89de6-9584-4cca-a66f-97e33026881b",
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