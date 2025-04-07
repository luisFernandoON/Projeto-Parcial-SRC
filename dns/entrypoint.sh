#!/bin/bash

# Inicia o serviço do Bind9 em foreground pra facilitar o debug
exec named -g -u bind
