context("test-pops")

test_that("Model stops if files don't exist or aren't the correct extension", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(pops(infected_file = "", host_file =  host_file, total_populations_file =  host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), host_file =  host_file, total_populations_file =  host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file = "", total_populations_file =  host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), total_populations_file =  host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file = "", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, use_lethal_temperature = TRUE, temperature_file = "", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, use_lethal_temperature = TRUE, temperature_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, temp = TRUE, temperature_coefficient_file = "", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, temp = TRUE, temperature_coefficient_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, precip = TRUE, precipitation_coefficient_file = "", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, precip = TRUE, precipitation_coefficient_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, management = TRUE, treatments_file = "", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file does not exist")
  expect_equal(pops(infected_file =  infected_file, host_file =  host_file, total_populations_file =  host_file, management = TRUE, treatments_file =  system.file("extdata", "simple2x2", "infected.csv", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "file is not one of '.grd', '.tif', '.img'")
  
})

test_that("Model stops if parameters are of the wrong type and/or dimension", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, time_step = "two", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Time step must be one of 'week', 'month' or 'day'")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, end_date = "two", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "End time and/or start time not of type numeric and/or in format YYYY-MM-DD")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, end_date = 156, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "End time and/or start time not of type numeric and/or in format YYYY-MM-DD")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, start_date = "five", parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "End time and/or start time not of type numeric and/or in format YYYY-MM-DD")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, start_date = 19, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "End time and/or start time not of type numeric and/or in format YYYY-MM-DD")

})

test_that("Input raster resolutions, extents, and crs all match", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(pops(infected_file = infected_file, host_file = system.file("extdata", "simple5x5", "total_plants.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = system.file("extdata", "simple5x5", "total_plants.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = system.file("extdata", "simple5x5", "total_plants.tif", package = "PoPS"), host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp_diff_extent.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_extent.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_extent.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_extent.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatments_file = system.file("extdata", "simple2x2", "critical_temp_diff_extent.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Extents of input rasters do not match. Ensure that all of your input rasters have the same extent")
  
  expect_equal(pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_diff_res.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_diff_xres.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_diff_yres.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = system.file("extdata", "simple2x2", "total_plants_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = system.file("extdata", "simple2x2", "total_plants_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = system.file("extdata", "simple2x2", "total_plants_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = system.file("extdata", "simple2x2", "total_plants_diff_res.tif", package = "PoPS"), host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = system.file("extdata", "simple2x2", "total_plants_diff_xres.tif", package = "PoPS"), host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = system.file("extdata", "simple2x2", "total_plants_diff_yres.tif", package = "PoPS"), host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp  = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip  = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatments_file = system.file("extdata", "simple2x2", "critical_temp_diff_res.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatments_file = system.file("extdata", "simple2x2", "critical_temp_diff_xres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatments_file = system.file("extdata", "simple2x2", "critical_temp_diff_yres.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Resolution of input rasters do not match. Ensure that all of your input rasters have the same resolution")
  
  expect_equal(pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_with_crs.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = system.file("extdata", "simple2x2", "total_plants_with_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = system.file("extdata", "simple2x2", "total_plants_with_crs.tif", package = "PoPS"), host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp_diff_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "critical_temp_diff_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatments_file = system.file("extdata", "simple2x2", "critical_temp_diff_crs.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix), "Coordinate reference system (crs) of input rasters do not match. Ensure that all of your input rasters have the same crs")
  
})

test_that("Infected results return initial infected if reproductive rate is set to 0", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = coefficient_file)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, precip = TRUE, precipitation_coefficient_file = coefficient_file)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = coefficient_file, precip = TRUE, precipitation_coefficient_file = coefficient_file)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), temp = TRUE, temperature_coefficient_file = coefficient_file, precip = TRUE, precipitation_coefficient_file = coefficient_file)$infected[[1]], raster::as.matrix(raster::raster(infected_file)))

  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), time_step = "week")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), time_step = "week")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), time_step = "week")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_weeks.tif", package = "PoPS"), time_step = "week")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  # 
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"))$infected[[1]], raster::as.matrix(raster::raster(infected_file, time_step = "day")))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"))$infected[[1]], raster::as.matrix(raster::raster(infected_file, time_step = "day")))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"), time_step = "day")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))
  # expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, use_lethal_temperature = TRUE, temperature_file = system.file("extdata", "simple2x2", "critical_temp.tif", package = "PoPS"), temp = TRUE, temperature_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"), precip = TRUE, precipitation_coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient_days.tif", package = "PoPS"), time_step = "day")$infected[[1]], raster::as.matrix(raster::raster(infected_file)))

})

