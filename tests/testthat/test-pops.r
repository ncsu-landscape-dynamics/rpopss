context("test-pops")

test_that("Model stops if files don't exist or aren't the correct extension", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  expect_equal(pops(infected_file = "",
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(
    infected_file =  system.file("extdata", "simple2x2", "infected.csv",
                                 package = "PoPS"),
    host_file =  host_file,
    total_populations_file =  host_file,
    parameter_means = parameter_means,
    parameter_cov_matrix = parameter_cov_matrix),
    "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file = "",
                    total_populations_file =  host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    total_populations_file =  host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file = "",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file = "",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    temp = TRUE,
                    temperature_coefficient_file = "",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    precip = TRUE,
                    precipitation_coefficient_file = "",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    management = TRUE,
                    treatments_file = "",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file does not exist")
  expect_equal(pops(infected_file =  infected_file,
                    host_file =  host_file,
                    total_populations_file =  host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2", "infected.csv",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "file is not one of '.grd', '.tif', '.img', or '.vrt'")

})

test_that("Model stops if time and date parameters are of the wrong type and/or
          dimension", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  time_format_error <-
    "End time and/or start time not of type numeric and/or in format YYYY-MM-DD"


  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    time_step = "two",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               "Time step must be one of 'week', 'month' or 'day'")
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    end_date = "two",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               time_format_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    end_date = 156,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               time_format_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    start_date = "five",
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               time_format_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    start_date = 19,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               time_format_error)

})

test_that("Model stops if kernel is of the wrong type and/or dimension", {
            infected_file <-
              system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
            host_file <-
              system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
            coefficient_file <-
              system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                          package = "PoPS")
            temperature_file <-
              system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                          package = "PoPS")
            start_date <- "2008-01-01"
            end_date <- "2010-12-31"
            parameter_means <- c(0, 21, 1, 500, 0, 0)
            parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

            expect_equal(
              pops(infected_file = infected_file,
                   host_file = host_file,
                   total_populations_file = host_file,
                   parameter_means = parameter_means,
                   natural_kernel_type = "none",
                   parameter_cov_matrix = parameter_cov_matrix),
              "Natural kernel type not one of 'cauchy', 'exponential',
      'uniform','deterministic neighbor','power law', 'hyperbolic secant',
      'gamma', 'weibull', 'logistic'")
            expect_equal(
              pops(infected_file = infected_file,
                   host_file = host_file,
                   total_populations_file = host_file,
                   parameter_means = parameter_means,
                   anthropogenic_kernel_type = "none",
                   parameter_cov_matrix = parameter_cov_matrix),
              "Anthropogenic kernel type not one of 'cauchy', 'exponential',
      'uniform','deterministic neighbor','power law', 'hyperbolic secant',
      'gamma', 'weibull', 'logistic'")
          })

test_that("Input raster resolutions, extents, and crs all match", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  extent_error <-
    "Extents of input rasters do not match. Ensure that all of your input
    rasters have the same extent"
  resolution_error <-
    "Resolution of input rasters do not match. Ensure that all of your input
    rasters have the same resolution"
  crs_error <-
    "Coordinate reference system (crs) of input rasters do not match. Ensure
    that all of your input rasters have the same crs"

  expect_equal(pops(infected_file = infected_file,
                    host_file =
                      system.file("extdata", "simple5x5", "total_plants.tif",
                                  package = "PoPS"),
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file =
                      system.file("extdata", "simple5x5", "total_plants.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file =
                      system.file("extdata", "simple5x5", "total_plants.tif",
                                  package = "PoPS"),
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_extent.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_extent.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_extent.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2", "critical_temp.tif",
                                  package = "PoPS"),
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_extent.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_extent.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               extent_error)

  expect_equal(pops(infected_file = infected_file,
                    host_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_res.tif",
                                  package = "PoPS"),
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_xres.tif",
                                  package = "PoPS"),
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_yres.tif",
                                  package = "PoPS"),
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_res.tif",
                                  package = "PoPS"),
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_xres.tif",
                                  package = "PoPS"),
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file =
                      system.file("extdata", "simple2x2",
                                  "total_plants_diff_yres.tif",
                                  package = "PoPS"),
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp  = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    precip  = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2", "critical_temp.tif",
                                  package = "PoPS"),
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp.tif", package = "PoPS"),
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp.tif", package = "PoPS"),
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_res.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_xres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_yres.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               resolution_error)

  expect_equal(pops(infected_file = infected_file,
                    host_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    temp = TRUE,
                    temperature_coefficient_file =
                      system.file("extdata", "simple2x2", "critical_temp.tif",
                                  package = "PoPS"),
                    precip = TRUE,
                    precipitation_coefficient_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    management = TRUE,
                    treatments_file =
                      system.file("extdata", "simple2x2",
                                  "critical_temp_diff_crs.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix),
               crs_error)

})

