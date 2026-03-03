PROGRAM main
VAR
	MODBEE_HW_INPUTS0 : MODBEE_HW_INPUTS;
	MODBEE_HW_OUTPUTS0 : MODBEE_HW_OUTPUTS;
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
          "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
            "numericId": "5932900",
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
            "connectedVariables": [],
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
          "id": "VARIABLE_2d825145-d86d-4d9e-bf27-4f868decfa07",
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
            "numericId": "6653818",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_e71720eb-1b53-421b-a2d5-bf7c22a62f05",
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
            "numericId": "9136868",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
            "deletable": false
          }
        },
        {
          "id": "VARIABLE_99ba893f-d724-4fab-b5f4-e18f26ce4c42",
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
            "numericId": "4476906",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_1ac2b313-db50-46f0-ae6e-e56b8ccb5691",
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
            "numericId": "7004580",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_ae9ccb8c-1430-4901-ab73-88465f8852cb",
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
            "numericId": "7127151",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_abe0ef2e-afa5-48e7-9044-d085a7d5e2e9",
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
            "numericId": "8868814",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_16ebf2d7-31cb-48d5-9f71-c517c76c744e",
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
            "numericId": "5781498",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_fa0a8c18-c9cd-437f-bc1d-2ba8e5ded397",
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
            "numericId": "4552509",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_5b72ccb2-f9bd-472b-9302-8958bede4324",
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
            "numericId": "8833462",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_98e84e17-7ed8-4d75-a277-994636451583",
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
            "numericId": "7561168",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_9463a696-60a8-4ec1-8e58-9c35ac5f38b0",
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
            "numericId": "4103337",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "VARIABLE_7280903b-7564-4ead-899f-243b17063935",
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
            "numericId": "3238345",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "output",
            "block": {
              "id": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
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
          "id": "e_left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2__left-rail_EN",
          "source": "left-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "sourceHandle": "left-rail",
          "target": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110__ENO_right-rail",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_a0b2da4e-4421-4301-9867-6a29ceb80110",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_2d825145-d86d-4d9e-bf27-4f868decfa07__DX01_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX01",
          "target": "VARIABLE_2d825145-d86d-4d9e-bf27-4f868decfa07",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_e71720eb-1b53-421b-a2d5-bf7c22a62f05__DX02_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX02",
          "target": "VARIABLE_e71720eb-1b53-421b-a2d5-bf7c22a62f05",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_99ba893f-d724-4fab-b5f4-e18f26ce4c42__DX03_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX03",
          "target": "VARIABLE_99ba893f-d724-4fab-b5f4-e18f26ce4c42",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_1ac2b313-db50-46f0-ae6e-e56b8ccb5691__DX04_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX04",
          "target": "VARIABLE_1ac2b313-db50-46f0-ae6e-e56b8ccb5691",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_ae9ccb8c-1430-4901-ab73-88465f8852cb__DX05_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX05",
          "target": "VARIABLE_ae9ccb8c-1430-4901-ab73-88465f8852cb",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_abe0ef2e-afa5-48e7-9044-d085a7d5e2e9__DX06_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX06",
          "target": "VARIABLE_abe0ef2e-afa5-48e7-9044-d085a7d5e2e9",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_16ebf2d7-31cb-48d5-9f71-c517c76c744e__DX07_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX07",
          "target": "VARIABLE_16ebf2d7-31cb-48d5-9f71-c517c76c744e",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_fa0a8c18-c9cd-437f-bc1d-2ba8e5ded397__DX08_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "DX08",
          "target": "VARIABLE_fa0a8c18-c9cd-437f-bc1d-2ba8e5ded397",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_5b72ccb2-f9bd-472b-9302-8958bede4324__AX01_Scaled_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "AX01_Scaled",
          "target": "VARIABLE_5b72ccb2-f9bd-472b-9302-8958bede4324",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_98e84e17-7ed8-4d75-a277-994636451583__AX02_Scaled_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "AX02_Scaled",
          "target": "VARIABLE_98e84e17-7ed8-4d75-a277-994636451583",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_9463a696-60a8-4ec1-8e58-9c35ac5f38b0__AX03_Scaled_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "AX03_Scaled",
          "target": "VARIABLE_9463a696-60a8-4ec1-8e58-9c35ac5f38b0",
          "targetHandle": "input"
        },
        {
          "id": "e_BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2_VARIABLE_7280903b-7564-4ead-899f-243b17063935__AX04_Scaled_input",
          "source": "BLOCK_be1d792d-f327-45c2-b831-7f3af95cf3e2",
          "sourceHandle": "AX04_Scaled",
          "target": "VARIABLE_7280903b-7564-4ead-899f-243b17063935",
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
          "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
            "numericId": "5729214",
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
          "id": "VARIABLE_0f41cf0f-5682-4c4f-b4f5-cb2772a8d082",
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
            "numericId": "10294149",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_9b3b9f47-cc68-4663-8216-7d0b643a93d0",
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
            "numericId": "4877746",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_c7928512-f5a0-4959-9b12-07ee2ac0e399",
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
            "numericId": "4635700",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_d5136b8e-6517-4ac5-a361-ce6e3f35f105",
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
            "numericId": "9137365",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_5ef3a946-6bdc-42d9-9bfc-5ca621bd3c95",
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
            "numericId": "8406040",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_de569a12-d6d3-4ef8-89f6-543db0730513",
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
            "numericId": "10092747",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_f82f4544-5cbb-4905-841b-1c027bd04566",
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
            "numericId": "9279239",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_e2420d9b-1aa0-47b6-a89b-8b46d7dfa659",
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
            "numericId": "613389",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_c354b205-a56d-42f0-bb27-8dc0cdde306f",
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
            "numericId": "933481",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "VARIABLE_469aa6bc-033c-4019-b4f0-f4263a14a457",
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
            "numericId": "8067991",
            "variable": {
              "name": ""
            },
            "executionOrder": 0,
            "variant": "input",
            "block": {
              "id": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
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
          "id": "e_left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__left-rail_EN",
          "source": "left-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "sourceHandle": "left-rail",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "EN"
        },
        {
          "id": "e_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee_right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54__ENO_right-rail",
          "source": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "sourceHandle": "ENO",
          "target": "right-rail-rung_main_8ca36f69-1945-4a1e-8d4c-61d07b465f54",
          "targetHandle": "right-rail"
        },
        {
          "id": "e_VARIABLE_0f41cf0f-5682-4c4f-b4f5-cb2772a8d082_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY01",
          "source": "VARIABLE_0f41cf0f-5682-4c4f-b4f5-cb2772a8d082",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY01"
        },
        {
          "id": "e_VARIABLE_9b3b9f47-cc68-4663-8216-7d0b643a93d0_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY02",
          "source": "VARIABLE_9b3b9f47-cc68-4663-8216-7d0b643a93d0",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY02"
        },
        {
          "id": "e_VARIABLE_c7928512-f5a0-4959-9b12-07ee2ac0e399_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY03",
          "source": "VARIABLE_c7928512-f5a0-4959-9b12-07ee2ac0e399",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY03"
        },
        {
          "id": "e_VARIABLE_d5136b8e-6517-4ac5-a361-ce6e3f35f105_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY04",
          "source": "VARIABLE_d5136b8e-6517-4ac5-a361-ce6e3f35f105",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY04"
        },
        {
          "id": "e_VARIABLE_5ef3a946-6bdc-42d9-9bfc-5ca621bd3c95_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY05",
          "source": "VARIABLE_5ef3a946-6bdc-42d9-9bfc-5ca621bd3c95",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY05"
        },
        {
          "id": "e_VARIABLE_de569a12-d6d3-4ef8-89f6-543db0730513_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY06",
          "source": "VARIABLE_de569a12-d6d3-4ef8-89f6-543db0730513",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY06"
        },
        {
          "id": "e_VARIABLE_f82f4544-5cbb-4905-841b-1c027bd04566_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY07",
          "source": "VARIABLE_f82f4544-5cbb-4905-841b-1c027bd04566",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY07"
        },
        {
          "id": "e_VARIABLE_e2420d9b-1aa0-47b6-a89b-8b46d7dfa659_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_DY08",
          "source": "VARIABLE_e2420d9b-1aa0-47b6-a89b-8b46d7dfa659",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "DY08"
        },
        {
          "id": "e_VARIABLE_c354b205-a56d-42f0-bb27-8dc0cdde306f_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_AY01_Scaled",
          "source": "VARIABLE_c354b205-a56d-42f0-bb27-8dc0cdde306f",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "AY01_Scaled"
        },
        {
          "id": "e_VARIABLE_469aa6bc-033c-4019-b4f0-f4263a14a457_BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee__output_AY02_Scaled",
          "source": "VARIABLE_469aa6bc-033c-4019-b4f0-f4263a14a457",
          "sourceHandle": "output",
          "target": "BLOCK_4849e193-0b03-4f21-b5b0-6176cb500dee",
          "targetHandle": "AY02_Scaled"
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
        300,
        120
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
          "id": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "type": "powerRail",
          "position": {
            "x": 297,
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
                "x": 297
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8_right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8__left-rail_right-rail",
          "source": "left-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "sourceHandle": "left-rail",
          "target": "right-rail-rung_main_ed072c9b-b9f3-4f71-a2eb-3e43740fd3b8",
          "targetHandle": "right-rail"
        }
      ]
    },
    {
      "id": "rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
      "comment": "",
      "defaultBounds": [
        300,
        100
      ],
      "reactFlowViewport": [
        300,
        120
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
          "id": "right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "type": "powerRail",
          "position": {
            "x": 297,
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
                "x": 297
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
        }
      ],
      "edges": [
        {
          "id": "e_left-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79_right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79__left-rail_right-rail",
          "source": "left-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "sourceHandle": "left-rail",
          "target": "right-rail-rung_main_ff6c7b9c-3d41-48df-8219-710f334c6e79",
          "targetHandle": "right-rail"
        }
      ]
    }
  ]
}
END_PROGRAM