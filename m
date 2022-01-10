From: Jiangyifei <jiangyifei@huawei.com>
Date: Mon, 10 Jan 2022 01:33:20 +0000
Subject: [PATCH v3 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
In-Reply-To: <CAKmqyKOtOFmy1_9W785DZiFCc=Us6O_pVpLsBOyXOk32zansnA@mail.gmail.com>
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-9-jiangyifei@huawei.com>
 <CAKmqyKOtOFmy1_9W785DZiFCc=Us6O_pVpLsBOyXOk32zansnA@mail.gmail.com>
Message-ID: <0a655978156646baa83d41446a0898ac@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Alistair Francis [mailto:alistair23 at gmail.com]
> Sent: Thursday, January 6, 2022 6:04 AM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: qemu-devel at nongnu.org Developers <qemu-devel@nongnu.org>; open
> list:RISC-V <qemu-riscv@nongnu.org>; kvm-riscv at lists.infradead.org; open
> list:Overall <kvm@vger.kernel.org>; libvir-list at redhat.com; Anup Patel
> <anup.patel@wdc.com>; Palmer Dabbelt <palmer@dabbelt.com>; Alistair
> Francis <Alistair.Francis@wdc.com>; Bin Meng <bin.meng@windriver.com>;
> Fanliang (EulerOS) <fanliang@huawei.com>; Wubin (H)
> <wu.wubin@huawei.com>; Wanghaibin (D) <wanghaibin.wang@huawei.com>;
> wanbo (G) <wanbo13@huawei.com>; limingwang (A)
> <limingwang@huawei.com>
> Subject: Re: [PATCH v3 08/12] target/riscv: Handle KVM_EXIT_RISCV_SBI exit
> 
> On Tue, Dec 21, 2021 at 3:41 AM Yifei Jiang via <qemu-devel@nongnu.org>
> wrote:
> >
> > Use char-fe to handle console sbi call, which implement early console
> > io while apply 'earlycon=sbi' into kernel parameters.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Mingwang Li <limingwang@huawei.com>
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  target/riscv/kvm.c                 | 43 +++++++++++++++++-
> >  target/riscv/sbi_ecall_interface.h | 72
> > ++++++++++++++++++++++++++++++
> >  2 files changed, 114 insertions(+), 1 deletion(-)  create mode 100644
> > target/riscv/sbi_ecall_interface.h
> >
> > diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c index
> > 0027f11f45..4d08669c81 100644
> > --- a/target/riscv/kvm.c
> > +++ b/target/riscv/kvm.c
> > @@ -38,6 +38,9 @@
> >  #include "qemu/log.h"
> >  #include "hw/loader.h"
> >  #include "kvm_riscv.h"
> > +#include "sbi_ecall_interface.h"
> > +#include "chardev/char-fe.h"
> > +#include "semihosting/console.h"
> >
> >  static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type,
> > uint64_t idx)  { @@ -365,9 +368,47 @@ bool
> > kvm_arch_stop_on_emulation_error(CPUState *cs)
> >      return true;
> >  }
> >
> > +static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run) {
> > +    int ret = 0;
> > +    unsigned char ch;
> > +    switch (run->riscv_sbi.extension_id) {
> > +    case SBI_EXT_0_1_CONSOLE_PUTCHAR:
> > +        ch = run->riscv_sbi.args[0];
> > +        qemu_semihosting_log_out((const char *)&ch, sizeof(ch));
> 
> Hmmm... We print to the semihosting
> 
> > +        break;
> > +    case SBI_EXT_0_1_CONSOLE_GETCHAR:
> > +        ret = qemu_chr_fe_read_all(serial_hd(0)->be, &ch,
> > + sizeof(ch));
> 
> but then read from the first serial device.
> 
> That seems a little strange. Would it be better to just print to serial as well?
> 
> Alistair
> 

Hm...I also think so. It will be modified in the next series.

Yifei

> > +        if (ret == sizeof(ch)) {
> > +            run->riscv_sbi.args[0] = ch;
> > +        } else {
> > +            run->riscv_sbi.args[0] = -1;
> > +        }
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP,
> > +                      "%s: un-handled SBI EXIT, specific reasons
> is %lu\n",
> > +                      __func__, run->riscv_sbi.extension_id);
> > +        ret = -1;
> > +        break;
> > +    }
> > +    return ret;
> > +}
> > +
> >  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)  {
> > -    return 0;
> > +    int ret = 0;
> > +    switch (run->exit_reason) {
> > +    case KVM_EXIT_RISCV_SBI:
> > +        ret = kvm_riscv_handle_sbi(cs, run);
> > +        break;
> > +    default:
> > +        qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
> > +                      __func__, run->exit_reason);
> > +        ret = -1;
> > +        break;
> > +    }
> > +    return ret;
> >  }
> >
> >  void kvm_riscv_reset_vcpu(RISCVCPU *cpu) diff --git
> > a/target/riscv/sbi_ecall_interface.h
> > b/target/riscv/sbi_ecall_interface.h
> > new file mode 100644
> > index 0000000000..fb1a3fa8f2
> > --- /dev/null
> > +++ b/target/riscv/sbi_ecall_interface.h
> > @@ -0,0 +1,72 @@
> > +/*
> > + * SPDX-License-Identifier: BSD-2-Clause
> > + *
> > + * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> > + *
> > + * Authors:
> > + *   Anup Patel <anup.patel@wdc.com>
> > + */
> > +
> > +#ifndef __SBI_ECALL_INTERFACE_H__
> > +#define __SBI_ECALL_INTERFACE_H__
> > +
> > +/* clang-format off */
> > +
> > +/* SBI Extension IDs */
> > +#define SBI_EXT_0_1_SET_TIMER           0x0
> > +#define SBI_EXT_0_1_CONSOLE_PUTCHAR     0x1
> > +#define SBI_EXT_0_1_CONSOLE_GETCHAR     0x2
> > +#define SBI_EXT_0_1_CLEAR_IPI           0x3
> > +#define SBI_EXT_0_1_SEND_IPI            0x4
> > +#define SBI_EXT_0_1_REMOTE_FENCE_I      0x5
> > +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA   0x6
> > +#define SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID 0x7
> > +#define SBI_EXT_0_1_SHUTDOWN            0x8
> > +#define SBI_EXT_BASE                    0x10
> > +#define SBI_EXT_TIME                    0x54494D45
> > +#define SBI_EXT_IPI                     0x735049
> > +#define SBI_EXT_RFENCE                  0x52464E43
> > +#define SBI_EXT_HSM                     0x48534D
> > +
> > +/* SBI function IDs for BASE extension*/
> > +#define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> > +#define SBI_EXT_BASE_GET_IMP_ID         0x1
> > +#define SBI_EXT_BASE_GET_IMP_VERSION    0x2
> > +#define SBI_EXT_BASE_PROBE_EXT          0x3
> > +#define SBI_EXT_BASE_GET_MVENDORID      0x4
> > +#define SBI_EXT_BASE_GET_MARCHID        0x5
> > +#define SBI_EXT_BASE_GET_MIMPID         0x6
> > +
> > +/* SBI function IDs for TIME extension*/
> > +#define SBI_EXT_TIME_SET_TIMER          0x0
> > +
> > +/* SBI function IDs for IPI extension*/
> > +#define SBI_EXT_IPI_SEND_IPI            0x0
> > +
> > +/* SBI function IDs for RFENCE extension*/
> > +#define SBI_EXT_RFENCE_REMOTE_FENCE_I       0x0
> > +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA    0x1
> > +#define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA   0x3
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA   0x5
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
> > +
> > +/* SBI function IDs for HSM extension */
> > +#define SBI_EXT_HSM_HART_START          0x0
> > +#define SBI_EXT_HSM_HART_STOP           0x1
> > +#define SBI_EXT_HSM_HART_GET_STATUS     0x2
> > +
> > +#define SBI_HSM_HART_STATUS_STARTED     0x0
> > +#define SBI_HSM_HART_STATUS_STOPPED     0x1
> > +#define SBI_HSM_HART_STATUS_START_PENDING   0x2
> > +#define SBI_HSM_HART_STATUS_STOP_PENDING    0x3
> > +
> > +#define SBI_SPEC_VERSION_MAJOR_OFFSET   24
> > +#define SBI_SPEC_VERSION_MAJOR_MASK     0x7f
> > +#define SBI_SPEC_VERSION_MINOR_MASK     0xffffff
> > +#define SBI_EXT_VENDOR_START            0x09000000
> > +#define SBI_EXT_VENDOR_END              0x09FFFFFF
> > +/* clang-format on */
> > +
> > +#endif
> > --
> > 2.19.1
> >
> >