test_that(
"Infected results return initial infected if reproductive rate isset to 0", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif",
                package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    lethal_temperature = -16,
                    lethal_temperature_month = 1,
                    temperature_file =
                      system.file("extdata", "simple2x2", "critical_temp.tif",
                                  package = "PoPS"),
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix,
                    temp = TRUE,
                    temperature_coefficient_file =
                      coefficient_file)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      coefficient_file)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix,
                    temp = TRUE,
                    temperature_coefficient_file = coefficient_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      coefficient_file)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix,
                    use_lethal_temperature = TRUE,
                    lethal_temperature = -16,
                    lethal_temperature_month = 1,
                    temperature_file =
                      system.file("extdata", "simple2x2", "critical_temp.tif",
                                  package = "PoPS"),
                    temp = TRUE,
                    temperature_coefficient_file = coefficient_file,
                    precip = TRUE,
                    precipitation_coefficient_file =
                      coefficient_file)$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))

  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         temp = TRUE,
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         time_step = "week")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         time_step = "week")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         temp = TRUE,
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         time_step = "week")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         use_lethal_temperature = TRUE,
         lethal_temperature = -16,
         lethal_temperature_month = 1,
         temperature_file =
           system.file("extdata", "simple2x2", "critical_temp.tif",
                       package = "PoPS"),
         temp = TRUE,
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_weeks.tif", package = "PoPS"),
         time_step = "week")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))

  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         temp = TRUE,
         time_step = "day",
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif",
                       package = "PoPS"))$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif",
                       package = "PoPS"),
         time_step = "day")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         temp = TRUE,
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif", package = "PoPS"),
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif", package = "PoPS"),
         time_step = "day")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         use_lethal_temperature = TRUE,
         lethal_temperature = -16,
         lethal_temperature_month = 1,
         temperature_file =
           system.file("extdata", "simple2x2", "critical_temp.tif",
                       package = "PoPS"),
         temp = TRUE,
         temperature_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif", package = "PoPS"),
         precip = TRUE,
         precipitation_coefficient_file =
           system.file("extdata", "simple2x2",
                       "temperature_coefficient_days.tif", package = "PoPS"),
         time_step = "day")$infected[[1]],
    terra::as.matrix(terra::rast(infected_file), wide = TRUE))

})

test_that(
  "Infected results returns all 0's if minimum temp drops below lethal
  temperature", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(1, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file = temperature_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               matrix(0, ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file = temperature_file,
                    precip = TRUE,
                    precipitation_coefficient_file = coefficient_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               matrix(0, ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file = temperature_file,
                    temp = TRUE,
                    temperature_coefficient_file = coefficient_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               matrix(0, ncol = 2, nrow = 2))
  expect_equal(pops(infected_file = infected_file,
                    host_file = host_file,
                    total_populations_file = host_file,
                    use_lethal_temperature = TRUE,
                    temperature_file = temperature_file,
                    temp = TRUE,
                    temperature_coefficient_file = coefficient_file,
                    precip = TRUE,
                    precipitation_coefficient_file = coefficient_file,
                    parameter_means = parameter_means,
                    parameter_cov_matrix = parameter_cov_matrix)$infected[[1]],
               matrix(0, ncol = 2, nrow = 2))

  })

