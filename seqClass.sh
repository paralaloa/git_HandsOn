#!/bin/bash
seq=$1
seq=$(echo $seq | tr a-z A-Z) ##With this all letters will be capitals
if [[ $seq =~ ^[ACGTU]+$ ]]; then
  if [[ $seq =~ T ]]; then #If the input includes a T can be DNA
    if [[ $seq =~ U ]]; then #If the input includes also a U it's a mistake
       echo "The sequence includes T and U, is it correct? Impossible to determine if it is DNA or RNA"
    else
       echo "The sequence is DNA" ##If not it's DNA
    fi
  elif [[ $seq =~ U ]]; then #If insted of T we find U it's RNA
     echo "The sequence is RNA"
  else # If the sequence has ACG but not T of U we don't know if it is DNA or RNA
     echo "The sequence don't have T or U so we can't know it it is DNA or RNA"
  fi
else #If the sequence are not nucleotides
  echo "The sequence is not RNA nor DNA"
fi
