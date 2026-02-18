PROGRAM main
VAR
	MODBEE_INPUTS0 : MODBEE_INPUTS;
	MODBEE_OUTPUTS0 : MODBEE_OUTPUTS;
	start : bool;
	stop : bool;
	run : bool;
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
        580,
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
          "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "height": 540,
          "width": 174,
          "measured": {
            "width": 174,
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
                  "x": 317,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 90
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 170
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 210
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 250
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 290
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 330
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 370
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 410
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 450
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 490
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 530
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 50
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 90
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 130
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 170
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 210
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 250
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 290
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 330
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 370
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 410
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 450
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 490
                },
                "relPosition": {
                  "x": 174,
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
                  "x": 317,
                  "y": 530
                },
                "relPosition": {
                  "x": 174,
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
                "x": 317,
                "y": 50
              },
              "relPosition": {
                "x": 174,
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
            "numericId": "6616654",
            "variant": {
              "name": "MODBEE_INPUTS",
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
              "name": "MODBEE_INPUTS0",
              "type": {
                "definition": "derived",
                "value": "MODBEE_INPUTS"
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
                "handleId": "DX01",
                "type": "output",
                "variable": {
                  "name": "start"
                }
              },
              {
                "handleId": "DX02",
                "type": "output",
                "variable": {
                  "name": "stop"
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
            "x": 577,
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
                "x": 577
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
          "id": "VARIABLE_3b23972a-c281-40a6-9f82-c005bc715166",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "9608992",
            "variable": {
              "name": "start",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_3b23972a-c281-40a6-9f82-c005bc715166"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
          "id": "VARIABLE_a31c4701-1218-4e98-8736-bc18d8e60cee",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "6089062",
            "variable": {
              "name": "stop",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_a31c4701-1218-4e98-8736-bc18d8e60cee"
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
          "id": "VARIABLE_21ca6ce3-aa36-48af-b9ee-08804b366e9a",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "8427264",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_25dd0b2e-76e9-43cc-85e1-926f60bf757c",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "9443740",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e766bb15-c762-494f-a4ab-0aa7a1de8d4e",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "3150254",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_ab677951-78df-4db6-9181-0533d378b628",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "6999005",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_d60807ed-ed72-4f7d-8ef3-55c596bcd327",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "5301241",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_08bcc650-be92-4d6d-85a1-6284d2898b9c",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "2273574",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_0e706850-0f34-4bb3-881c-6627db35e902",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "9591157",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_597c5626-ab29-4a34-aad2-3624bd9d62e7",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "10263128",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
          "id": "VARIABLE_d2507253-7fc7-45aa-a0b1-7f00ac86465a",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "8478565",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
          "id": "VARIABLE_e3b1809a-9ce0-45ea-8ecf-aff4b13364bf",
          "type": "variable",
          "position": {
            "x": 347,
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
                  "x": 347,
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
                  "x": 347,
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
                "x": 347,
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
            "numericId": "10413711",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6__left-rail_EN",
          "source": "left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "sourceHandle": "left-rail",
          "target": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110__ENO_right-rail",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_3b23972a-c281-40a6-9f82-c005bc715166__DX01_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX01",
          "target": "VARIABLE_3b23972a-c281-40a6-9f82-c005bc715166",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_a31c4701-1218-4e98-8736-bc18d8e60cee__DX02_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX02",
          "target": "VARIABLE_a31c4701-1218-4e98-8736-bc18d8e60cee",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_21ca6ce3-aa36-48af-b9ee-08804b366e9a__DX03_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX03",
          "target": "VARIABLE_21ca6ce3-aa36-48af-b9ee-08804b366e9a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_25dd0b2e-76e9-43cc-85e1-926f60bf757c__DX04_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX04",
          "target": "VARIABLE_25dd0b2e-76e9-43cc-85e1-926f60bf757c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_e766bb15-c762-494f-a4ab-0aa7a1de8d4e__DX05_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX05",
          "target": "VARIABLE_e766bb15-c762-494f-a4ab-0aa7a1de8d4e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_ab677951-78df-4db6-9181-0533d378b628__DX06_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX06",
          "target": "VARIABLE_ab677951-78df-4db6-9181-0533d378b628",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_d60807ed-ed72-4f7d-8ef3-55c596bcd327__DX07_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX07",
          "target": "VARIABLE_d60807ed-ed72-4f7d-8ef3-55c596bcd327",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_08bcc650-be92-4d6d-85a1-6284d2898b9c__DX08_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "DX08",
          "target": "VARIABLE_08bcc650-be92-4d6d-85a1-6284d2898b9c",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_0e706850-0f34-4bb3-881c-6627db35e902__AX01_Scaled_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "AX01_Scaled",
          "target": "VARIABLE_0e706850-0f34-4bb3-881c-6627db35e902",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_597c5626-ab29-4a34-aad2-3624bd9d62e7__AX02_Scaled_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "AX02_Scaled",
          "target": "VARIABLE_597c5626-ab29-4a34-aad2-3624bd9d62e7",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_d2507253-7fc7-45aa-a0b1-7f00ac86465a__AX03_Scaled_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "AX03_Scaled",
          "target": "VARIABLE_d2507253-7fc7-45aa-a0b1-7f00ac86465a",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6_VARIABLE_e3b1809a-9ce0-45ea-8ecf-aff4b13364bf__AX04_Scaled_input",
          "source": "BLOCK_bc96a700-ee7a-435b-a8c5-8f2187cb1cd6",
          "sourceHandle": "AX04_Scaled",
          "target": "VARIABLE_e3b1809a-9ce0-45ea-8ecf-aff4b13364bf",
          "targetHandle": "input"
        }
      ]
    },
    {
      "id": "rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7",
      "comment": "Process Logic",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        445,
        174
      ],
      "nodes": [
        {
          "id": "left-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7",
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
            "numericId": "2003023",
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
          "id": "PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c",
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
            "numericId": "5134481",
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
            "parallelCloseReference": "PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98",
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
          "id": "CONTACT_90298b9f-3560-474d-9ef5-717e6daf50e4",
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
            "variant": "default",
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
            "numericId": "2575801",
            "variable": {
              "name": "start",
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
          "id": "CONTACT_2ec06944-484f-48df-9172-7bdbbb899379",
          "type": "contact",
          "position": {
            "x": 72,
            "y": 130
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
                  "y": 142
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
                  "y": 142
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
                  "y": 142
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
                  "y": 142
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
                "y": 142
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
                "y": 142
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
            "numericId": "4916078",
            "variable": {
              "name": "run",
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
          "id": "PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98",
          "type": "parallel",
          "position": {
            "x": 141,
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
                  "x": 141,
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
                  "x": 145,
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
                  "x": 145,
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
                  "x": 145,
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
                  "x": 141,
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
                  "x": 145,
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
                  "x": 145,
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
                  "x": 145,
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
                "x": 141,
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
                "x": 145,
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
            "numericId": "1194020",
            "parallelInputConnector": {
              "glbPosition": {
                "x": 145,
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
                "x": 145,
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
            "parallelOpenReference": "PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c",
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
          "id": "CONTACT_553cf5f3-5ebb-43f4-b579-0cb21056090d",
          "type": "contact",
          "position": {
            "x": 190,
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
                  "x": 190,
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
                  "x": 214,
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
                  "x": 190,
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
                  "x": 214,
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
                "x": 190,
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
                "x": 214,
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
            "numericId": "1150125",
            "variable": {
              "name": "stop",
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
          "id": "COIL_9cf422de-5400-4a83-9751-ad6df9286740",
          "type": "coil",
          "position": {
            "x": 304,
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
                  "x": 304,
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
                  "x": 332,
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
                  "x": 304,
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
                  "x": 332,
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
                "x": 304,
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
                "x": 332,
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
            "numericId": "5001129",
            "variable": {
              "name": "run",
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
          "id": "right-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7",
          "type": "powerRail",
          "position": {
            "x": 442,
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
                "x": 442
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
            "numericId": "7546059",
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7_PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c__left-rail_input",
          "source": "left-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7",
          "sourceHandle": "left-rail",
          "target": "PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c_CONTACT_90298b9f-3560-474d-9ef5-717e6daf50e4__output-right_input",
          "source": "PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c",
          "sourceHandle": "output-right",
          "target": "CONTACT_90298b9f-3560-474d-9ef5-717e6daf50e4",
          "targetHandle": "input"
        },
        {
          "id": "e_PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c_CONTACT_2ec06944-484f-48df-9172-7bdbbb899379__output-down_input",
          "source": "PARALLEL_OPEN_893974b3-d005-4536-99c7-0f00f4f86c9c",
          "sourceHandle": "output-down",
          "target": "CONTACT_2ec06944-484f-48df-9172-7bdbbb899379",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_2ec06944-484f-48df-9172-7bdbbb899379_PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98__output_input-down",
          "source": "CONTACT_2ec06944-484f-48df-9172-7bdbbb899379",
          "sourceHandle": "output",
          "target": "PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98",
          "targetHandle": "input-down"
        },
        {
          "id": "e_COIL_9cf422de-5400-4a83-9751-ad6df9286740_right-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7__output_right-rail",
          "source": "COIL_9cf422de-5400-4a83-9751-ad6df9286740",
          "sourceHandle": "output",
          "target": "right-rail-rung_main_ec9711de-d008-4fbc-a210-fe926df0b1f7",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98_CONTACT_553cf5f3-5ebb-43f4-b579-0cb21056090d__output-right_input",
          "source": "PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98",
          "sourceHandle": "output-right",
          "target": "CONTACT_553cf5f3-5ebb-43f4-b579-0cb21056090d",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_553cf5f3-5ebb-43f4-b579-0cb21056090d_COIL_9cf422de-5400-4a83-9751-ad6df9286740__output_input",
          "source": "CONTACT_553cf5f3-5ebb-43f4-b579-0cb21056090d",
          "sourceHandle": "output",
          "target": "COIL_9cf422de-5400-4a83-9751-ad6df9286740",
          "targetHandle": "input"
        },
        {
          "id": "e_CONTACT_90298b9f-3560-474d-9ef5-717e6daf50e4_PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98__output_input",
          "source": "CONTACT_90298b9f-3560-474d-9ef5-717e6daf50e4",
          "sourceHandle": "output",
          "target": "PARALLEL_CLOSE_5f86faf3-6b23-49dd-a3e6-c0e2dc1c5d98",
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
        592,
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
          "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "type": "block",
          "position": {
            "x": 143,
            "y": 14
          },
          "height": 460,
          "width": 186,
          "measured": {
            "width": 186,
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
                  "x": 329,
                  "y": 50
                },
                "relPosition": {
                  "x": 186,
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
                  "x": 329,
                  "y": 50
                },
                "relPosition": {
                  "x": 186,
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
                "x": 329,
                "y": 50
              },
              "relPosition": {
                "x": 186,
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
            "numericId": "4563959",
            "variant": {
              "name": "MODBEE_OUTPUTS",
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
              "name": "MODBEE_OUTPUTS0",
              "type": {
                "definition": "derived",
                "value": "MODBEE_OUTPUTS"
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
                "handleId": "DY01",
                "type": "input",
                "variable": {
                  "name": "run"
                }
              }
            ],
            "draggable": true,
            "selectable": true,
            "deletable": true
          }
        },
        {
          "id": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "type": "powerRail",
          "position": {
            "x": 589,
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
                "x": 589
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
          "id": "VARIABLE_092dce93-ff06-4e4a-b618-63a9870ad3da",
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
            "numericId": "7283231",
            "variable": {
              "name": "run",
              "class": "local",
              "type": {
                "definition": "base-type",
                "value": "bool"
              },
              "location": "",
              "initialValue": null,
              "documentation": "",
              "debug": false,
              "id": "broken-VARIABLE_092dce93-ff06-4e4a-b618-63a9870ad3da"
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
            "deletable": false,
            "wrongVariable": true
          }
        },
        {
          "id": "VARIABLE_afcd6917-ab2a-45c3-a7b4-63feb54f4df4",
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
            "numericId": "8346592",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_4dc5f78f-a11b-4da4-a484-dba19cfa6963",
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
            "numericId": "7192473",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_5297c227-24f8-406a-91ed-ff74637c696a",
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
            "numericId": "7332210",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_cd6cb3f8-0b83-4fad-b573-fc318704450a",
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
            "numericId": "7318113",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_6376b72c-f1dd-47aa-9bef-9c39edcb9d89",
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
            "numericId": "6820545",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_877b7fcd-f493-47d5-8504-d7a8e2fdc27e",
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
            "numericId": "10206701",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_32a6cd54-4de8-4be7-87a7-665d239f4fd5",
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
            "numericId": "10190539",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_252e53e9-71c9-4552-b593-940752907a4f",
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
            "numericId": "2066275",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "VARIABLE_ecfcff18-917e-49d6-a2b3-5527aa160dc7",
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
            "numericId": "6348199",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
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
          "id": "e_left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__left-rail_EN",
          "source": "left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "sourceHandle": "left-rail",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926_right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54__ENO_right-rail",
          "source": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_092dce93-ff06-4e4a-b618-63a9870ad3da_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY01",
          "source": "VARIABLE_092dce93-ff06-4e4a-b618-63a9870ad3da",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY01"
        },
        {
          "id": "e_VARIABLE_afcd6917-ab2a-45c3-a7b4-63feb54f4df4_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY02",
          "source": "VARIABLE_afcd6917-ab2a-45c3-a7b4-63feb54f4df4",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY02"
        },
        {
          "id": "e_VARIABLE_4dc5f78f-a11b-4da4-a484-dba19cfa6963_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY03",
          "source": "VARIABLE_4dc5f78f-a11b-4da4-a484-dba19cfa6963",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY03"
        },
        {
          "id": "e_VARIABLE_5297c227-24f8-406a-91ed-ff74637c696a_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY04",
          "source": "VARIABLE_5297c227-24f8-406a-91ed-ff74637c696a",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY04"
        },
        {
          "id": "e_VARIABLE_cd6cb3f8-0b83-4fad-b573-fc318704450a_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY05",
          "source": "VARIABLE_cd6cb3f8-0b83-4fad-b573-fc318704450a",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY05"
        },
        {
          "id": "e_VARIABLE_6376b72c-f1dd-47aa-9bef-9c39edcb9d89_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY06",
          "source": "VARIABLE_6376b72c-f1dd-47aa-9bef-9c39edcb9d89",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY06"
        },
        {
          "id": "e_VARIABLE_877b7fcd-f493-47d5-8504-d7a8e2fdc27e_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY07",
          "source": "VARIABLE_877b7fcd-f493-47d5-8504-d7a8e2fdc27e",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY07"
        },
        {
          "id": "e_VARIABLE_32a6cd54-4de8-4be7-87a7-665d239f4fd5_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_DY08",
          "source": "VARIABLE_32a6cd54-4de8-4be7-87a7-665d239f4fd5",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "DY08"
        },
        {
          "id": "e_VARIABLE_252e53e9-71c9-4552-b593-940752907a4f_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_AY01_Scaled",
          "source": "VARIABLE_252e53e9-71c9-4552-b593-940752907a4f",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "AY01_Scaled"
        },
        {
          "id": "e_VARIABLE_ecfcff18-917e-49d6-a2b3-5527aa160dc7_BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926__output_AY02_Scaled",
          "source": "VARIABLE_ecfcff18-917e-49d6-a2b3-5527aa160dc7",
          "sourceHandle": "output",
          "target": "BLOCK_2389e069-e5e8-4a52-beba-ed4203ff7926",
          "targetHandle": "AY02_Scaled"
        }
      ]
    }
  ]
}
END_PROGRAM