test_that(
  "Infected and Susceptible results return all 0's if treatments file is all
  1's but leaves a proportion of susceptibles if treatment method is ratio", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  treatments_file <-
    system.file("extdata", "simple2x2", "treatments.tif", package = "PoPS")
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         management  = TRUE,
         treatment_dates = c("2008-12-01"),
         treatments_file = treatments_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)

  expect_equal(data$infected[[1]], matrix(0, ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(0, ncol = 2, nrow = 2))

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         treatment_method = "all infected",
         total_populations_file = host_file,
         management  = TRUE,
         treatment_dates = c("2008-12-01"),
         treatments_file = treatments_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)

  expect_equal(data$infected[[1]], matrix(0, ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(0, ncol = 2, nrow = 2))

  treatments_file <-
    system.file("extdata", "simple2x2", "treatmentshalf.tif", package = "PoPS")

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         treatment_method = "ratio",
         total_populations_file = host_file,
         management  = TRUE,
         treatment_dates = c("2008-12-01"),
         treatments_file = treatments_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)

  expect_equal(data$infected[[1]], matrix(c(2, 0, 0, 0), ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(c(5, 3, 7, 7), ncol = 2, nrow = 2))

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         treatment_method = "all infected",
         total_populations_file = host_file,
         management  = TRUE,
         treatment_dates = c("2008-12-01"),
         treatments_file = treatments_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)

  expect_equal(data$infected[[1]], matrix(c(0, 0, 0, 0), ncol = 2, nrow = 2))
  expect_equal(data$susceptible[[1]], matrix(c(5, 3, 7, 7), ncol = 2, nrow = 2))

})

test_that("Infected results are greater than initial infected", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(1, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  expect_equal(all(pops(infected_file = infected_file,
                        host_file = host_file,
                        total_populations_file = host_file,
                        parameter_means = parameter_means,
                        parameter_cov_matrix = parameter_cov_matrix
                        )$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_equal(all(
    pops(infected_file = infected_file,
         host_file =
           system.file("extdata", "simple2x2",
                       "total_plants_host_greater_than_infected.tif",
                       package = "PoPS"),
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix)$infected[[1]] >=
      terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
    TRUE)

})


test_that("All kernel types lead to spread", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2008-12-31"
  time_step <- "month"
  parameter_means <- c(0.4, 30, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               time_step = time_step,
               natural_kernel_type = "exponential")

  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "cauchy")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
      terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
    TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "uniform")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "hyperbolic secant")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "weibull")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "logistic")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "gamma")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  parameter_means <- c(0.4, 2, 1, 500, 0, 0)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               natural_kernel_type = "power law")
  infecteds <- data$infected[[1]]
  expect_equal(all(infecteds >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)
  expect_gte(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  ## currently not working
  # doesn't disperse outside of originally infected cell
  # parameter_means <- c(0.4, 1000, 1, 500, 0, 0)
  # parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  # data <- pops(infected_file = infected_file,
  #              host_file = host_file,
  #              total_populations_file = host_file,
  #              parameter_means = parameter_means,
  #              parameter_cov_matrix = parameter_cov_matrix,
  #              natural_kernel_type = "exponential-power")
  # infecteds <- data$infected[[1]]
  # expect_equal(all(infecteds >=
  #                    terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
  #              TRUE)
  # expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)
  #
  # # bad array when icdf is available
  # data <- pops(infected_file = infected_file,
  #              host_file = host_file,
  #              total_populations_file = host_file,
  #              parameter_means = parameter_means,
  #              parameter_cov_matrix = parameter_cov_matrix,
  #              natural_kernel_type = "log normal")
  # infecteds <- data$infected[[1]]
  # expect_equal(all(infecteds >=
  #                    terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
  #              TRUE)
  # expect_gt(infecteds[1,2] + infecteds[2,1] + infecteds[2,2], 0)

  # checks for anthropogenic kernel type
  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "exponential")

  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "cauchy")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "uniform")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "hyperbolic secant")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "logistic")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "weibull")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "power law")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               anthropogenic_kernel_type = "gamma")
  expect_equal(all(data$infected[[1]] >=
                     terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
               TRUE)

#
#   data <- pops(infected_file = infected_file,
#                host_file = host_file,
#                total_populations_file = host_file,
#                parameter_means = parameter_means,
#                parameter_cov_matrix = parameter_cov_matrix,
#                anthropogenic_kernel_type = "exponential-power")
#   expect_equal(all(data$infected[[1]] >=
#                      terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
#                TRUE)

  ## currently not working
  #
  #
  # data <- pops(infected_file = infected_file,
  #              host_file = host_file,
  #              total_populations_file = host_file,
  #              parameter_means = parameter_means,
  #              parameter_cov_matrix = parameter_cov_matrix,
  #              anthropogenic_kernel_type = "log normal")
  # expect_equal(all(data$infected[[1]] >=
  #                    terra::as.matrix(terra::rast(infected_file), wide = TRUE)),
  #              TRUE)

})

