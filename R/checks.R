# These functions are designed to improve data format checks and reduce copy
# and pasting of code across functions
Sys.setenv("R_TESTS" = "")

initial_raster_checks <- function(x, use_s3 = FALSE, bucket = "") {
  checks_passed <- TRUE

  if (use_s3) {
    if (!aws.s3::head_object(x, bucket)) {
      checks_passed <- FALSE
      failed_check <- "file does not exist"
    }
  } else {
    if (!all(file.exists(x))) {
      checks_passed <- FALSE
      failed_check <- "file does not exist"
    }
  }

  if (checks_passed && !all((tools::file_ext(x) %in%
    c("grd", "tif", "img", "vrt")))) {
    checks_passed <- FALSE
    failed_check <- "file is not one of '.grd', '.tif', '.img', or '.vrt'"
  }

  if (checks_passed) {
    if (use_s3) {
      aws.s3::save_object(object = x, bucket = bucket,
                          file = x, check_region = FALSE)
      r <- terra::rast(x)
    } else {
      r <- terra::rast(x)
    }
    r <- terra::classify(r, matrix(c(NA, 0), ncol = 2, byrow = TRUE),
      right = NA
    )
  }

  if (checks_passed) {
    outs <- list(checks_passed, r)
    names(outs) <- c("checks_passed", "raster")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

# adds checks to test for raster extent, resolution, and crs x2 being the
# raster already through initial checks for comparison
secondary_raster_checks <- function(x, x2, use_s3 = FALSE, bucket = "") {
  checks_passed <- TRUE

  if (use_s3) {
    if (!aws.s3::head_object(x, bucket)) {
      checks_passed <- FALSE
      failed_check <- "file does not exist"
    }
  } else {
    if (!all(file.exists(x))) {
      checks_passed <- FALSE
      failed_check <- "file does not exist"
    }
  }

  if (checks_passed && !all((tools::file_ext(x) %in%
    c("grd", "tif", "img", "vrt")))) {
    checks_passed <- FALSE
    failed_check <- "file is not one of '.grd', '.tif', '.img', or '.vrt'"
  }

  if (checks_passed) {
    if (use_s3) {
      aws.s3::save_object(object = x, bucket = bucket,
                          file = x, check_region = FALSE)
      r <- terra::rast(x)
    } else {
      r <- terra::rast(x)
    }
    r2 <- terra::classify(r, matrix(c(NA, 0), ncol = 2, byrow = TRUE),
      right = NA
    )
    if (!(terra::ext(r2) == terra::ext(r))) {
      terra::ext(r2) <- terra::ext(r)
    }
    r <- r2
  }

  if (checks_passed && !(terra::ext(x2) == terra::ext(r))) {
    checks_passed <- FALSE
    failed_check <-
      "Extents of input rasters do not match. Ensure that all of your input
    rasters have the same extent"
  }

  if (checks_passed && !(terra::xres(x2) == terra::xres(r) &&
    terra::yres(x2) == terra::yres(r))) {
    checks_passed <- FALSE
    failed_check <-
      "Resolution of input rasters do not match. Ensure that all of your input
    rasters have the same resolution"
  }

  if (checks_passed) {
    crs1 <- terra::crs(r, describe = TRUE)
    crs2 <- terra::crs(x2, describe = TRUE)
    if (is.na(crs1$EPSG)) {
      crs1$EPSG <- "1"
      }
    if (is.na(crs2$EPSG)) {
      crs2$EPSG <- "1"
      }
    if (!(crs1$EPSG == crs2$EPSG)) {
      checks_passed <- FALSE
      failed_check <-
        "Coordinate reference system (crs) of input rasters do not match. Ensure
    that all of your input rasters have the same crs"
    }
  }

  if (checks_passed) {
    outs <- list(checks_passed, r)
    names(outs) <- c("checks_passed", "raster")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

treatment_checks <- function(treatment_stack,
                             treatments_file,
                             pesticide_duration,
                             treatment_dates,
                             pesticide_efficacy) {
  checks_passed <- TRUE

  if (checks_passed && length(treatments_file) != length(treatment_dates)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for treatment dates and treatments_file must be equal"
  }

  if (checks_passed && length(pesticide_duration) != length(treatment_dates)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for treatment dates and pesticide_duration must be equal"
  }

  if (checks_passed) {
    if (pesticide_duration[1] > 0) {
      treatment_maps <-
        list(terra::as.matrix(treatment_stack[[1]] * pesticide_efficacy,
             wide = TRUE))
    } else {
      treatment_maps <- list(terra::as.matrix(treatment_stack[[1]],
                                              wide = TRUE))
    }

    if (terra::nlyr(treatment_stack) >= 2) {
      for (i in 2:terra::nlyr(treatment_stack)) {
        if (pesticide_duration[i] > 0) {
          treatment_maps[[i]] <-
            list(terra::as.matrix(treatment_stack[[i]] * pesticide_efficacy,
                                  wide = TRUE))
        } else {
          treatment_maps[[i]] <-
            list(terra::as.matrix(treatment_stack[[i]],
                                  wide = TRUE))
        }
      }
    }
  }

  if (checks_passed) {
    outs <- list(checks_passed, treatment_maps)
    names(outs) <- c("checks_passed", "treatment_maps")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

treatment_metric_checks <- function(treatment_method) {
  checks_passed <- TRUE

  if (!treatment_method %in% c("ratio", "all infected")) {
    checks_passed <- FALSE
    failed_check <-
      "treatment method is not one of the valid treatment options"
  }

  if (checks_passed) {
    outs <- list(checks_passed)
    names(outs) <- c("checks_passed")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

metric_checks <- function(success_metric) {
  checks_passed <- TRUE

  if (success_metric == "quantity") {
    configuration <- FALSE
  } else if (success_metric == "quantity and configuration") {
    configuration <- TRUE
  } else if (success_metric == "odds ratio") {
    configuration <- FALSE
  } else if (success_metric == "residual error") {
    configuration <- FALSE
  } else {
    checks_passed <- FALSE
    failed_check <-
      "Success metric must be one of 'quantity','quantity and configuration',
    'residual error', or 'odds ratio'"
  }

  if (checks_passed) {
    outs <- list(checks_passed, configuration)
    names(outs) <- c("checks_passed", "configuration")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

percent_checks <- function(percent_natural_dispersal) {
  checks_passed <- TRUE

  if (percent_natural_dispersal == 1.0) {
    use_anthropogenic_kernel <- FALSE
  } else if (percent_natural_dispersal < 1.0 &&
    percent_natural_dispersal >= 0.0) {
    use_anthropogenic_kernel <- TRUE
  } else {
    checks_passed <- FALSE
    failed_check <- "Percent natural dispersal must be between 0.0 and 1.0"
  }

  if (checks_passed) {
    outs <- list(checks_passed, use_anthropogenic_kernel)
    names(outs) <- c("checks_passed", "use_anthropogenic_kernel")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

time_checks <- function(end_date, start_date, time_step,
                        output_frequency, output_frequency_n) {
  checks_passed <- TRUE
  output_frequency_error <-
    "Output frequency is more frequent than time_step. The minimum
      output_frequency you can use is the time_step of your simulation. You can
      set the output_frequency to 'time_step' to default to most frequent
      output possible"

  if (checks_passed && !(time_step %in% list("week", "month", "day"))) {
    checks_passed <- FALSE
    failed_check <- "Time step must be one of 'week', 'month' or 'day'"
  }

  if (checks_passed && (!is(end_date, "character") ||
    !is(start_date, "character") ||
    !is(as.Date(end_date, format = "%Y-%m-%d"), "Date") ||
    !is(as.Date(start_date, format = "%Y-%m-%d"), "Date") ||
    is.na(as.Date(end_date, format = "%Y-%m-%d")) ||
    is.na(as.Date(start_date, format = "%Y-%m-%d")))) {
    checks_passed <- FALSE
    failed_check <-
    "End time and/or start time not of type numeric and/or in format YYYY-MM-DD"
  }

  if (checks_passed && !(output_frequency %in% list(
    "week", "month", "day", "year", "time_step", "every_n_steps"
  ))) {
    checks_passed <- FALSE
    failed_check <-
      "Output frequency must be either 'week', 'month', 'day', 'year', 'time_step', or 'every_n_steps'"
  }

  if (checks_passed && output_frequency == "day") {
    if (time_step == "week" || time_step == "month") {
      checks_passed <- FALSE
      failed_check <- output_frequency_error
    }
  }

  if (checks_passed && output_frequency == "week") {
    if (time_step == "month") {
      checks_passed <- FALSE
      failed_check <- output_frequency_error
    }
  }

  if (checks_passed) {
    duration <- lubridate::interval(start_date, end_date)

    if (time_step == "week") {
      number_of_time_steps <- ceiling(lubridate::time_length(duration, "week"))
    } else if (time_step == "month") {
      number_of_time_steps <- ceiling(lubridate::time_length(duration, "month"))
    } else if (time_step == "day") {
      number_of_time_steps <- ceiling(lubridate::time_length(duration, "day"))
    }

    number_of_years <- ceiling(lubridate::time_length(duration, "year"))

    if (output_frequency == "time_step") {
      output_frequency <- time_step
    }

    if (output_frequency == "week") {
      number_of_outputs <- ceiling(lubridate::time_length(duration, "week"))
    } else if (output_frequency == "month") {
      number_of_outputs <- ceiling(lubridate::time_length(duration, "month"))
    } else if (output_frequency == "day") {
      number_of_outputs <- ceiling(lubridate::time_length(duration, "day"))
    } else if (output_frequency == "year") {
      number_of_outputs <- ceiling(lubridate::time_length(duration, "year"))
    } else if (output_frequency == "time_step") {
      number_of_outputs <- number_of_time_steps
    } else if (output_frequency == "every_n_steps") {
      number_of_outputs <- number_of_time_steps / output_frequency_n
    }

    if (output_frequency == "year" && time_step == "day" &&
      number_of_time_steps < 365) {
      output_frequency <- "final_step"
    } else if (output_frequency == "year" && time_step == "week" &&
      number_of_time_steps < 52) {
      output_frequency <- "final_step"
    } else if (output_frequency == "year" && time_step == "month" &&
      number_of_time_steps < 12) {
      output_frequency <- "final_step"
    } else {
      output_frequency <- output_frequency
    }
  }

  if (checks_passed) {
    outs <- list(
      checks_passed, number_of_time_steps, number_of_years,
      number_of_outputs, output_frequency
    )
    names(outs) <- c(
      "checks_passed", "number_of_time_steps",
      "number_of_years", "number_of_outputs", "output_frequency"
    )
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

# check for making sure priors are in the proper format and output the mean
# where the mean serves as the starting point for the calibration
prior_checks <- function(priors) {
  checks_passed <- TRUE

  if (is(priors, "numeric") && length(priors) == 2) {
    priors <- matrix(priors, ncol = 2)
  }

  if ((is(priors, "data.frame") | is(priors, "matrix")) && ncol(priors) == 2) {
    if (is(priors, "matrix") && base::nrow(priors) == 1) {
      start_priors <- priors[1]
      sd_priors <- priors[2]
    } else if (is(priors, "data.frame") && nrow(priors) == 1) {
      start_priors <- priors[[1]]
      sd_priors <- 0
    } else if ((is(priors, "data.frame") | is(priors, "matrix")) &&
      base::nrow(priors) > 1) {
      names(priors) <- c("var", "prob")
      start_priors <- priors$var[priors$prob == max(priors$prob)]
      if (length(start_priors) > 1) {
        start_priors <- mean(start_priors)
      }
      sd_priors <- sd(priors$var)
    }
  } else {
    checks_passed <- FALSE
    failed_check <- "Incorrect format for priors"
  }

  if (checks_passed) {
    outs <- list(checks_passed, priors, start_priors, sd_priors)
    names(outs) <- c("checks_passed", "priors", "start_priors", "sd_priors")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

## helper for taking priors and calibartion to posteriors
bayesian_checks <- function(prior,
                            start_priors,
                            sd_priors,
                            params,
                            count,
                            prior_weight,
                            weight,
                            step_size,
                            bounds = c(0, Inf),
                            round_to = 1,
                            round_to_digits = 1) {
  checks_passed <- TRUE

  if ((is(prior, "matrix") && nrow(prior) == 1) || (is(prior, "numeric") &&
    length(prior) == 1)) {
    priors <- round(rnorm(count, start_priors, sd_priors) / round_to,
      digits = round_to_digits
    ) * round_to
    priors <- as.data.frame(table(priors))
    priors$priors <- as.numeric(as.character(priors$priors))
    priors$prob <- round(priors$Freq / count, digits = 3)
    priors$prob[priors$priors == bounds[2]] <-
      sum(priors$prob[priors$priors >= bounds[2]])
    priors$prob[priors$priors == bounds[1]] <-
      sum(priors$prob[priors$priors <= bounds[1]])
    priors <- priors[priors$prob > 0.000, ]
    priors <- priors[priors$priors <= bounds[2] & priors$priors >= bounds[1], ]
  } else if ((is(priors, "data.frame") | is(priors, "matrix")) &&
    nrow(prior) > 1) {
    priors <- prior[, 1:2]
    names(priors) <- c("priors", "prob")
  }

  if (is(params, "matrix")) {
    params <- data.frame(params)
    names(params) <- c("params", "prob")
  }
  calibration_count <- length(params)
  calibrated_rates <- base::as.data.frame(table(params))
  calibrated_rates$params <- as.numeric(as.character(calibrated_rates$params))
  calibrated_rates$prob <- round(calibrated_rates$Freq / calibration_count,
    digits = 3
  )

  min_rate <- min(min(priors$priors), min(calibrated_rates$params))
  max_rate <- max(max(priors$priors), max(calibrated_rates$params))

  rates <- data.frame(
    rate = round(seq(min_rate, max_rate, step_size),
      digits = round_to_digits
    ),
    prior_probability = rep(
      0,
      length(seq(
        min_rate,
        max_rate,
        step_size
      ))
    ),
    calibrated_probability =
      rep(0, length(seq(min_rate, max_rate, step_size))),
    posterior_probability =
      rep(0, length(seq(min_rate, max_rate, step_size)))
  )

  for (i in seq_len(base::nrow(rates))) {
    if (length(priors$prob[priors$priors == rates$rate[i]]) > 0) {
      rates$prior_probability[i] <- priors$prob[priors$priors == rates$rate[i]]
    }
    if (length(calibrated_rates$prob[calibrated_rates$params ==
      rates$rate[i]]) > 0) {
      rates$calibrated_probability[i] <-
        calibrated_rates$prob[calibrated_rates$params == rates$rate[i]]
    }
  }
  rates$posterior_probability <- round(rates$prior_probability * prior_weight +
    rates$calibrated_probability * weight,
  digits = 3
  )
  posterior_rates <- rates[, c(1, 4)]

  if (checks_passed) {
    outs <- list(checks_passed, rates, posterior_rates)
    names(outs) <- c("checks_passed", "rates", "posterior_rates")
    return(outs)
  }
}

bayesian_mnn_checks <- function(prior_means,
                                prior_cov_matrix,
                                calibrated_means,
                                calibrated_cov_matrix,
                                prior_weight, weight) {
  checks_passed <- TRUE
  if (length(prior_means) == length(calibrated_means) && prior_weight > 0) {
    posterior_means <- prior_means * prior_weight + calibrated_means * weight
  } else if (prior_weight == 0) {
    posterior_means <- calibrated_means
  } else {
    checks_passed <- FALSE
    failed_check <-
      "There are not enough prior_means to communte the posterior means for all
    paramaters"
  }

  if (nrow(prior_cov_matrix) == nrow(calibrated_cov_matrix) &&
    ncol(prior_cov_matrix) == ncol(calibrated_cov_matrix) &&
    prior_weight > 0) {
    posterior_cov_matrix <- prior_cov_matrix * prior_weight +
      calibrated_cov_matrix * weight
  } else if (prior_weight == 0) {
    posterior_cov_matrix <- calibrated_cov_matrix
  } else {
    checks_passed <- FALSE
    failed_check <-
      "The prior covariance matrix is not the correct dimension to match the
    calibrated covariance matrix in order to computer the posterior covariance
    matrix"
  }

  if (checks_passed) {
    outs <- list(checks_passed, posterior_means, posterior_cov_matrix)
    names(outs) <- c("checks_passed", "posterior_means", "posterior_cov_matrix")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

multispecies_checks <- function(species,
                                infected_files,
                                parameter_means,
                                parameter_cov_matrix,
                                natural_kernel_type,
                                anthropogenic_kernel_type,
                                natural_dir,
                                anthropogenic_dir,
                                model_type,
                                host_file,
                                total_populations_file,
                                temp,
                                temperature_coefficient_file,
                                precip,
                                precipitation_coefficient_file,
                                latency_period,
                                time_step,
                                season_month_start,
                                season_month_end,
                                use_lethal_temperature,
                                temperature_file,
                                lethal_temperature,
                                lethal_temperature_month,
                                mortality_on,
                                mortality_rate,
                                mortality_time_lag,
                                movements_file,
                                use_movements,
                                start_exposed,
                                quarantine_areas_file,
                                use_quarantine,
                                use_spreadrates) {
  checks_passed <- TRUE

  if (checks_passed && length(species) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for species and infected_files must be equal"
  }

  if (checks_passed && length(parameter_means) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for parameter_means and infected_files must be equal"
  }

  if (checks_passed && length(parameter_cov_matrix) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for parameter_cov_matrix and infected_files must be equal"
  }

  if (checks_passed && length(model_type) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for model_type and infected_files must be equal"
  }

  if (checks_passed && length(natural_kernel_type) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and natural_kernel_type must be equal"
  }

  if (checks_passed && length(anthropogenic_kernel_type) !=
    length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and anthropogenic_kernel_type must be equal"
  }

  if (checks_passed && length(natural_dir) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and natural_dir must be equal"
  }

  if (checks_passed && length(anthropogenic_dir) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and anthropogenic_dir must be equal"
  }

  if (checks_passed && length(host_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and host_file must be equal"
  }

  if (checks_passed && length(total_populations_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and total_populations_file must be equal"
  }

  if (checks_passed && length(temp) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and temp must be equal"
  }

  if (checks_passed && length(temperature_coefficient_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and temperature_coefficient_file must be equal"
  }

  if (checks_passed && length(precip) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and precip must be equal"
  }

  if (checks_passed && length(precipitation_coefficient_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and precipitation_coefficient_file must be equal"
  }

  if (checks_passed && length(latency_period) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and latency_period must be equal"
  }

  if (checks_passed && length(time_step) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and time_step must be equal"
  }

  if (checks_passed && length(season_month_start) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and season_month_start must be equal"
  }

  if (checks_passed && length(season_month_end) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and season_month_end must be equal"
  }

  if (checks_passed && length(use_lethal_temperature) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and use_lethal_temperature must be equal"
  }

  if (checks_passed && length(temperature_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and temperature_file must be equal"
  }

  if (checks_passed && length(lethal_temperature) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and lethal_temperature must be equal"
  }

  if (checks_passed && length(lethal_temperature_month) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and lethal_temperature_month must be equal"
  }

  if (checks_passed && length(mortality_on) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and mortality_on must be equal"
  }

  if (checks_passed && length(mortality_rate) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and mortality_rate must be equal"
  }

  if (checks_passed && length(mortality_time_lag) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and mortality_time_lag must be equal"
  }

  if (checks_passed && length(movements_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and movements_file must be equal"
  }

  if (checks_passed && length(use_movements) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and use_movements must be equal"
  }

  if (checks_passed && length(start_exposed) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and start_exposed must be equal"
  }

  if (checks_passed && length(quarantine_areas_file) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and quarantine_areas_file must be equal"
  }

  if (checks_passed && length(use_quarantine) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and use_quarantine must be equal"
  }

  if (checks_passed && length(use_spreadrates) != length(infected_files)) {
    checks_passed <- FALSE
    failed_check <-
      "Length of list for infected_files and use_spreadrates must be equal"
  }

  if (checks_passed) {
    outs <- list(checks_passed)
    names(outs) <- c("checks_passed")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

movement_checks <- function(x, rast, start_date, end_date) {
  checks_passed <- TRUE

  if (!all(file.exists(x))) {
    checks_passed <- FALSE
    failed_check <- "file does not exist"
  }

  if (checks_passed && !all((tools::file_ext(x) %in% c("csv", "txt")))) {
    checks_passed <- FALSE
    failed_check <- "file is not one of '.csv' or '.txt'"
  }

  if (checks_passed) {
    moves <- read.csv(x, header = TRUE)
    movement_from <- sp::SpatialPointsDataFrame(moves[, 1:2],
      data = moves[, c(1:2, 5:6)],
      proj4string =
        sp::CRS("+init=epsg:4326")
    )
    movement_to <- sp::SpatialPointsDataFrame(moves[, 3:4],
      data = moves[, 3:6],
      proj4string = sp::CRS("+init=epsg:4326")
    )
    movement_from <-
      suppressWarnings(sp::spTransform(movement_from, CRSobj = terra::crs(rast)))
    movement_to <-
      suppressWarnings(sp::spTransform(movement_to, CRSobj = terra::crs(rast)))
    move_from <- terra::vect(movement_from)
    move_to <- terra::vect(movement_to)
    cell_from <- terra::extract(rast, move_from, cells = TRUE)
    cell_to <- terra::extract(rast, move_to, cells = TRUE)
    rowcol_from <- terra::rowColFromCell(rast, cell_from[, 3])
    rowcol_to <- terra::rowColFromCell(rast, cell_to[, 3])
    movements <- data.frame(
      row_from = rowcol_from[, 1],
      col_from = rowcol_from[, 2],
      row_to = rowcol_to[, 1],
      col_to = rowcol_to[, 2],
      num_animals = moves$animals,
      date = moves$date
    )
    movements <- movements[!is.na(movements$row_from) &
      !is.na(movements$col_from) &
      !is.na(movements$row_to) &
      !is.na(movements$col_to) &
      !is.na(movements$num_animals) &
      !is.na(movements$date), ]
    movements <- movements[movements$num_animals > 0, ]
    movements$date <- paste("'", movements$date, "'", sep = "")
    movements$date <- lubridate::mdy(movements$date)
    duration <- lubridate::interval(start_date, end_date)
    movements <- movements[movements$date %within% duration, ]
    movements <- movements[order(movements$date, decreasing = FALSE), ]
    movements_dates <- as.character(movements$date)
    movements_r <- movements
    # subtract 1 from the movement index to account for r indexing starts at 1
    # and C++ starts at 0
    movements[, 1:4] <- movements[, 1:4] - 1
    movements <- unname(movements)
    movement2 <- as.matrix(movements[, 1:5])
    movement2 <- unname(movement2, force = TRUE)
    movement <- list()
    # movements_date
    for (i in seq_len(nrow(movement2))) {
      movement[[i]] <- movement2[i, 1:5]
    }

    movement <- unname(movement)
  }

  if (checks_passed) {
    outs <- list(checks_passed, movement, movements_dates, movements_r)
    names(outs) <-
      c("checks_passed", "movements", "movements_dates", "movements_r")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}

parameter_checks <- function(n, parameter_means, parameter_cov_matrix) {
  checks_passed <- TRUE

  if (nrow(parameter_cov_matrix) != 6 | ncol(parameter_cov_matrix) != 6) {
    checks_passed <- FALSE
    failed_check <- "parameter covariance matrix is not 6 x 6"
  }

  if (length(parameter_means) != 6) {
    checks_passed <- FALSE
    failed_check <- "parameter means is not a vector of length 6"
  }

  if (checks_passed) {
    parameters <- data.frame(MASS::mvrnorm(
      n, parameter_means,
      parameter_cov_matrix
    ))
  }

  if (checks_passed) {
    outs <- list(checks_passed, parameters)
    names(outs) <- c("checks_passed", "parameters")
    return(outs)
  } else {
    outs <- list(checks_passed, failed_check)
    names(outs) <- c("checks_passed", "failed_check")
    return(outs)
  }
}
