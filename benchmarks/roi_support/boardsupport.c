/* Copyright (C) 2019 Clemson University

   Contributor Ola Jeppsson <ola.jeppsson@gmail.com>

   This file is part of Embench.

   SPDX-License-Identifier: GPL-3.0-or-later */

#include <support.h>
#include "gem5/m5ops.h"

void
initialise_board ()
{
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
start_trigger ()
{
  m5_reset_stats(0, 0);
}

void __attribute__ ((noinline)) __attribute__ ((externally_visible))
stop_trigger ()
{
  m5_dump_stats(0, 0);
}