test_that("Susceptibles are never negative", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0.4, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <- pops(infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               random_seed = 42,
               start_date = start_date,
               end_date = end_date)

  expect_equal(all(data$susceptible[[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data$susceptible[[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data$susceptible[[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)

  parameter_means <- c(0.5, 21, 1, 500, 0, 0)
  data <-
    pops(infected_file = infected_file,
         host_file =
           system.file("extdata", "simple2x2",
                       "total_plants_host_greater_than_infected.tif",
                       package = "PoPS"),
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)

  expect_equal(all(data$susceptible[[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data$susceptible[[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data$susceptible[[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)

})

test_that("SEI model works as intended", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2008-12-31"
  model_type <- "SI"
  latency_period <- 2
  time_step <- "month"
  output_frequency <- "month"
  treatment_dates <- "2008-02-25"
  parameter_means <- c(0.4, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date,
         model_type = model_type,
         latency_period = latency_period,
         output_frequency = output_frequency,
         time_step = time_step,
         treatment_dates = treatment_dates)
  model_type <- "SEI"
  data2 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date,
         model_type = model_type,
         latency_period = latency_period,
         output_frequency = output_frequency,
         time_step = time_step,
         treatment_dates = treatment_dates)

  expect_equal(all(data2$exposed[[1]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[1]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[1]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[2]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[2]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[2]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[3]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[3]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[3]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[4]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[4]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[4]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[5]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[5]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[5]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[6]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[6]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[6]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[7]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[7]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[7]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[8]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[8]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[8]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[9]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[9]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[9]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[10]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[10]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[10]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[11]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[11]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[11]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[12]][[1]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[12]][[2]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)
  expect_equal(all(data2$exposed[[12]][[3]] >= matrix(0, ncol = 2, nrow = 2)),
               TRUE)

  expect_equal(all(data$susceptible[[1]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data$susceptible[[2]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data$susceptible[[3]] <= data2$susceptible[[1]]), TRUE)

  expect_equal(all(data$infected[[1]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[2]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[3]] >= data2$infected[[1]]), TRUE)

  start_exposed <- TRUE
  exposed_file <- system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  model_type <- "SEI"
  data3 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date,
         model_type = model_type,
         latency_period = latency_period,
         output_frequency = output_frequency,
         time_step = time_step,
         treatment_dates = treatment_dates,
         start_exposed = start_exposed,
         exposed_file = exposed_file)

  expect_equal(all(data3$susceptible[[1]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data3$susceptible[[2]] <= data2$susceptible[[1]]), TRUE)
  expect_equal(all(data3$susceptible[[3]] <= data2$susceptible[[1]]), TRUE)

  expect_equal(all(data3$infected[[1]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data3$infected[[2]] >= data2$infected[[1]]), TRUE)
  expect_equal(all(data3$infected[[3]] >= data2$infected[[1]]), TRUE)

})

test_that("Infected results with weather are less than those without weather", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0.4, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  data_temp <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         temp = TRUE,
         temperature_coefficient_file = coefficient_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  data_precip <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         precip = TRUE,
         precipitation_coefficient_file = coefficient_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  data_weather <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         temp = TRUE,
         temperature_coefficient_file = coefficient_file,
         precip = TRUE, precipitation_coefficient_file = coefficient_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)

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

test_that(
  "Infected results are greater with same parameters for
  weekly spread vs. monthly", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
  system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
              package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0.2, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data_week <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "week",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  data_month <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)

  expect_equal(all(data_week$infected[[1]] >= data_month$infected[[1]]), TRUE)
  expect_equal(all(data_week$infected[[2]] >= data_month$infected[[2]]), TRUE)

})

test_that(
  "Infected results are greater with same parameters for daily spread vs.
  monthly and weekly", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0.1, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data_day <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "day",
         random_seed = 42)
  data_week <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "week",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  data_month <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)

  expect_equal(all(data_day$infected[[1]] >= data_month$infected[[1]]), TRUE)
  expect_equal(all(data_day$infected[[1]] >= data_week$infected[[1]]), TRUE)
  expect_equal(all(data_week$infected[[1]] >= data_month$infected[[1]]), TRUE)
})

test_that(
  "Infected results are greater without treatment than with treatment", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  treatments_file <-
    system.file("extdata", "simple2x2", "treatments_1_1.tif", package = "PoPS")
  treatment_dates <- c("2008-03-05")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(0.8, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 44,
         start_date = start_date,
         end_date = end_date)
  data_treat <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         management = TRUE,
         treatment_dates = treatment_dates,
         treatments_file = treatments_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         random_seed = 44,
         start_date = start_date,
         end_date = end_date)

  expect_equal(all(data$infected[[1]] >= data_treat$infected[[1]]), TRUE)
  expect_equal(all(data$infected[[2]] >= data_treat$infected[[2]]), TRUE)
})

test_that("Infected results are greater with higher reproductive rate", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  start_date <- "2008-01-01"
  end_date <- "2010-12-31"
  parameter_means <- c(1.0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data_1 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  parameter_means <- c(0.75, 21, 1, 500, 0, 0)
  data_075 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  parameter_means <- c(0.5, 21, 1, 500, 0, 0)
  data_050 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  parameter_means <- c(0.25, 21, 1, 500, 0, 0)
  data_025 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)
  parameter_means <- c(0.1, 21, 1, 500, 0, 0)
  data_010 <-
    pops(infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         time_step = "month",
         random_seed = 42,
         start_date = start_date,
         end_date = end_date)

  expect_gte(sum(data_1$infected[[1]]), sum(data_075$infected[[1]]))
  expect_gte(sum(data_1$infected[[1]]), sum(data_050$infected[[1]]))
  expect_gte(sum(data_1$infected[[1]]), sum(data_025$infected[[1]]))
  expect_gte(sum(data_1$infected[[1]]), sum(data_010$infected[[1]]))

  expect_gte(sum(data_075$infected[[1]]), sum(data_050$infected[[1]]))
  expect_gte(sum(data_075$infected[[1]]), sum(data_025$infected[[1]]))
  expect_gte(sum(data_075$infected[[1]]), sum(data_010$infected[[1]]))

  expect_gte(sum(data_050$infected[[1]]), sum(data_025$infected[[1]]))
  expect_gte(sum(data_050$infected[[2]]), sum(data_025$infected[[2]]))
  expect_gte(sum(data_050$infected[[1]]), sum(data_010$infected[[1]]))
  expect_gte(sum(data_050$infected[[2]]), sum(data_010$infected[[2]]))

  expect_gte(sum(data_025$infected[[1]]), sum(data_010$infected[[1]]))
  expect_gte(sum(data_025$infected[[2]]), sum(data_010$infected[[2]]))

})

test_that("Treatments apply no matter what time step", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatments_file <-
    system.file("extdata", "simple2x2", "treatments.tif", package = "PoPS")
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  dates <- seq.Date(as.Date(start_date), as.Date(end_date), by = "days")
  for (i in seq_len(length(dates))) {
    data <-
      pops(infected_file = infected_file,
           host_file = host_file,
           total_populations_file = host_file,
           management  = TRUE,
           treatment_dates = c(as.character(dates[i])),
           treatments_file = treatments_file,
           parameter_means = parameter_means,
           parameter_cov_matrix = parameter_cov_matrix,
           start_date = start_date,
           end_date = end_date)
    expect_equal(data$infected[[1]], matrix(0, ncol = 2, nrow = 2))
    expect_equal(data$susceptible[[1]], matrix(0, ncol = 2, nrow = 2))
  }
})

test_that("Pesticide treatments apply no matter what time step", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  coefficient_file <-
    system.file("extdata", "simple2x2", "temperature_coefficient.tif",
                package = "PoPS")
  temperature_file <-
    system.file("extdata", "simple2x2", "critical_temp_all_below_threshold.tif",
                package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatments_file <-
    system.file("extdata", "simple2x2", "treatments.tif", package = "PoPS")
  pesticide_duration <- c(120)
  pesticide_efficacy <- 1.0
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  dates <- seq.Date(as.Date(start_date), as.Date("2009-06-30"), by = "days")

  for (i in seq_len(length(dates))) {
    data <-
      pops(infected_file = infected_file,
           host_file = host_file,
           total_populations_file = host_file,
           management  = TRUE,
           treatment_dates = c(as.character(dates[i])),
           treatments_file = treatments_file,
           parameter_means = parameter_means,
           parameter_cov_matrix = parameter_cov_matrix,
           start_date = start_date,
           end_date = end_date,
           pesticide_duration = pesticide_duration,
           pesticide_efficacy = pesticide_efficacy)
    expect_equal(data$infected[[1]], matrix(0, ncol = 2, nrow = 2))
    expect_equal(data$susceptible[[1]],
                 terra::as.matrix(terra::rast(host_file), wide = TRUE))
  }

  pesticide_duration <- c(120)
  pesticide_efficacy <- 0.5

  for (i in seq_len(length(dates))) {
    data <-
      pops(infected_file = infected_file,
           host_file = host_file,
           total_populations_file = host_file,
           management  = TRUE,
           treatment_dates = c(as.character(dates[i])),
           treatments_file = treatments_file,
           parameter_means = parameter_means,
           parameter_cov_matrix = parameter_cov_matrix,
           start_date = start_date,
           end_date = end_date,
           pesticide_duration = pesticide_duration,
           pesticide_efficacy = pesticide_efficacy)
    expect_equal(data$infected[[1]], matrix(c(3, 0, 0, 0), ncol = 2, nrow = 2))
    expect_equal(data$susceptible[[1]],
                 matrix(c(12, 6, 14, 15), ncol = 2, nrow = 2))
  }

})

test_that(
  "Changing the output frequency returns the correct number of outputs and
  output statistics", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatment_dates <- c(start_date)
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  output_frequency_error <-
    "Output frequency is more frequent than time_step. The minimum
      output_frequency you can use is the time_step of your simulation. You can
      set the output_frequency to 'time_step' to default to most frequent
      output possible"

  data <-
    pops(output_frequency = "year",
         time_step = "month",
         treatment_dates = treatment_dates,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <-
    pops(output_frequency = "year",
         time_step = "week",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <-
    pops(output_frequency = "year",
         time_step = "day",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <-
    pops(output_frequency = "month",
         time_step = "week",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 12)

  data <-
    pops(output_frequency = "month",
         time_step = "day",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 12)

  data <-
    pops(output_frequency = "week",
         time_step = "week",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 52)

  data <-
    pops(output_frequency = "week",
         time_step = "day",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 52)

  data <-
    pops(output_frequency = "day",
         time_step = "week",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(data, output_frequency_error)

  data <-
    pops(output_frequency = "day",
         time_step = "month",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(data, output_frequency_error)

  data <- pops(output_frequency = "week",
               time_step = "month",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(data, output_frequency_error)

  data <- pops(output_frequency = "day",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 364)

  data <- pops(output_frequency = "time_step",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 364)

  data <- pops(output_frequency = "every_n_steps",
               output_frequency_n = 5,
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 72)
})

test_that(
  "Outputs occur with non-full year date range for all time step output
  frequency combinations", {
  infected_file <-
    system.file("extdata", "simple2x2", "infected.tif", package = "PoPS")
  host_file <-
    system.file("extdata", "simple2x2", "total_plants.tif", package = "PoPS")
  start_date <- "2009-05-01"
  end_date <- "2009-10-29"
  treatment_dates <- start_date
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <- pops(output_frequency = "year",
               time_step = "month",
               treatment_dates = treatment_dates,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <- pops(output_frequency = "year",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <- pops(output_frequency = "year",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 1)

  data <- pops(output_frequency = "month",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 5)

  data <- pops(output_frequency = "month",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 5)

  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 26)

  data <- pops(output_frequency = "week",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date)
  expect_equal(length(data$infected), 26)

  data <-
    pops(output_frequency = "day"
         , time_step = "day",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 182)

  data <-
    pops(output_frequency = "time_step",
         time_step = "day",
         treatment_dates = start_date,
         infected_file = infected_file,
         host_file = host_file,
         total_populations_file = host_file,
         parameter_means = parameter_means,
         parameter_cov_matrix = parameter_cov_matrix,
         start_date = start_date,
         end_date = end_date)
  expect_equal(length(data$infected), 182)
})

test_that("Quarantine and spread rates work at all timings", {
  infected_file <-
    system.file("extdata", "simple20x20", "initial_infection.tif",
                package = "PoPS")
  host_file <-
    system.file("extdata", "simple20x20", "all_plants.tif", package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatment_dates <- start_date
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  quarantine_areas_file <-
    system.file("extdata", "simple20x20", "initial_infection.tif",
                package = "PoPS")

  data <- pops(output_frequency = "year",
               time_step = "month",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 1)
  expect_equal(length(data$quarantine_escape), 1)
  expect_equal(length(data$quarantine_escape_distance), 1)
  expect_equal(length(data$quarantine_escape_directions), 1)
  expect_equal(length(data$rates), 1)

  data <- pops(output_frequency = "year",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 1)
  expect_equal(length(data$quarantine_escape), 1)
  expect_equal(length(data$quarantine_escape_distance), 1)
  expect_equal(length(data$quarantine_escape_directions), 1)
  expect_equal(length(data$rates), 1)

  data <- pops(output_frequency = "year",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 1)
  expect_equal(length(data$quarantine_escape), 1)
  expect_equal(length(data$quarantine_escape_distance), 1)
  expect_equal(length(data$quarantine_escape_directions), 1)
  expect_equal(length(data$rates), 1)

  data <- pops(output_frequency = "month",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 12)
  expect_equal(length(data$quarantine_escape), 12)
  expect_equal(length(data$quarantine_escape_distance), 12)
  expect_equal(length(data$quarantine_escape_directions), 12)
  expect_equal(length(data$rates), 12)

  data <- pops(output_frequency = "month",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 12)
  expect_equal(length(data$quarantine_escape), 12)
  expect_equal(length(data$quarantine_escape_distance), 12)
  expect_equal(length(data$quarantine_escape_directions), 12)
  expect_equal(length(data$rates), 12)

  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 52)
  expect_equal(length(data$quarantine_escape), 52)
  expect_equal(length(data$quarantine_escape_distance), 52)
  expect_equal(length(data$quarantine_escape_directions), 52)
  expect_equal(length(data$rates), 52)

  data <- pops(output_frequency = "week",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 52)
  expect_equal(length(data$quarantine_escape), 52)
  expect_equal(length(data$quarantine_escape_distance), 52)
  expect_equal(length(data$quarantine_escape_directions), 52)
  expect_equal(length(data$rates), 52)

  data <- pops(output_frequency = "day",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date, use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 364)
  expect_equal(length(data$quarantine_escape), 364)
  expect_equal(length(data$quarantine_escape_distance), 364)
  expect_equal(length(data$quarantine_escape_directions), 364)
  expect_equal(length(data$rates), 364)

  data <- pops(output_frequency = "time_step",
               time_step = "day",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_quarantine = TRUE,
               use_spreadrates = TRUE,
               quarantine_areas_file = quarantine_areas_file)
  expect_equal(length(data$infected), 364)
  expect_equal(length(data$quarantine_escape), 364)
  expect_equal(length(data$quarantine_escape_distance), 364)
  expect_equal(length(data$quarantine_escape_directions), 364)
  expect_equal(length(data$rates), 364)
})


test_that("Mortality works as expected with multiple ", {
  infected_file <-
    system.file("extdata", "simple20x20", "initial_infection.tif",
                package = "PoPS")
  host_file <-
    system.file("extdata", "simple20x20", "all_plants.tif", package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatment_dates <- start_date
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)

  data <- pops(output_frequency = "month",
               time_step = "month",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               mortality_frequency = "month",
               mortality_frequency_n = 1,
               mortality_rate = 0.50,
               mortality_time_lag = 1,
               mortality_on = TRUE)

  expect_equal(length(data$mortality), 12)
  expect_equal(data$mortality[[1]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[2]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[3]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))

  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               mortality_frequency = "month",
               mortality_frequency_n = 1,
               mortality_rate = 0.50,
               mortality_time_lag = 1,
               mortality_on = TRUE)

  expect_equal(length(data$mortality), 12)
  expect_equal(data$mortality[[1]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[2]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[3]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))


  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               mortality_frequency = "month",
               mortality_frequency_n = 1,
               mortality_rate = 0.250,
               mortality_time_lag = 1,
               mortality_on = TRUE)

  expect_equal(length(data$mortality), 12)
  expect_equal(data$mortality[[1]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[2]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[3]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[4]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[5]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))


  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               mortality_frequency = "month",
               mortality_frequency_n = 1,
               mortality_rate = 0.250,
               mortality_time_lag = 3,
               mortality_on = TRUE)

  expect_equal(length(data$mortality), 12)
  expect_equal(data$mortality[[1]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[2]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[3]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[4]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[5]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[6]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[7]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))

  data <- pops(output_frequency = "week",
               time_step = "week",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               mortality_frequency = "month",
               mortality_frequency_n = 1,
               mortality_rate = 0.10,
               mortality_time_lag = 1,
               mortality_on = TRUE)

  expect_equal(length(data$mortality), 12)
  expect_equal(data$mortality[[1]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[2]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[3]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[4]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[5]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[6]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[7]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[8]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[9]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[10]], matrix(0, ncol = 20, nrow = 20))
  expect_equal(data$mortality[[11]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
})

test_that("Movements works as expected", {
  infected_file <-
    system.file("extdata", "simple20x20", "initial_infection.tif",
                package = "PoPS")
  host_file <-
    system.file("extdata", "simple20x20", "all_plants.tif", package = "PoPS")
  start_date <- "2009-01-01"
  end_date <- "2009-12-31"
  treatment_dates <- start_date
  parameter_means <- c(0, 21, 1, 500, 0, 0)
  parameter_cov_matrix <- matrix(0, nrow = 6, ncol = 6)
  use_movements <- TRUE
  movements_file <-
    system.file("extdata", "simple20x20", "movements.csv", package = "PoPS")

  data <- pops(output_frequency = "month",
               time_step = "month",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_movements = use_movements,
               movements_file = movements_file,
               random_seed = 42)

  expect_equal(length(data$infected), 12)
  expect_equal(data$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[2]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[3]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[4]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  infected_move <- matrix(0, ncol = 20, nrow = 20)
  infected_move[2,1] <- 1
  expect_equal(data$infected[[5]], infected_move)
  sus <- terra::rast(host_file) - terra::rast(infected_file)
  sus <- terra::as.matrix(sus, wide = TRUE)
  sus5 <- sus
  sus5[1,1] <- sus5[1,1] - 199
  sus5[2,1] <- sus5[2,1] + 199
  sus6 <- sus5
  sus6[1,2] <- sus6[1,2] - 50
  sus6[2,2] <- sus6[2,2] + 50
  expect_equal(data$susceptible[[1]], sus)
  expect_equal(data$susceptible[[2]], sus)
  expect_equal(data$susceptible[[3]], sus)
  expect_equal(data$susceptible[[4]], sus)
  expect_equal(data$susceptible[[5]], sus5)
  expect_equal(data$susceptible[[6]], sus6)

  data <- pops(output_frequency = "month",
               time_step = "month",
               treatment_dates = start_date,
               infected_file = infected_file,
               host_file = host_file,
               total_populations_file = host_file,
               parameter_means = parameter_means,
               parameter_cov_matrix = parameter_cov_matrix,
               start_date = start_date,
               end_date = end_date,
               use_movements = use_movements,
               movements_file = movements_file,
               random_seed = 45)

  expect_equal(length(data$infected), 12)
  expect_equal(data$infected[[1]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[2]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[3]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  expect_equal(data$infected[[4]],
               terra::as.matrix(terra::rast(infected_file), wide = TRUE))
  infected_move <- matrix(0, ncol = 20, nrow = 20)
  infected_move[2,1] <- 1
  expect_equal(data$infected[[5]], infected_move)
  sus <- terra::rast(host_file) - terra::rast(infected_file)
  sus <- terra::as.matrix(sus, wide = TRUE)
  sus5 <- sus
  sus5[1,1] <- sus5[1,1] - 199
  sus5[2,1] <- sus5[2,1] + 199
  sus6 <- sus5
  sus6[1,2] <- sus6[1,2] - 50
  sus6[2,2] <- sus6[2,2] + 50
  expect_equal(data$susceptible[[1]], sus)
  expect_equal(data$susceptible[[2]], sus)
  expect_equal(data$susceptible[[3]], sus)
  expect_equal(data$susceptible[[4]], sus)
  expect_equal(data$susceptible[[5]], sus5)
  expect_equal(data$susceptible[[6]], sus6)
})