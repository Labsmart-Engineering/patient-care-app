#!/bin/bash

for i in {1..100}
do
  echo "Load complex haml component..."
  curl https://patient-care-7f88cdf8910d.herokuapp.com/performance_test/complex_haml_component
  sleep 0.25

  echo "Load complex erb component..."
  curl https://patient-care-7f88cdf8910d.herokuapp.com/performance_test/complex_erb_component
  sleep 0.25

  echo "Load complex haml view..."
  curl https://patient-care-7f88cdf8910d.herokuapp.com/performance_test/complex_haml_view
  sleep 0.25

  echo "Load complex haml view..."
  curl https://patient-care-7f88cdf8910d.herokuapp.com/performance_test/complex_erb_view
  sleep 0.25
done
