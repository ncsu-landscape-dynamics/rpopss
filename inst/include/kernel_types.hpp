/*
 * PoPS model - disperal kernel types
 *
 * Copyright (C) 2015-2020 by the authors.
 *
 * Authors: Vaclav Petras (wenzeslaus gmail com)
 *          Chris Jones (cjones1688 gmail com)
 *          Anna Petrasova (kratochanna gmail com)
 *          Zexi Chen (zchen22 ncsu edu)
 *
 * The code contained herein is licensed under the GNU General Public
 * License. You may obtain a copy of the GNU General Public License
 * Version 2 or later at the following locations:
 *
 * http://www.opensource.org/licenses/gpl-license.html
 * http://www.gnu.org/copyleft/gpl.html
 */

/*! \file kernel_types.hpp
 *
 * \brief Kernel types enum and helper functions.
 *
 * This file contains general functionality shared in general by all
 * kernels.
 *
 * An alternative implementation would be for each class to maintain its
 * own enum of supported kernels, potentially creating a hierarchy of
 * kernel types and subtypes. This would avoid the need for a separate
 * header file such as this one due to all kernels potentially
 * depending on it which prevents us from having it in the same header
 * file like the main or default interface. However, this is easier for
 * actually using the library as all kernel types are resolved by one
 * function and one variable in the user code.
 */

#ifndef POPS_KERNEL_TYPES_HPP
#define POPS_KERNEL_TYPES_HPP

#include <string>
#include <stdexcept>

namespace pops {

/*! Type of dispersal kernel
 *
 * This contains all kernels supported by the PoPS library
 * and it may be further used by the various classes which support
 * more than one kernel type.
 *
 * None is to represent no spread in the given context, e.g., no long
 * distance spread.
 */
enum class DispersalKernelType
{
    Cauchy,  //!< Cauchy dispersal kernel
    Exponential,  //!< Exponential dispersal kernel
    Uniform,  //!< Random uniform dispersal kernel
    DeterministicNeighbor,  //!< Deterministic immediate neighbor dispersal kernel
    PowerLaw,  //!< Power law dispersal kernel
    HyperbolicSecant,  //!< Hyperbolic secant dispersal kernel
    Gamma,  //!< Gamma dispersal kernel
    ExponentialPower,  //!< Exponential power dispersal kernel
    Weibull,  //!< Weibull dispersal kernel
    Normal,  //!< Normal dispersal kernel
    LogNormal,  //!< Log-normal dispersal kernel
    Logistic,  //!< Logistic dispersal kernel
    None,  //!< No dispersal kernel (no spread)
};

/*! Get a corresponding enum value for a string which is a kernel name.
 *
 * Throws an std::invalid_argument exception if the values was not
 * found or is not supported (which is the same thing).
 */
inline DispersalKernelType kernel_type_from_string(const std::string& text)
{
    if (text == "cauchy" || text == "Cauchy")
        return DispersalKernelType::Cauchy;
    else if (text == "exponential" || text == "Exponential")
        return DispersalKernelType::Exponential;
    else if (text == "uniform" || text == "Uniform")
        return DispersalKernelType::Uniform;
    else if (
        text == "deterministic neighbor" || text == "deterministic-neighbor"
        || text == "Deterministic-neighbor" || text == "Deterministic-Neighbor"
        || text == "Deterministic neighbor" || text == "Deterministic Neighbor")
        return DispersalKernelType::DeterministicNeighbor;
    else if (
        text == "power law" || text == "power-law" || text == "Power-law"
        || text == "Power-Law" || text == "Power Law" || text == "Power law")
        return DispersalKernelType::PowerLaw;
    else if (
        text == "hyperbolic secant" || text == "hyperbolic-secant"
        || text == "Hyperbolic-secant" || text == "Hyperbolic-Secant"
        || text == "Hyperbolic secant" || text == "Hyperbolic Secant")
        return DispersalKernelType::HyperbolicSecant;
    else if (text == "gamma" || text == "Gamma")
        return DispersalKernelType::Gamma;
    else if (
        text == "exponential power" || text == "exponential-power"
        || text == "Exponential-power" || text == "Exponential-Power"
        || text == "Exponential power" || text == "Exponential Power")
        return DispersalKernelType::ExponentialPower;
    else if (text == "weibull" || text == "Weibull")
        return DispersalKernelType::Weibull;
    else if (text == "normal" || text == "Normal")
        return DispersalKernelType::Normal;
    else if (
        text == "log normal" || text == "log-normal" || text == "Log-normal"
        || text == "Log-Normal" || text == "Log normal" || text == "Log Normal")
        return DispersalKernelType::LogNormal;
    else if (text == "logistic" || text == "Logistic")
        return DispersalKernelType::Logistic;
    else if (text == "none" || text == "None" || text == "NONE" || text.empty())
        return DispersalKernelType::None;
    else
        throw std::invalid_argument(
            "kernel_type_from_string: Invalid"
            " value '"
            + text + "' provided");
}

/*! Overload which allows to pass C-style string which is nullptr (NULL)
 */
inline DispersalKernelType kernel_type_from_string(const char* text)
{
    // call the string version
    return kernel_type_from_string(text ? std::string(text) : std::string());
}

}  // namespace pops

#endif  // POPS_KERNEL_TYPES_HPP
