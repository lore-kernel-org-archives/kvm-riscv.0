From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Apr 2024 09:47:48 +0530
Subject: [PATCH v2 2/2] perf kvm/riscv: Port perf kvm stat to RISC-V
In-Reply-To: <20240415031131.23443-3-liangshenlin@eswincomputing.com>
References: <20240415031131.23443-1-liangshenlin@eswincomputing.com> <20240415031131.23443-3-liangshenlin@eswincomputing.com>
Message-ID: <CAAhSdy2Lu_qdF+FqJGxZYqDHgNQCt7vkWtrV0bUOzzmKixALRw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 15, 2024 at 8:45?AM Shenlin Liang
<liangshenlin@eswincomputing.com> wrote:
>
> 'perf kvm stat report/record' generates a statistical analysis of KVM
> events and can be used to analyze guest exit reasons.
>
> "report" reports statistical analysis of guest exit events.
>
> To record kvm events on the host:
>  # perf kvm stat record -a
>
> To report kvm VM EXIT events:
>  # perf kvm stat report --event=vmexit
>
> Signed-off-by: Shenlin Liang <liangshenlin@eswincomputing.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

@Peter Zijlstra, is it okay to take this through the KVM RISC-V tree ?

Regards,
Anup

> ---
>  tools/perf/arch/riscv/Makefile                |  1 +
>  tools/perf/arch/riscv/util/Build              |  1 +
>  tools/perf/arch/riscv/util/kvm-stat.c         | 78 +++++++++++++++++++
>  .../arch/riscv/util/riscv_exception_types.h   | 41 ++++++++++
>  4 files changed, 121 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
>  create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
>
> diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
> index a8d25d005207..e1e445615536 100644
> --- a/tools/perf/arch/riscv/Makefile
> +++ b/tools/perf/arch/riscv/Makefile
> @@ -3,3 +3,4 @@ PERF_HAVE_DWARF_REGS := 1
>  endif
>  PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
>  PERF_HAVE_JITDUMP := 1
> +HAVE_KVM_STAT_SUPPORT := 1
> \ No newline at end of file
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 603dbb5ae4dc..d72b04f8d32b 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -1,5 +1,6 @@
>  perf-y += perf_regs.o
>  perf-y += header.o
>
> +perf-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
>  perf-$(CONFIG_DWARF) += dwarf-regs.o
>  perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> diff --git a/tools/perf/arch/riscv/util/kvm-stat.c b/tools/perf/arch/riscv/util/kvm-stat.c
> new file mode 100644
> index 000000000000..db7183e0f09f
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/kvm-stat.c
> @@ -0,0 +1,78 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Arch specific functions for perf kvm stat.
> + *
> + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + */
> +#include <errno.h>
> +#include <memory.h>
> +#include "../../../util/evsel.h"
> +#include "../../../util/kvm-stat.h"
> +#include "riscv_exception_types.h"
> +#include "debug.h"
> +
> +define_exit_reasons_table(riscv_exit_reasons, kvm_riscv_exception_class);
> +
> +const char *kvm_exit_reason = "scause";
> +const char *kvm_entry_trace = "kvm:kvm_entry";
> +const char *kvm_exit_trace = "kvm:kvm_exit";
> +
> +const char *kvm_events_tp[] = {
> +       "kvm:kvm_entry",
> +       "kvm:kvm_exit",
> +       NULL,
> +};
> +
> +static void event_get_key(struct evsel *evsel,
> +                         struct perf_sample *sample,
> +                         struct event_key *key)
> +{
> +       key->info = 0;
> +       key->key = evsel__intval(evsel, sample, kvm_exit_reason);
> +       key->key = (int)key->key;
> +       key->exit_reasons = riscv_exit_reasons;
> +}
> +
> +static bool event_begin(struct evsel *evsel,
> +                       struct perf_sample *sample __maybe_unused,
> +                       struct event_key *key __maybe_unused)
> +{
> +       return evsel__name_is(evsel, kvm_entry_trace);
> +}
> +
> +static bool event_end(struct evsel *evsel,
> +                     struct perf_sample *sample,
> +                     struct event_key *key)
> +{
> +       if (evsel__name_is(evsel, kvm_exit_trace)) {
> +               event_get_key(evsel, sample, key);
> +               return true;
> +       }
> +       return false;
> +}
> +
> +static struct kvm_events_ops exit_events = {
> +       .is_begin_event = event_begin,
> +       .is_end_event   = event_end,
> +       .decode_key     = exit_event_decode_key,
> +       .name           = "VM-EXIT"
> +};
> +
> +struct kvm_reg_events_ops kvm_reg_events_ops[] = {
> +       {
> +               .name   = "vmexit",
> +               .ops    = &exit_events,
> +       },
> +       { NULL, NULL },
> +};
> +
> +const char * const kvm_skip_events[] = {
> +       NULL,
> +};
> +
> +int cpu_isa_init(struct perf_kvm_stat *kvm, const char *cpuid __maybe_unused)
> +{
> +       kvm->exit_reasons_isa = "riscv64";
> +       return 0;
> +}
> diff --git a/tools/perf/arch/riscv/util/riscv_exception_types.h b/tools/perf/arch/riscv/util/riscv_exception_types.h
> new file mode 100644
> index 000000000000..2e42150f72b2
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/riscv_exception_types.h
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RISCV exception types
> + *
> + * Copyright 2024 Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + */
> +#ifndef ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> +#define ARCH_PERF_RISCV_EXCEPTION_TYPES_H
> +
> +#define EXC_INST_MISALIGNED 0
> +#define EXC_INST_ACCESS 1
> +#define EXC_INST_ILLEGAL 2
> +#define EXC_BREAKPOINT 3
> +#define EXC_LOAD_MISALIGNED 4
> +#define EXC_LOAD_ACCESS 5
> +#define EXC_STORE_MISALIGNED 6
> +#define EXC_STORE_ACCESS 7
> +#define EXC_SYSCALL 8
> +#define EXC_HYPERVISOR_SYSCALL 9
> +#define EXC_SUPERVISOR_SYSCALL 10
> +#define EXC_INST_PAGE_FAULT 12
> +#define EXC_LOAD_PAGE_FAULT 13
> +#define EXC_STORE_PAGE_FAULT 15
> +#define EXC_INST_GUEST_PAGE_FAULT 20
> +#define EXC_LOAD_GUEST_PAGE_FAULT 21
> +#define EXC_VIRTUAL_INST_FAULT 22
> +#define EXC_STORE_GUEST_PAGE_FAULT 23
> +
> +#define EXC(x) {EXC_##x, #x }
> +
> +#define kvm_riscv_exception_class                                           \
> +       (EXC(INST_MISALIGNED), EXC(INST_ACCESS), EXC(INST_ILLEGAL),         \
> +        EXC(BREAKPOINT), EXC(LOAD_MISALIGNED), EXC(LOAD_ACCESS),           \
> +        EXC(STORE_MISALIGNED), EXC(STORE_ACCESS), EXC(SYSCALL),            \
> +        EXC(HYPERVISOR_SYSCALL), EXC(SUPERVISOR_SYSCALL),                  \
> +        EXC(INST_PAGE_FAULT), EXC(LOAD_PAGE_FAULT), EXC(STORE_PAGE_FAULT), \
> +        EXC(INST_GUEST_PAGE_FAULT), EXC(LOAD_GUEST_PAGE_FAULT),            \
> +        EXC(VIRTUAL_INST_FAULT), EXC(STORE_GUEST_PAGE_FAULT))
> +
> +#endif /* ARCH_PERF_RISCV_EXCEPTION_TYPES_H */
> --
> 2.37.2
>