test_that("Infected results returns all 0's if minimum temp drops below lethal temperature", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(1,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = temperature_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], matrix(0,ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = temperature_file, precip = TRUE, precipitation_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], matrix(0,ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = temperature_file, temp = TRUE, temperature_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], matrix(0,ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, use_lethal_temperature = TRUE, temperature_file = temperature_file, temp = TRUE, temperature_coefficient_file = coefficient_file, precip = TRUE, precipitation_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]], matrix(0,ncol = 2, nrow = 2))

  })

test_that("Infected and Susceptible results return all 0's if treatments file is all 1's but leaves a proportion of susceptibles if treatment method is ratio", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  treatments_file = system.file("extdata", "simple2x2", "treatments.tif", package = "PoPS")
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management  = TRUE, treatment_dates = c("2008-12-01"), treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  
  expect_equal(data$infected[[1]], matrix(0,ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(0,ncol = 2, nrow = 2))
  
  data <- pops(infected_file = infected_file, host_file = host_file, treatment_method = "all infected", total_populations_file = host_file, management  = TRUE, treatment_dates = c("2008-12-01"), treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  
  expect_equal(data$infected[[1]], matrix(0,ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(0,ncol = 2, nrow = 2))
  
  treatments_file = system.file("extdata", "simple2x2", "treatmentshalf.tif", package = "PoPS")
  
  data <- pops(infected_file = infected_file, host_file = host_file, treatment_method = "ratio", total_populations_file = host_file, management  = TRUE, treatment_dates = c("2008-12-01"), treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  
  expect_equal(data$infected[[1]], matrix(c(2,0,0,0), ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(c(5,3,7,7),ncol = 2, nrow = 2))
  
  data <- pops(infected_file = infected_file, host_file = host_file, treatment_method = "all infected", total_populations_file = host_file, management  = TRUE, treatment_dates = c("2008-12-01"), treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  
  expect_equal(data$infected[[1]], matrix(c(0,0,0,0), ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(c(5,3,7,7),ncol = 2, nrow = 2))
  
})

test_that("Infected results are greater than initial infected", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(1,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  expect_equal(all(pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]] >= raster::as.matrix(raster::raster(infected_file))), TRUE)
  expect_equal(all(pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_host_greater_than_infected.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix)$infected[[1]] >= raster::as.matrix(raster::raster(infected_file))), TRUE)

})

test_that("Susceptibles are never negative", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0.4,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_equal(all(data$susceptible[[1]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data$susceptible[[2]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data$susceptible[[3]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)

  parameter_means = c(0.5,21,1,500,0,0)
  data <- pops(infected_file = infected_file, host_file = system.file("extdata", "simple2x2", "total_plants_host_greater_than_infected.tif", package = "PoPS"), total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_equal(all(data$susceptible[[1]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data$susceptible[[2]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data$susceptible[[3]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)

})

test_that("SEI model works as intended", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2008-12-31"
  model_type <- "SI"
  latency_period <- 2
  time_step <- "month"
  output_frequency <- "month"
  treatment_dates <- "2008-02-25"
  parameter_means = c(0.4,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  
  data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date, model_type = model_type, latency_period = latency_period, output_frequency = output_frequency, time_step = time_step, treatment_dates = treatment_dates)
  model_type <- "SEI"
  data2 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date, model_type = model_type, latency_period = latency_period, output_frequency = output_frequency, time_step = time_step, treatment_dates = treatment_dates)
  
  expect_equal(all(data2$exposed[[1]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data2$exposed[[2]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  expect_equal(all(data2$exposed[[3]] >= matrix(0, ncol = 2, nrow = 2)), TRUE)
  
  expect_equal(all(data$susceptible[[1]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data$susceptible[[2]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data$susceptible[[3]] <= data2$susceptible[[1]]), TRUE)
  
  expect_equal(all(data$infected[[1]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[2]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[3]] >= data2$infected[[1]]), TRUE)
  
})

test_that("Infected results with weather are less than those without weather", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0.4,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  data_temp <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  data_precip <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, precip = TRUE, precipitation_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  data_weather <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, temp = TRUE, temperature_coefficient_file = coefficient_file, precip = TRUE, precipitation_coefficient_file = coefficient_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_gte(sum(data$infected[[1]]), sum(data_temp$infected[[1]]))
  expect_gte(sum(data$infected[[2]]), sum(data_temp$infected[[2]]))
  expect_gte(sum(data$infected[[3]]), sum(data_temp$infected[[3]]))

  expect_gte(sum(data$infected[[1]]), sum(data_precip$infected[[1]]))
  expect_gte(sum(data$infected[[2]]), sum(data_precip$infected[[2]]))
  expect_gte(sum(data$infected[[3]]), sum(data_precip$infected[[3]]))

  expect_gte(sum(data$infected[[1]]), sum(data_weather$infected[[1]]))
  expect_gte(sum(data$infected[[2]]), sum(data_weather$infected[[2]]))
  expect_gte(sum(data$infected[[3]]), sum(data_weather$infected[[3]]))

})

test_that("Infected results are greater with same parameters for weekly spread vs. monthly", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0.2,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data_week <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "week", random_seed = 42, start_date = start_date, end_date = end_date)
  data_month <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_equal(all(data_week$infected[[1]] >= data_month$infected[[1]]), TRUE)
  expect_equal(all(data_week$infected[[2]] >= data_month$infected[[2]]), TRUE)

})

test_that("Infected results are greater with same parameters for daily spread vs. monthly and weekly", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0.1,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data_day <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "day", random_seed = 42)
  data_week <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "week", random_seed = 42, start_date = start_date, end_date = end_date)
  data_month <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_equal(all(data_day$infected[[1]] >= data_month$infected[[1]]), TRUE)

  expect_equal(all(data_day$infected[[1]] >= data_week$infected[[1]]), TRUE)
})

test_that("Infected results are greater without treatment than with treatment",{
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  treatments_file = system.file("extdata", "simple2x2", "treatments_1_1.tif", package = "PoPS")
  treatment_dates = c("2008-03-05")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(0.8,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 44, start_date = start_date, end_date = end_date)
  data_treat <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management = TRUE, treatment_dates = treatment_dates, treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, random_seed = 44, start_date = start_date, end_date = end_date)
  
  expect_equal(all(data$infected[[1]] >= data_treat$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[2]] >= data_treat$infected[[2]]), TRUE)
})

test_that("Infected results are greater with higher reproductive rate", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  start_date = "2008-01-01"
  end_date = "2010-12-31"
  parameter_means = c(1.0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  
  data_1 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  parameter_means = c(0.75,21,1,500,0,0)
  data_075 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  parameter_means = c(0.5,21,1,500,0,0)
  data_050 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  parameter_means = c(0.25,21,1,500,0,0)
  data_025 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  parameter_means = c(0.1,21,1,500,0,0)
  data_010 <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, time_step = "month", random_seed = 42, start_date = start_date, end_date = end_date)
  
  expect_gte(sum(data_1$infected[[1]]), sum(data_075$infected[[1]]))

  expect_gte(sum(data_050$infected[[1]]), sum(data_025$infected[[1]]))
  expect_gte(sum(data_050$infected[[2]]), sum(data_025$infected[[2]]))

  expect_gte(sum(data_025$infected[[1]]), sum(data_010$infected[[1]]))
  expect_gte(sum(data_025$infected[[2]]), sum(data_010$infected[[2]]))

})

test_that("Treatments apply no matter what time step", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file = system.file("extdata", "simple2x2", "temperature_coefficient.tif", package = "PoPS")
  temperature_file = system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif", package = "PoPS")
  start_date = "2009-01-01"
  end_date = "2009-12-31"
  treatments_file = system.file("extdata", "simple2x2", "treatments.tif", package = "PoPS")
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)
  dates <- seq.Date(as.Date(start_date), as.Date(end_date), by = "days")
  for (i in 1:length(dates)) {
    data <- pops(infected_file = infected_file, host_file = host_file, total_populations_file = host_file, management  = TRUE, treatment_dates = c( as.character(dates[i])), treatments_file = treatments_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
    expect_equal(data$infected[[1]], matrix(0,ncol = 2, nrow = 2))
    expect_equal(data$susceptible[[1]], matrix(0,ncol = 2, nrow = 2))
  }
})

test_that("Changing the output frequency returns the correct number of outputs", {
  infected_file = system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file = system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  start_date = "2009-01-01"
  end_date = "2009-12-31"
  treatment_date = start_date
  parameter_means = c(0,21,1,500,0,0)
  parameter_cov_matrix = matrix(0, nrow = 6, ncol = 6)

  data <- pops(output_frequency = "year", time_step = "week", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <- pops(output_frequency = "month", time_step = "week", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(length(data$infected), 12)
  
  data <- pops(output_frequency = "week", time_step = "week", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(length(data$infected), 52)
  
  data <- pops(output_frequency = "day", time_step = "week", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(data, "Output frequency is more frequent than time_step. The minimum output_frequency you can use is the time_step of your simulation. You can set the output_frequency to 'time_step' to default to most frequent output possible")

  data <- pops(output_frequency = "day", time_step = "day", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(length(data$infected), 364)
  
  data <- pops(output_frequency = "time_step", time_step = "day", treatment_date = start_date, infected_file = infected_file, host_file = host_file, total_populations_file = host_file, parameter_means = parameter_means, parameter_cov_matrix = parameter_cov_matrix, start_date = start_date, end_date = end_date)
  expect_equal(length(data$infected), 364)
})
